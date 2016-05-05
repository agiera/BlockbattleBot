#include "mineAgent.h"
#include "TabularFA.h"
#include "FannIncrementalFA.h"
#include "FannBatchFA.h"
#include "FannCascadeFA.h"
#include "SlidingWindowCache.h"

IncrementalFunctionApproximator* Q;
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
    if(task_spec != NULL)
    {
        //Parse task_spec...General case where I dont know in adavance number of state and actions dimensions
        //if you know use one call to sscanf
		try 
		{
			task_spec_struct ps;
			parse_task_spec(task_spec, &ps);
			version = ps.version;
			state_dim = (int)ps.obs_dim;
			action_dim = (int)ps.action_maxs[0]+1;
			Rmin = ps.Rmin; 
			Rmax = ps.Rmax;
			
		} //done parsing ...not so bad!!
        catch(int e) 
        {
            fprintf(stderr,"Error: \n");
            fprintf(stderr,"I did not understand your task spec. I need 'numStates numActions'\n");
            exit(-1);
		}
        
		n = state_dim; //WE KNOW ONLY OE STATE DIMENSION
		m = action_dim;    //again we know number of action dim       
		fprintf(stderr,"task_spec: %s, num_states: %d, num_actions: %d\n",task_spec,n,m);
		nm = n*m;   

		for(int i = 0; i < m; i++)
			actions.push_back(DoubleVector(i, m));	
		
    }
    
	ann = fann_create_shortcut(2, m+n, 1);
	fann_set_activation_function_hidden(ann, FANN_SIN_SYMMETRIC);
	fann_set_activation_function_output(ann, FANN_LINEAR);
  	fann_set_learning_rate(ann, 0.7);
  	fann_randomize_weights(ann, -0.0001, 0.0001);
	fann_set_train_error_function(ann, FANN_ERRORFUNC_LINEAR);
	fann_set_activation_steepness_hidden(ann, 0.1);
	fann_set_activation_steepness_output(ann, 0.1);
//	fann_set_training_algorithm(ann, FANN_TRAIN_INCREMENTAL);
	fann_set_training_algorithm(ann, FANN_TRAIN_RPROP);

// 	ann->rprop_increase_factor = (float) 1.1;
// 	ann->rprop_decrease_factor = 0.75;

	fann_set_cascade_output_stagnation_epochs(ann, 20);
	fann_set_cascade_output_change_fraction(ann, 0.01);

//  	Q = new TabularFA(0);
//  	Q = new FannIncrementalFA(ann, Rmin, Rmax);
//   	Q = new SlidingWindowCache(new FannIncrementalFA(ann, Rmin, Rmax), 3000, 0);
//    Q = new SlidingWindowCache(new FannBatchFA(ann, Rmin, Rmax), 100000, 1000, 0);
	Q = new SlidingWindowCache(new FannCascadeFA(ann, true, Rmin, Rmax), 10000, 1000, 1, 0, true);
	agent = new Agent(Q);
}

Action agent_start(Observation o)
{
	DoubleVector observation(o, state_dim);
	DoubleVector action = agent->StartEpisode(observation, actions);
	Action a;
	action.ExportValues(a);
	return a;
}

Action agent_step(Reward r, Observation o)
{
	DoubleVector observation(o, state_dim);
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
	delete agent;
}

