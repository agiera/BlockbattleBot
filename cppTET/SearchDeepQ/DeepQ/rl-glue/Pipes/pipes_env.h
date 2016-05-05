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

Reward_observation ro;

char pipe_env_buf[300000];

int env_file_in = -1;
int env_file_out = -1;
FILE *env_file_out_fd = NULL;

void read_data_env(char* d1);        
void write_data_env(char* d2);
      

#endif
