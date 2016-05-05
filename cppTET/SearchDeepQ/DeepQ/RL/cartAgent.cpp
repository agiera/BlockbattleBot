#include "mineAgent.h"
#include "TabularFA.h"
#include "FannCascadeFA.h"
#include "SlidingWindowCache.h"

FunctionApproximator* Q;
fann *ann;
Action act;
int n; 			//number of states
int m; 			//number of actions
//int A; 			//index of last action taken
//int S; 			//index of last state/sensation observed
//double **Q;  		//array of action values
//int *actions;		//array of possible actions
// double alpha; 		//step-size parameter
// double epsilon; 	//exploration probability parameter
std::vector<DoubleVector> actions;

int state_dim;		//array holding size of each state dimension
int action_dim;	//array holding size of each action dimension
float version;		//version of interface
double Rmin, Rmax;


void agent_init(Task_specification task_spec)
{
	task_spec_struct ps;
	parse_task_spec(task_spec, &ps);
	version = ps.version;
	state_dim = (int)ps.obs_dim;
	action_dim = (int)ps.action_maxs[0]-(int)ps.action_mins[0];
	
	n = state_dim; //WE KNOW ONLY OE STATE DIMENSION
	m = action_dim;    //again we know number of action dim       
	fprintf(stderr,"task_spec: %s, num_states: %d, num_actions: %d\n",task_spec,n,m);

	actions.clear();
/*	for(int i = -10; i <= 10; i += 1)
	{
		double val = i;
		actions.push_back(DoubleVector(&val, 1));
		cout << actions[actions.size()-1] << endl;
	}*/
	for(int i = -10; i <= 10; i += 1)
	{
		double val = i;
		actions.push_back(DoubleVector(&val, 1));
		cout << actions[actions.size()-1] << endl;
	}
    
 	
 	if(agent[0] != NULL)
 	{
 		delete agent[0];
		Benchmark::Instance()->EndRun();
 	}
 	
	Benchmark::Instance()->StartRun();
	agent[0] = Benchmark::Instance()->CreateAgent(); 	
}

Action agent_start(Observation o)
{
	DoubleVector observation(o, state_dim);
	DoubleVector action = agent[0]->StartEpisode(observation, actions);
	Action a;
	action.ExportValues(&a);
	
	/*
	int i = 0;
	action.ExportValues(i);
	a = i - 10;
	*/
	
	return a;
}

Action agent_step(Reward r, Observation o)
{
	DoubleVector observation(o, state_dim);
// 	cout << observation << endl;
	DoubleVector action = agent[0]->Step(r, observation, actions);
	Action a;
	action.ExportValues(&a);
// 	cout << action << ":" << a << endl;
// 	cerr << a << " ";
	
	/*
	int i = 0;
	action.ExportValues(i);
	a = i - 10;
	*/	
	
	return a;
}

void agent_end(Reward r)
{
// 	cout << endl;
	agent[0]->EndEpisode(r);
}

void agent_cleanup()
{
	agent[0]->EndRun();
	Benchmark::Instance()->EndRun();
	delete agent[0];
	agent[0] = NULL;
}

