#! /bin/bash

var0=" "

FILE=config.txt
declare -a VAR 
declare -a AGENT 
declare -a ENV 
declare -a COMM 
declare -a AGENTLANG
declare -a ENVLANG
declare -a MAIN 
declare -a n
declare -a piles
declare -a osname
declare -a oss

let k=0
piller=`gcc --version | head -n 1`

if [ "${piller}" = "" ]; then
    piller=`cc -v 2>&1 | head -n 1`
    if [ "${piller}" = "" ]; then
        echo
        echo ERROR1: GCC NOT FOUND. RL-Framework requires at least GNU GCC 3.3.0
        echo Exiting ....
        echo
        exit 0
        
fi;fi;

i=0
  for ELEMENT in $piller ; do
    piles[$k]=$ELEMENT

    let i=$k-1
    if [ $k == 0 ]; then 
        let i=0
    fi
    
    if [ ${piles[$i]} = "not" ]; then
    if [ ${piles[$k]} = "found" ]; then
        echo
        echo ERROR2: GCC NOT FOUND. RL-Framework requires at least GNU GCC 3.3.0
        echo Exiting ....
        echo
        exit 0
    fi;fi;
    
    let k=$k+1
    
  done

let jj=0
jj=$k
echo
k=0
yy=0
while [  $k -lt $jj ] ; do
    if [ ${piles[$k]} = "(GCC)" ] ; then
        let yy=1
        let k=$k+1
        echo You are using GCC version ${piles[$k]}
        if [ `expr "${piles[$k]}" : '5\.*'` = 0 ]; then
        if [ `expr "${piles[$k]}" : '4\.*'` = 0 ]; then
        if [ `expr "${piles[$k]}" : '3\.9\.*'` = 0 ]; then
        if [ `expr "${piles[$k]}" : '3\.8\.*'` = 0 ]; then
        if [ `expr "${piles[$k]}" : '3\.7\.*'` = 0 ]; then
        if [ `expr "${piles[$k]}" : '3\.6\.*'` = 0 ]; then
        if [ `expr "${piles[$k]}" : '3\.5\.*'` = 0 ]; then
        if [ `expr "${piles[$k]}" : '3\.4\.*'` = 0 ]; then
        if [ `expr "${piles[$k]}" : '3\.3\.*'` = 0 ]; then
            echoc
            echo ERROR3: RL-Framework requires at least GNU GCC 3.3.0
            echo Exiting ....
            echo
            exit 0
        fi
        fi;fi;fi;fi;fi;fi;fi;fi;
    else
        let k=$k+1
    fi
done

if [ $yy = 0 ]; then
            echo
            echo WARNING: Your complier is not regonized 
            echo RL-Framework requires at least GNU GCC 3.3.0
            echo RL-Framework may not compile or run correctly
            echo Continuing ....
fi
        
osname=`uname -a | head -n 1`

k=0
  for ELEMENT in $osname ; do
    oss[$k]=$ELEMENT
    let k=$k+1
  done

k=0
echo
echo You are running ${oss[$k]}
if [ ${oss[$k]} == "SunOS" ]; then
            echo
            echo WARNING: You are using SUN OS 
            echo RL-Framework has not been extensively tested on SUN OS
            echo RL-Framework may not compile or run correctly
            echo Continuing ....
else
if [ ${oss[$k]} == "CYGWIN_NT-5.1" ]; then
            echo
            echo WARNING: You are using CYGWIN 
            echo RL-Framework does not officially support cygwin
            echo For instance, java pipes will not work, and C pipes will be slow
            echo Continuing ....
else
if [ ${oss[$k]} != "Darwin" ]; then
if [ ${oss[$k]} != "Linux" ]; then
if [ ${oss[$k]} != "Unix" ]; then
if [ ${oss[$k]} != "AIX" ]; then
            echo
            echo ERROR5: RL-Framework only supports Mac OS X, Linux, Unix and AIX and cygwin... somewhat
            echo Exiting ....
            echo
            exit 0   
fi;fi;fi;fi;fi;fi;


