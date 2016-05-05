#include <sys/types.h> 
#include <sys/stat.h>
#include <sys/wait.h> 
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h> 
#include <errno.h>
#include <libgen.h>
#include <fcntl.h>
#include <ctype.h>

#include "Pipecommon.h"

     
#ifndef PIPE_ENV_H
#define PIPE_ENV_H

char o[100000];
Reward_observation ro;
char sk[100000];
char rsk[10000];
char name[10000];
char env_name[10000];


char ts[100000];
char pipe_env_buf[100000];

//int env_pfd[2];
//int env_pfd2[2];
int env_file_in;
int env_file_out;
int env_status;

void write_action(Action a);
void read_observation(char* oo);       
Reward read_reward();          
bool read_terminal(); 
void read_spec(char* tss);   
void write_seed(char* sd);
      

void parse_config_env(char* b, char* c);
#endif
