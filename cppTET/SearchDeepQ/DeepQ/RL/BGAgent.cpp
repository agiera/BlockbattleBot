#include "Benchmark.h"
#include "Agent.h"
#include "RLcommon.h"
#include "TabularFA.h"
#include "FannCascadeFA.h"
#include "SlidingWindowCache.h"
#include "BGStateRepresentation.h"
#include "C_agent_parser.h"

int boardSize; //The size of a board description
BGStateRepresentation *representation = NULL;
Action defaultAction = NULL;
Action a;

void resetData()
{
	if(defaultAction != NULL)
	{
		//we are either starting a new run or we are ending the last run
		Benchmark::Instance()->EndRun();
		
		for(int i = 0; i <  2; i++)
		{
			if(agent[i] != NULL && agent[i]->episodes != 0)
			{
				string file;
				if(i == 0)
					file = Benchmark::Instance()->GetOutputDir() + "agent1.txt";
				else
					file = Benchmark::Instance()->GetOutputDir() + "agent2.txt";
 				SaveAgent(*agent[i], file.c_str());
			}
		}
		
		for(int i = 0; i <  2; i++)
		{
			if(agent[i] != NULL)
			{
				delete agent[i];
				agent[i] = NULL;
			}
		}
		
		
		delete defaultAction;
		defaultAction = NULL;
		delete representation;
		representation = NULL;
 	}
}

void agent_init(Task_specification task_spec)
{
	resetData();
	
	task_spec_struct ps;
	parse_task_spec(task_spec, &ps);
	boardSize = ps.action_dim;
	a = new int[boardSize];
	defaultAction = new int[boardSize];
	memset(defaultAction, 0, boardSize*sizeof(int));

	representation = new BGStateRepresentation();

	Benchmark::Instance()->StartRun();
	agent[0] = Benchmark::Instance()->CreateAgent();
	agent[1] = Benchmark::Instance()->CreateAgent();
}

pair<bool, int> fillActions(Observation o, vector<DoubleVector> &actions, map<DoubleVector, DoubleVector> &actionMap)
{
	//An observation from a BG game is esentially a list of possible actions,
	// where the actions is represented as board layouts, so we create 
	// a list of actions from the observation
	
	int numActions = (int)rint(o[0]);
	bool moreToCome = (bool)rint(o[1]);
	int player = (int)rint(o[2]);
//  	cout << "AGENT: Reading " << numActions << " actions with moreToCome: " << moreToCome << " for player " << player << endl;
	
	o += 3; //make it point to the first boardposition

	for(int i = 0; i < numActions; i++)
	{
		DoubleVector actionRep(representation->getRepresentation(o) , representation->GetSize());
		
		//cout << actionRep << endl;
		//DoubleVector b(o, boardSize);
		//cout << b << endl;
		
		actions.push_back(actionRep);
		actionMap[actionRep] = DoubleVector(o, boardSize);
		o += boardSize;
	}
	
	return pair<bool, int>(moreToCome,player);
}

map<DoubleVector, DoubleVector> actionMap;
vector<DoubleVector> actions;
bool agentStarted;

Action agent_start(Observation o)
{
	pair<bool, int> res = fillActions(o, actions, actionMap);
	bool moreToCome = res.first;
	int player = res.second;
	
	if(moreToCome)
	{
		//more actions are comming, so we simply return the default action and wait
		agentStarted = false;
		return defaultAction;
	}
	else
	{
		if(agent[player]->episodes > Benchmark::Instance()->totalEpisodes)
		{
			resetData();
			exit(0);
		}
		
		//we have all the available actions
		agentStarted = true;
		DoubleVector observation;
		//cout << "AGENT: Starting episode based on " << actions.size() << " actions" << endl;
		DoubleVector action = agent[player]->StartEpisode(observation, actions);
		
		actionMap[action].ExportValues(a);
		actionMap.clear(); //we have used then, so simply clear them
		actions.clear();
		return a;
	}
}

Action agent_step(Reward r, Observation o)
{
	pair<bool, int> res = fillActions(o, actions, actionMap);
	bool moreToCome = res.first;
	int player = res.second;
	
	if(moreToCome)
	{
		//cout << "AGENT: Returning default action" << endl;
		return defaultAction;
	}
	else
	{
		//we have all the available actions
	 	DoubleVector observation;
	 	DoubleVector action;
	 	if(agentStarted)
	 	{
			//cout << "AGENT: Taking step based on " << actions.size() << " actions" << endl;
			if(agent[player]->isStarted)
				action = agent[player]->Step(r, observation, actions);
			else
				action = agent[player]->StartEpisode(observation, actions);
		}
		else
		{
			//cout << "AGENT: Starting episode based on " << actions.size() << " actions" << endl;
			action = agent[player]->StartEpisode(observation, actions);
			agentStarted = true;
		}
	
		actionMap[action].ExportValues(a);
		actionMap.clear(); //we have used then, so simply clear them
		actions.clear();
		return a;
	}
}

void agent_end(Reward r)
{
// 	cout << "AGENT: end episode reward[0] " << -r << " reward[1] " << r << endl;
	if(agent[0]->isStarted && agent[1]->isStarted)
	{
		agent[0]->EndEpisode(-r);
		agent[1]->EndEpisode(r);
	}
	else if(agent[0]->isStarted)
		agent[0]->EndEpisode(r);
	else if(agent[1]->isStarted)
		agent[1]->EndEpisode(r);	

		
	for(int i = 0; i < 2; i++)
	{
		if(agent[i]->episodes != 0 && agent[i]->episodes % 1000 == 0)
		{
			char buf[100];
			sprintf(buf, "agent_%d_%010d.txt", i, agent[i]->episodes);
			string file = Benchmark::Instance()->GetOutputDir() + buf;
 			SaveAgent(*agent[i], file.c_str());
		}
	}
}

void agent_cleanup()
{
	resetData();
	exit(0);
}
