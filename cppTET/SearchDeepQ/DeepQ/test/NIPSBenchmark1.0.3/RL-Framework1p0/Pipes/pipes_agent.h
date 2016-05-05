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

     
#ifndef PIPE_AGENT_H
#define PIPE_AGENT_H


//int agent_pfd[2];
//int agent_pfd2[2];
int agent_file_in;
int agent_file_out;
int agent_status;

void write_state(Observation o);
void write_reward(Reward r);
void read_action(char* pipe_action);
void parse_config(char* b, char* c);

char pipe_act[10000];
char pipe_name[10000];
char agent_name[10000];

#endif
