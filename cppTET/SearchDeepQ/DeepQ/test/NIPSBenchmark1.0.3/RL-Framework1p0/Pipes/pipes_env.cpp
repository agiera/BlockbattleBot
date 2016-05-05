#include "pipes_env.h"

void env_cleanup();
void agent_cleanup();

Task_specification env_init(char* inpath)
{
    int temp_status, temp_status2;
    char path[100];
    char exe_name[100];
	char lang[100];
	char tmp[100];
        
	exe_name[0] = '\0';
	lang[0] = '\0';
	int error;
	
    ro.o = o;
	unlink("/tmp/RL_pipe_env_in");
    env_status = mknod("/tmp/RL_pipe_env_in",S_IFIFO | 0666, 0);
	if (env_status == -1)
    {
        perror("pipe");
        exit(1);
    }
	unlink("/tmp/RL_pipe_env_out");
	env_status = mknod("/tmp/RL_pipe_env_out",S_IFIFO | 0666, 0);
    if (env_status == -1)
    {
        perror("pipe");
        exit(1);
    }    
    
    /* Spawn child */
    env_status=fork();
    if (env_status < 0)
    {
        perror("fork");
        exit(1);
    }
    else if (env_status == 0) 
    {

        parse_config_env(exe_name,lang);
		sprintf(path,"%s/",dirname(inpath));
		if (strcmp(lang,"java") == 0)
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
			error = execlp("java", "java", "env_pipe_handler", "/tmp/RL_pipe_env_in","/tmp/RL_pipe_env_out", exe_name, NULL);
			if(error == -1)
			{
				printf("\nERROR in Env line of configuration file, config.txt\n");
				exit(1);
			}        
		}
		else
		{	

		fprintf(stderr,"\nUsing C/C++\n");
		strcat(path,exe_name);
        fprintf(stderr,"path is = %s\n",path);
        fprintf(stderr,"exe is = %s\n",exe_name);
        error = execl(path,exe_name,"/tmp/RL_pipe_env_in","/tmp/RL_pipe_env_out", NULL);
		if(error == -1)
		{
			printf("\nERROR in Env line of configuration file, config.txt\n");
			exit(1);
		}		
		
		}
        perror("execl");
    }
    else
    {

		int status0;
		sleep(3);
		waitpid(env_status,&status0,WNOHANG);
		if (WIFEXITED(status0) && WEXITSTATUS(status0))
		{
			printf("Exiting...\n\n");
			exit(1);
		}
		
		env_file_in = open("/tmp/RL_pipe_env_in",O_WRONLY);
		env_file_out = open("/tmp/RL_pipe_env_out",O_RDONLY);
		
        if (write(env_file_in, "init\n", strlen("init\n")) == -1)
		perror("pipe writing:");
		fsync(env_file_in);
		read_spec(ts);
		

		
        return ts;

	
	}
        
}

Observation env_start()
{ 
    write(env_file_in, "start\n", strlen("start\n"));
    read_observation(o);

    return o;
}

Reward_observation env_step(Action act)
{   
    write(env_file_in, "step\n", strlen("step\n"));

    write_action(act);    
    read_observation(o);	
    ro.r = read_reward();
    ro.terminal = read_terminal();


    return ro;
}


State_key env_get_state()
{
    write(env_file_in, "getstate\n", strlen("getstate\n"));
	read_observation(sk);
	if (strcmp(sk,"NOTIMPLEMENTED\n") == 0)
	{
	
		printf("\n\nERROR: Get and Set state methods are either not defined or flags are not set in the common types file to allow you to call them!! \nExiting....\n\n");

		env_cleanup();
		agent_cleanup();
		exit(0);
	}
	return sk;
	
}
Random_seed_key env_get_random_seed()
{
    write(env_file_in, "getrandom\n", strlen("getrandom\n"));
	read_observation(rsk);
	if (strcmp(sk,"NOTIMPLEMENTED\n") == 0)
	{
		printf("\n\nERROR: Get and Set state methods are either not defined or flags are not set in the common types file to allow you to call them!! \nExiting....\n\n");

		env_cleanup();
		agent_cleanup();
		exit(0);
	}
	return rsk;
}
void env_set_state(State_key sk0)
{
    write(env_file_in, "setstate\n", strlen("setstate\n"));
	write_seed(sk0);
	read_observation(sk);
	if (strcmp(sk,"NOTIMPLEMENTED\n") == 0)
	{

		printf("\n\nERROR: Get and Set random methods are either not defined or flags are not set in the common types file to allow you to call them!! \nExiting....\n\n");

		env_cleanup();
		agent_cleanup();
		exit(0);
	}
}
void env_set_random_seed(Random_seed_key rsk0)
{
    write(env_file_in, "setrandom\n", strlen("setrandom\n"));
	write_seed(rsk0);
	read_observation(sk);
	if (strcmp(sk,"NOTIMPLEMENTED\n") == 0)
	{
	
		printf("\n\nERROR: Get and Set random methods are either not defined or flags are not set in the common types file to allow you to call them!! \nExiting....\n\n");

		env_cleanup();
		agent_cleanup();
		exit(0);
	}
}

