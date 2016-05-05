#include "mineAgent.h"
#include "TabularFA.h"
#include "FannCascadeFA.h"
#include "SlidingWindowCache.h"

FunctionApproximator* Q;
fann *ann;
Action act;
int n; 			//number of states
int m; 			//number of actions
int nm; 		//the length of the state-action value array
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
	action_dim = ((int)ps.action_maxs[0] - (int)ps.action_mins[0])+1;
	
	n = state_dim; //WE KNOW ONLY OE STATE DIMENSION
	m = action_dim;    //again we know number of action dim       
	fprintf(stderr,"task_spec: %s, num_states: %d, num_actions: %d\n",task_spec,n,m);
	nm = n*m;   

	actions.clear();
	actions.push_back(DoubleVector(0, 2));	
	actions.push_back(DoubleVector(1, 2));	
 	
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
	action.ExportValues(a);
	if(a == 0)
		return -1;
	else
		return 1;
}

Action agent_step(Reward r, Observation o)
{
	DoubleVector observation(o, state_dim);
	DoubleVector action = agent[0]->Step(r, observation, actions);
	Action a;
	action.ExportValues(a);
	if(a == 0)
		return -1;
	else
		return 1;
}

void agent_end(Reward r)
{
	agent[0]->EndEpisode(r);
}

void agent_cleanup()
{
	agent[0]->EndRun();
	Benchmark::Instance()->EndRun();
	delete agent[0];
	agent[0] = NULL;
}