LASTLINE=''
# Putting elements into an array of Variables
let x=0 ;   let y=0
while read LINE ; do  
  LASTLINE=$LINE
  for ELEMENT in $LINE ; do
    VAR[$x]=$ELEMENT
    let x=$x+1
  done
  # Do something with the Variables
  y=0
  n=`echo ${VAR[$y]} | tr A-Z a-z`
  
  if [ "$n" = "agent" ]; then
  y=2
  AGENT=`echo ${VAR[$y]}`
  fi
  y=0
  if [ "$n" = "env" ]; then
  y=2
  ENV=`echo ${VAR[$y]}`
  fi  
  y=0
  if [ "$n" = "main" ]; then
  y=2
  MAIN=`echo ${VAR[$y]}`
  fi
  y=0
  if [ "$n" = "common" ]; then
  y=2
  COMM=`echo ${VAR[$y]}`
  fi  
  y=0
  if [ "$n" = "agent_language" ]; then
  y=2
  AGENTLANG=`echo ${VAR[$y]}`
  fi  
  y=0
  if [ "$n" = "env_language" ]; then
  y=2
  ENVLANG=`echo ${VAR[$y]}`
  fi    
  unset VAR
  let x=0 
done < $FILE

x=0
A=`tail -n 1 $FILE`
if [ ! "$LASTLINE" = "$A" ]; then
    for ELEMENT in $A ; do
    VAR[$x]=$ELEMENT
    let x=$x+1
  done
  # Do something with the Variables
  y=0
  n=`echo ${VAR[$y]} | tr A-Z a-z`
  
  if [ "$n" = "agent" ]; then
  y=2
  AGENT=`echo ${VAR[$y]}`
  fi
  y=0
  if [ "$n" = "env" ]; then
  y=2
  ENV=`echo ${VAR[$y]}`
  fi  
  y=0
  if [ "$n" = "main" ]; then
  y=2
  MAIN=`echo ${VAR[$y]}`
  fi
  y=0
  if [ "$n" = "common" ]; then
  y=2
  COMM=`echo ${VAR[$y]}`
  fi  
  y=0
  if [ "$n" = "agent_language" ]; then
  y=2
  AGENTLANG=`echo ${VAR[$y]}`
  fi  
  y=0
  if [ "$n" = "env_language" ]; then
  y=2
  ENVLANG=`echo ${VAR[$y]}`
  fi
fi

n=`echo ${AGENTLANG} | tr A-Z a-z`
m=`echo ${ENVLANG} | tr A-Z a-z`

if [ "$m" = "java" ]; then
	if [ -n "`echo "$ENV" | grep -x '.*\..*'`" ]; then
		printf "\nERROR6: RL-Framework 1.0 only supports direct language calls for C and C++.\n\n"
		exit 0
	fi
fi

if [ "$n" = "java" ]; then
if [ -n "`echo "$AGENT" | grep -x '.*\..*'`" ]; then 
		printf "\nERROR7: RL-Framework 1.0 only supports direct language calls for C and C++.\n\n"
		exit 0
	fi
fi


if [ -n "`echo "$AGENT" | grep -x '.*\..*'`" ]; then	  
	if [ -z "`echo "$ENV" | grep -x '.*\..*'`" ]; then
		printf "\nERROR1: RL-Framework 1.0 only supports 2-way pipe communication. Both agent and environment must be execuatable or source files.\n\n"
		exit 0
	fi
fi

if [ -z "`echo "$AGENT" | grep -x '.*\..*'`" ]; then
	if [ -n "`echo "$ENV" | grep -x '.*\..*'`" ]; then
		printf "\nERROR2: RL-Framework 1.0 only supports 2-way pipe communication. Both agent and environment must be execuatable or source files.\n\n"
		exit 0
	fi
fi	

if [ -n "`echo "$AGENT" | grep -x '.*\..*'`" ]; then
if [ -z "`echo "$AGENT" | grep -x '.*c'`" ]; then
	if [ -z "`echo "$AGENT" | grep -x '.*cc'`" ]; then
		if [ -z "`echo "$AGENT" | grep -x '.*cpp'`" ]; then
		printf "\nERROR3: RL-Framework 1.0 only supports direct language calls for c and c++. \n\n" 
		exit 0
fi; fi; fi; fi

if [ -n "`echo "$ENV" | grep -x '.*\..*'`" ]; then
if [ -z "`echo "$ENV" | grep -x '.*c'`" ]; then
	if [ -z "`echo "$ENV" | grep -x '.*cc'`" ]; then
		if [ -z "`echo "$ENV" | grep -x '.*cpp'`" ]; then
		printf "\nERROR3: RL-Framework 1.0 only supports direct language calls for c and c++. \n\n" 
		exit 0
fi; fi; fi; fi

if [ -z "`echo "$ENV" | grep -x '.*\..*'`" ]; then
	if [ -z "`echo "$AGENT" | grep -x '.*\..*'`" ]; then
		var0=PIPES
	fi
fi



