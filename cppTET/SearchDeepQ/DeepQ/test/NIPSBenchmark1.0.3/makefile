.PHONY: all clean clean-irix

MAINV = main_NIPS.cpp 
AGENTV = Agent/NIPSContinuousRandomAgent.cpp 
ENVV = Env/CartPole.cpp 
COMMON = Env/NIPS_continuous_common.h 

all: RL-Framework1p0/RLcommon.h Build/RL_Interface.o Build/agent.o Build/env.o Build/main.o Build/gnu.o Build/spec.o Build/tiles.o
	${CXX}  Build/env.o Build/gnu.o Build/RL_Interface.o Build/agent.o Build/main.o Build/spec.o Build/tiles.o -o RL_main 

RL-Framework1p0/RLcommon.h: ${COMMON}
	cp ${COMMON} RL-Framework1p0/RLcommon.h
 
Agent/RLcommon.h: Agent/RLcommon.h
	rm Agent/RLcommon.h

Env/RLcommon.h: Env/RLcommon.h
	rm Env/RLcommon.h

Build/RL_Interface.o: RL-Framework1p0/RL_Interface.c 
	${CXX} -g -o Build/RL_Interface.o -c RL-Framework1p0/RL_Interface.c

Build/main.o: $(MAINV)
	${CXX} -I RL-Framework1p0/ -I Stats/ -g -o Build/main.o -c $(MAINV) 

Build/agent.o: $(AGENTV) 
	${CXX} -I RL-Framework1p0/ -I Utils/ -g -o Build/agent.o -c $(AGENTV) 

Build/env.o: $(ENVV) 
	${CXX} -I RL-Framework1p0/ -g -o Build/env.o -c $(ENVV) 

Build/gnu.o: Stats/gnu.cpp 
	${CXX} -g -c -o Build/gnu.o Stats/gnu.cpp 

Build/spec.o: Utils/RL_agent_util.cpp
	${CXX} -g -c -o Build/spec.o Utils/RL_agent_util.cpp

Build/tiles.o: Utils/tiles.cpp
	${CXX} -g -c -o Build/tiles.o Utils/tiles.cpp

clean: 
	-rm -rf Build/*.o RL_main RL_main.exe core* *.pyc RL-Framework1p0/RLcommon.h Agent/RLcommon.h Env/RLcommon.h
clean-irix:
	rm -rf Build/*.o RL_main RL_main.exe core* *.pyc RL-Framework1p0/RLcommon.h