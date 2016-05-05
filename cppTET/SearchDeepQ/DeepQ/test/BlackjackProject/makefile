.PHONY: all clean clean-irix

ExperimentV = BJExperiment.c
AGENTV = SarsaAgent.cpp 
ENVV = Blackjack.cpp 
COMMON = bj_common.h 

CPPFLAGS=-O3 -Wall

all:  ../../rl-glue/RLcommon.h Build/RL_Interface.o Build/agent.o Build/env.o Build/Experiment.o  
	${CXX}  Build/env.o Build/RL_Interface.o Build/agent.o Build/Experiment.o -o RL_Experiment 

../../rl-glue/RLcommon.h: ${COMMON}
	cp ${COMMON} ../../rl-glue/RLcommon.h
 
Build/RL_Interface.o: ../../rl-glue/RL_Interface.c 
	${CXX} ${CPPFLAGS} -g -o Build/RL_Interface.o -c ../../rl-glue/RL_Interface.c

Build/Experiment.o: $(ExperimentV)
	${CXX} ${CPPFLAGS} -I ../../rl-glue/ -g -o Build/Experiment.o -c $(ExperimentV) 

Build/agent.o: $(AGENTV) 
	${CXX} ${CPPFLAGS} -I ../../rl-glue/ -g -o Build/agent.o -c $(AGENTV) 

Build/env.o: $(ENVV) 
	${CXX} ${CPPFLAGS} -I ../../rl-glue/ -g -o Build/env.o -c $(ENVV) 

clean: 
	-rm -rf Build/*.o RL_Experiment core* ../../rl-glue/RLcommon.h 
clean-irix:
	rm -rf Build/*.o RL_Experiment core* ../../rl-glue/RLcommon.h