makestr0=".PHONY: all clean clean-irix\n
MAINV = $MAIN 
AGENTV = $AGENT 
ENVV = $ENV 
COMMON = $COMM \n
all: RL-Framework1p0/RLcommon.h Build/RL_Interface.o Build/agent.o Build/env.o Build/main.o Build/gnu.o Build/spec.o Build/tiles.o
\t\${CXX}  Build/env.o Build/gnu.o Build/RL_Interface.o Build/agent.o Build/main.o Build/spec.o Build/tiles.o -o RL_main \n
RL-Framework1p0/RLcommon.h: \${COMMON}
\tcp \${COMMON} RL-Framework1p0/RLcommon.h\n 
Agent/RLcommon.h: Agent/RLcommon.h
\trm Agent/RLcommon.h\n
Env/RLcommon.h: Env/RLcommon.h
\trm Env/RLcommon.h\n
Build/RL_Interface.o: RL-Framework1p0/RL_Interface.c 
\t\${CXX} -g -o Build/RL_Interface.o -c RL-Framework1p0/RL_Interface.c\n
Build/main.o: \$(MAINV)
\t\${CXX} -I RL-Framework1p0/ -I Stats/ -g -o Build/main.o -c \$(MAINV) \n
Build/agent.o: \$(AGENTV) 
\t\${CXX} -I RL-Framework1p0/ -I Utils/ -g -o Build/agent.o -c \$(AGENTV) \n
Build/env.o: \$(ENVV) 
\t\${CXX} -I RL-Framework1p0/ -g -o Build/env.o -c \$(ENVV) \n
Build/gnu.o: Stats/gnu.cpp 
\t\${CXX} -g -c -o Build/gnu.o Stats/gnu.cpp \n
Build/spec.o: Utils/RL_agent_util.cpp
\t\${CXX} -g -c -o Build/spec.o Utils/RL_agent_util.cpp\n
Build/tiles.o: Utils/tiles.cpp
\t\${CXX} -g -c -o Build/tiles.o Utils/tiles.cpp\n
clean: 
\t-rm -rf Build/*.o RL_main RL_main.exe core* *.pyc RL-Framework1p0/RLcommon.h Agent/RLcommon.h Env/RLcommon.h
clean-irix:
\trm -rf Build/*.o RL_main RL_main.exe core* *.pyc RL-Framework1p0/RLcommon.h"

makestr1=".PHONY: all clean clean-irix\n
MAINV = $MAIN 
AGENTV = pipes_agent.cpp 
ENVV = pipes_env.cpp 
COMMON = Pipecommon.h \n
all: RL-Framework1p0/RLcommon.h Build/RL_Interface.o Build/agent.o Build/env.o Build/main.o Build/gnu.o 
\t\${CXX}  Build/env.o Build/gnu.o Build/RL_Interface.o Build/agent.o Build/main.o -o RL_main\n
RL-Framework1p0/RLcommon.h: RL-Framework1p0/Pipes/\${COMMON}
\tcp RL-Framework1p0/Pipes/\${COMMON} RL-Framework1p0/RLcommon.h\n
Build/RL_Interface.o: RL-Framework1p0/RL_Interface.c
\t\${CXX} -g -o Build/RL_Interface.o -c RL-Framework1p0/RL_Interface.c\n
Build/main.o: \$(MAINV)
\t\${CXX} -I RL-Framework1p0/ -I stats/ -g -o Build/main.o -c \$(MAINV)\n
Build/agent.o: RL-Framework1p0/Pipes/\$(AGENTV)
\t\${CXX} -I RL-Framework1p0/ -I -g -o Build/agent.o -c RL-Framework1p0/Pipes/\$(AGENTV)\n
Build/env.o: RL-Framework1p0/Pipes/\$(ENVV)
\t\${CXX} -I RL-Framework1p0/ -g -o Build/env.o -c RL-Framework1p0/Pipes/\$(ENVV)\n
Build/gnu.o: Stats/gnu.cpp
\t\${CXX} -g -c -o Build/gnu.o Stats/gnu.cpp\n
clean:
\t-rm -rf Build/*.o RL_main RL_main.exe core* *.pyc RL-Framework1p0/RLcommon.h
clean-irix:
\trm -rf Build/*.o RL_main RL_main.exe core* *.pyc RL-Framework1p0/RLcommon.h"

rm makefile
if [ "$var0" = "PIPES" ]; then
	printf "\nInterface will use Pipe communication \n\n"
	printf "$makestr1" > makefile
else
	printf "\nInterface will NOT use Pipe communication \n\n"
	printf "$makestr0" > makefile
fi

make clean
make