void env_cleanup()
{
    write(env_file_in, "cleanup\n", strlen("cleanup\n"));
    waitpid(env_status,NULL,0);
	close(env_file_in);
	close(env_file_out);
	unlink("/tmp/RL_pipe_env_in");
	unlink("/tmp/RL_pipe_env_out");
}    

char* env_get_name()
{
    write(env_file_in, "getname\n", strlen("getname\n"));
	read_observation(env_name);
	if (strcmp(env_name,"NOTIMPLEMENTED\n") == 0)
	{
		printf("\n\nERROR: Get name method is either not defined or flags are not set in the common types file to allow you to call it!! \nExiting....\n\n");

		env_cleanup();
		agent_cleanup();
		exit(0);
	}
	// Hack!  The pipes adds a newline character to the end of the name
	env_name[strlen(env_name)-1] = '\0';
	// Hack! The pipes adds a space character to the beginning of the name
	return env_name+1;
}

void write_action(Action a)
{

	sprintf(pipe_env_buf,"%s\n",(const char*)a);
    write(env_file_in, pipe_env_buf, strlen(pipe_env_buf));
    
}

void write_seed(char* buf)
{
	sprintf(pipe_env_buf,"%s\n",(const char*)buf);
    write(env_file_in, pipe_env_buf, strlen(pipe_env_buf));
}
  
void read_observation(char* buf)          
{
    int i = 0;

    buf[0] = '\0';

    read(env_file_out, &(buf[i]), 1);
    while(buf[i] != '\n')
    {
		
        read(env_file_out, &(buf[++i]), 1);
    }
	buf[++i] = '\0';

}
 
void read_spec(char* buf)
{
    int i = 0;

    buf[0] = '\0';

    read(env_file_out, &(buf[i]), 1);
    while(buf[i] != '\n')
    {
        read(env_file_out, &(buf[++i]), 1);
    }    
	buf[++i] = '\0';
}

Reward read_reward()          
{
    int i = 0;
    Reward rr;

    pipe_env_buf[0] = '\0';

    read(env_file_out, &(pipe_env_buf[i]), 1);
    while(pipe_env_buf[i] != '\n')
    {
        read(env_file_out, &(pipe_env_buf[++i]), 1);
	}
	pipe_env_buf[++i] = '\0';

    int n = sscanf(pipe_env_buf,"%lf",&rr);

    return rr;
}
    
bool read_terminal()          
{
    int i = 0;
    bool term;

    pipe_env_buf[0] = '\0';

    read(env_file_out, &(pipe_env_buf[i]), 1);
    while(pipe_env_buf[i] != '\n')
    {
        read(env_file_out, &(pipe_env_buf[++i]), 1);
    }
	pipe_env_buf[++i] = '\0';

    sscanf(pipe_env_buf,"%d",&term);
    return term;
}

void parse_config_env(char* value,char* lang)
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
            if(strcmp(name,"env") ==0)
            {
				while (c == ' ' || c == '=')
					c = fgetc(f);
				i = 0;
                while(c!= '\n') 
				{
					value[i] = c;
					i++;
                    c = fgetc(f);
				}
				value[i] = '\0';
			}

			if(strcmp(name,"env_language") ==0)
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
				while (c != '\n')
					c = fgetc(f);
            }
            c = fgetc(f);
            i = 0;
			
        }

}
