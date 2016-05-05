.PHONY: all clean clean-irix

ExperimentV = MCExperiment.c
AGENTV = SarsaLambdaAgent.cpp 
ENVV = MountainCar.cpp 
COMMON = MCcar_common.h 

CPPFLAGS=-O3 -Wall

all:  ../../RL-Glue1p1/RLcommon.h Build/RL_Interface.o Build/agent.o Build/env.o Build/Experiment.o  Build/tiles.o 
	${CXX}  Build/env.o Build/RL_Interface.o Build/agent.o Build/Experiment.o Build/tiles.o -o RL_Experiment 

../../RL-Glue1p1/RLcommon.h: ${COMMON}
	cp ${COMMON} ../../RL-Glue1p1/RLcommon.h
 
Build/RL_Interface.o: ../../RL-Glue1p1/RL_Interface.c 
	${CXX} ${CPPFLAGS} -g -o Build/RL_Interface.o -c ../../RL-Glue1p1/RL_Interface.c

Build/Experiment.o: $(ExperimentV)
	${CXX} ${CPPFLAGS} -I ../../RL-Glue1p1/ -g -o Build/Experiment.o -c $(ExperimentV) 

Build/agent.o: $(AGENTV) 
	${CXX} ${CPPFLAGS} -I ../../RL-Glue1p1/ -I Utils/ -g -o Build/agent.o -c $(AGENTV) 

Build/env.o: $(ENVV) 
	${CXX} ${CPPFLAGS} -I ../../RL-Glue1p1/ -g -o Build/env.o -c $(ENVV) 

Build/tiles.o: Utils/tiles.cpp
	${CXX} ${CPPFLAGS} -g -c -o Build/tiles.o Utils/tiles.cpp

clean: 
	-rm -rf Build/*.o RL_Experiment core* ../../RL-Glue1p1/RLcommon.h 
clean-irix:
	rm -rf Build/*.o RL_Experiment core* ../../RL-Glue1p1/RLcommon.h
