.PHONY: all clean clean-irix

flags := -Wall -Werror -O3 -march=pentium4 -msse2 -mfpmath=sse -finline-limit=2400 -funroll-loops
#flags := -Wall -Werror -ggdb

link-flags := /usr/lib/libboost_serialization.a

#Mines problem
#COMMON = mines_common.h 
#problem-source = mineAgent.cpp mines.cpp

#Backgammon problem pipes
#COMMON = bg_common.h 
#problem-source = BGAgent.cpp

#Mountain Car Problem
#COMMON = MCcar_common.h 
#problem-source = carAgent.cpp MountainCar.cpp

#Cart Pole Problem
# COMMON = NIPS_continuous_common.h
# problem-source = cartAgent.cpp CartPole.cpp

#Mountain Car Problem With CMAC
#COMMON = car_common.h 
#problem-source = QCMACO.cpp MountainCarSV.cpp

#BlackJack Problem
#COMMON = bj_common.h 
#problem-source = BJAgent.cpp Blackjack.cpp

#Yahtzee problem
#COMMON = yahtzee_common.h 
#problem-source = yahtzeeAgent.cpp YahtzeeNumbersFull.cpp

PIPESCOMMON = ../rl-glue/Pipes/Pipecommon.h
pipemain-obj = ../rl-glue/Pipes/pipes_agent.o ../rl-glue/Pipes/pipes_env.o pipemain.o Stats/gnu.o ../rl-glue/RL_Interface.o

fann-path := fann/src/
includepath := -I ../rl-glue/ -I Utils/ -I Stats/ -I Agent/ -I ${fann-path}include/

cxx-source := $(wildcard Agent/*.cpp) $(wildcard Utils/*.cpp) $(wildcard Stats/*.cpp) $(problem-source)
cxx-obj := $(patsubst %.cpp, %.o,$(cxx-source))
c-source := main.c ${fann-path}doublefann.c ../rl-glue/RL_Interface.c
headers := $(wildcard Agent/*.h) $(wildcard Utils/*.h) $(wildcard Stats/*.h) $(wildcard *.h)
objects := $(cxx-obj) $(patsubst %.c, %.o,$(c-source))
source := $(cxx-source) $(c-source)
pipeagent-obj = $(cxx-obj) ../rl-glue/Pipes/agent_pipe_handler.o ${fann-path}doublefann.o

#all: pipes
# all: rl
all: ${destination}

pipes: pipeagent pipemain

pipemain: pipecommon $(pipemain-obj)
	${CXX} ${pipemain-obj} -o pipemain

pipeagent: common $(pipeagent-obj)
	${CXX} $(pipeagent-obj) $(link-flags) -o pipeagent

makepipes:
	rm -rf /tmp/RL*
	mkfifo "/tmp/RL_pipe_agent_in" "/tmp/RL_pipe_agent_out" "/tmp/RL_pipe_env_out" "/tmp/RL_pipe_env_in" "/tmp/RL_pipe_main_in" "/tmp/RL_pipe_main_out"

runpipes: pipes makepipes actualrunpipes

actualrunpipes:
	killall pipeagent || true
	killall pipemain || true
	./pipemain &
	./pipeagent

runpipemain: pipemain makepipes
	./pipemain

runpipeagent: pipeagent makepipes
	./pipeagent

runbackgammon: pipes makepipes runjavaserver actualrunpipes

runjavaserver:
	(java -classpath /home/lukesky/rl-thesis/src/RL/Backgammon/src RLGlueEnvironment.env_pipe_handler RLGlueEnvironment.RLGlueEnvironment | grep -v "no board") &

#dep: .depend

#.depend: $(source) $(headers)
#	if [ ! -z "$(source)" ]; then $(CXX) ${flags} ${includepath} -MM $(source) > .depend ; fi

#ifeq (.depend,$(wildcard .depend))
#include .depend
#endif

${destination}: common ${objects}
	${CXX} ${objects} $(link-flags) -o ${destination}

#../rl-glue/RLcommon.h: ${COMMON}
#	cp ${COMMON} ../rl-glue/RLcommon.h

pipecommon: $(PIPESCOMMON)
	cp ${PIPESCOMMON} ../rl-glue/RLcommon.h

common: $(COMMON)
	cp ${COMMON} ../rl-glue/RLcommon.h

%.o: %.c $(headers)
	${CXX} ${flags} ${includepath} -o $@ -c $<

%.o: %.cpp $(headers)
	${CXX} ${flags} ${includepath} -o $@ -c $<

clean:
	rm -rf ${destination} core* ../rl-glue/RLcommon.h  ${objects} $(pipemain-obj) $(pipeagent-obj)
