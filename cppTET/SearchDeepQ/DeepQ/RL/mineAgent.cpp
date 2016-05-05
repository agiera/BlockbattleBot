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
	state_dim = (int)ps.obs_maxs[0]+1;
	action_dim = (int)ps.action_maxs[0]+1;
	
	n = state_dim; //WE KNOW ONLY OE STATE DIMENSION
	m = action_dim;    //again we know number of action dim       
	fprintf(stderr,"task_spec: %s, num_states: %d, num_actions: %d\n",task_spec,n,m);
	nm = n*m;   

	actions.clear();
	for(int i = 0; i < m; i++)
		actions.push_back(DoubleVector(i, m));	
		
	
	/*
	ann = fann_create_shortcut(2, m+2, 1);
	fann_set_activation_function_hidden(ann, FANN_SIN_SYMMETRIC);
	fann_set_activation_function_output(ann, FANN_LINEAR);
  	fann_set_learning_rate(ann, 0.7);
  	fann_randomize_weights(ann, -0.0001, 0.0001);
	fann_set_train_error_function(ann, FANN_ERRORFUNC_LINEAR);
	fann_set_activation_steepness_hidden(ann, 0.1);
	fann_set_activation_steepness_output(ann, 0.1);
//	fann_set_training_algorithm(ann, FANN_TRAIN_INCREMENTAL);
	fann_set_training_algorithm(ann, FANN_TRAIN_RPROP);

//	fann_set_rprop_increase_factor(ann, 1.1);
//	fann_set_rprop_decrease_factor(ann, 0.75);
//    fann_set_rprop_delta_max(ann, 20);
	fann_set_cascade_output_stagnation_epochs(ann, 50);
	fann_set_cascade_output_change_fraction(ann, 0.005);

//  	Q = new TabularFA(0);
//  	Q = new FannFA(ann);
//   	Q = new SlidingWindowCache(new FannFA(ann), 3000, 3000, 1, 0, true);
//    Q = new SlidingWindowCache(new FannBatchFA(ann, Rmin, Rmax), 1000, 1000, 1, 0);
	Q = new SlidingWindowCache(new FannCascadeFA(ann, true), 1000, 1000, 2, 0, true);
	agent = new Agent(Q);
	
	agent->useRehearsing = true;
	agent->alpha = 0.1;
	agent->epsilon = 0.01;
	agent->gamma = 0.9;
	agent->sigma = 0.7;
	agent->lambda = 0.99;
	agent->boltzmannTemp = 0.3;
	agent->selectionStrategy = Agent::SelectMaxBoltzmann;
	agent->useTabuSearch = false;
	*/
 	if(agent != NULL)
 	{
 		delete agent;
		Benchmark::Instance()->EndRun();
 	}
 	
	Benchmark::Instance()->StartRun();
	agent = Benchmark::Instance()->CreateAgent(); 	
	
}

Action agent_start(Observation o)
{
	int row_col[2];
	row_col[0] = o%18;
	row_col[1] = (int)floor(o/18.0);

	DoubleVector observation(row_col, 2);
	DoubleVector action = agent->StartEpisode(observation, actions);
	Action a;
	action.ExportValues(a);
	return a;
}

Action agent_step(Reward r, Observation o)
{
	int row_col[2];
	row_col[0] = o%18;
	row_col[1] = (int)floor(o/18.0);

	DoubleVector observation(row_col, 2);
	DoubleVector action = agent->Step(r, observation, actions);
	Action a;
	action.ExportValues(a);
	return a;
}

void agent_end(Reward r)
{
	agent->EndEpisode(r);
}

void agent_cleanup()
{
	Benchmark::Instance()->EndRun();
	delete agent;
}

