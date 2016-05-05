#include "pipes_agent.h"
#include <stdlib.h>
void env_cleanup();
void agent_cleanup();

#define PIPE_AGENT_IN "/tmp/RL_pipe_agent_in"
#define PIPE_AGENT_OUT "/tmp/RL_pipe_agent_out"

void agent_init(char* ts, char* inpath)
{
    int temp_status, temp_status2;
    char path[1000];
    char exe_name[1000];
	char lang[1000];
	char tmp[1000];
	int error;
	
	exe_name[0] = '\0';
	lang[0] = '\0';
	
	unlink(PIPE_AGENT_IN);
	agent_status = mknod(PIPE_AGENT_IN, S_IFIFO | 0666, 0);
    if (agent_status == -1)
    {
        perror("pipe");
        exit(1);
    }
	unlink(PIPE_AGENT_OUT);
	agent_status = mknod(PIPE_AGENT_OUT, S_IFIFO | 0666, 0);
    if (agent_status == -1)
    {
        perror("pipe");
        exit(1);
    }   
    
    agent_status=fork();
    if (agent_status < 0)
    {
        perror("fork");
        exit(1);
    }
    else if (agent_status == 0) 
    {
        parse_config(exe_name,lang);
		sprintf(path,"%s/",dirname(inpath));

		if(strcmp(lang,"java") == 0)
        {
			strcat(path,dirname(exe_name));
			if (chdir(path) < 0)
			{
				perror("chdir");
				exit(1);
			}
			fprintf(stderr,"\nUsing Java\n");
			fprintf(stderr,"path is = %s\n",path);
			fprintf(stderr,"exe is = %s\n",exe_name);
			
			error = execlp("java","java", "agent_pipe_handler", PIPE_AGENT_IN, PIPE_AGENT_OUT, exe_name, NULL);
			if(error == -1)
			{
				printf("\nERROR in Agent line of configuration file, config.txt\n");
				exit(1);
			}
		}
		else
		{	
			fprintf(stderr,"\nUsing C/C++\n");

			strcat(path,exe_name);
			fprintf(stderr,"path is = %s\n",path);
			fprintf(stderr,"exe is = %s\n",exe_name);
			error = execl(path,exe_name, PIPE_AGENT_IN, PIPE_AGENT_OUT, NULL);
			if(error == -1)
			{
				printf("\nERROR in Agent line of configuration file, config.txt\n");
				exit(1);
			}
		}
        perror("execl");
    }
    else
    {
		int status;
		sleep(3);
		waitpid(agent_status,&status,WNOHANG);
		if (WIFEXITED(status))
		{
			printf("Exiting...\n\n");
			env_cleanup();
			exit(1);
		}
		agent_file_in = open(PIPE_AGENT_IN,O_WRONLY);
		agent_file_out = open(PIPE_AGENT_OUT,O_RDONLY);

        write(agent_file_in, "init\n", strlen("init\n"));
        write(agent_file_in, ts, strlen(ts));
        write(agent_file_in, "\n", strlen("\n"));
    }
}

Action agent_start(Observation o)
{ 
    write(agent_file_in, "start\n", strlen("start\n"));
    write_state(o);

    read_action(pipe_act);
    return pipe_act;
}

Action agent_step(Reward r, Observation o)
{ 
    write(agent_file_in, "step\n", strlen("step\n"));

    write_state(o);
	
    write_reward(r);
    read_action(pipe_act);
    return pipe_act;
}

void agent_end(Reward reward)
{
    write(agent_file_in, "end\n", strlen("end\n"));
    write_reward(reward);
} 
void agent_cleanup()
{
    write(agent_file_in, "cleanup\n", strlen("cleanup\n"));
    waitpid(agent_status,NULL,0);
	close(agent_file_in);
	close(agent_file_out);
	unlink(PIPE_AGENT_IN);
	unlink(PIPE_AGENT_OUT);	
}    

char* agent_get_name()
{
    write(agent_file_in, "getname\n", strlen("getname\n"));
	read_action(agent_name);
	if (strcmp(agent_name,"NOTIMPLEMENTED\n") == 0)
	{
		printf("\n\nERROR: Get name method is either not defined or flags are not set in the common types file to allow you to call it!! \nExiting....\n\n");

		env_cleanup();
		agent_cleanup();
		exit(0);
	}
	// Hack!  The pipes adds a newline character to the end of the name
	agent_name[strlen(agent_name)-1] = '\0';
	// Hack!  The pipes adds a space character to the beginning of the name
	return agent_name+1;
}

void write_state(Observation o)
{    
    write(agent_file_in, o, strlen(o));
    write(agent_file_in, "\n", strlen("\n"));
}

void write_reward(Reward r)
{
    char re[100];
    
    sprintf(re,"%lf",r);
    write(agent_file_in, re, strlen(re));
    write(agent_file_in, "\n", strlen("\n"));
    
}    
  
void read_action(char* buf)          
{
    int i = 0;
    buf[0] = '\0';


    read(agent_file_out, &(buf[i]), 1);
    while(buf[i] != '\n')
    {
        read(agent_file_out, &(buf[++i]), 1);
    }

    
}
void parse_config(char* value, char* lang)
{


        int i=0;
        FILE* f = fopen("config.txt","r");
        if (f == NULL)
            fprintf(stderr,"%s\n",strerror(errno));

        char name[100];

        char c = fgetc(f);
        while(c != EOF && (strlen(lang) <=0 || strlen(value) <=0))
        {
            while(c!= ' ')
            {
                name[i] = tolower(c);
                i++;
                c = fgetc(f);
            }
            name[i] = '\0';
            if(strcmp(name,"agent") ==0)
            {
                while(c == ' ' || c == '=')
                    c = fgetc(f);

                i = 0;
                while(c!= '\n' )
                {
                    value[i] = c;
                    i++;
                    c = fgetc(f);
                }
                value[i] = '\0';
            }
            if(strcmp(name,"agent_language") ==0)
            {

                while(c == ' ' || c == '=')
                    c = fgetc(f);

                i = 0;
                while(c!= '\n' )
                {
                    lang[i] = tolower(c);
                    i++;
                    c = fgetc(f);
                }
                lang[i] = '\0';
            }
            else
            {
                while(c!= '\n')
                    c = fgetc(f);
            }
            c = fgetc(f);
            i = 0;
        }

}
