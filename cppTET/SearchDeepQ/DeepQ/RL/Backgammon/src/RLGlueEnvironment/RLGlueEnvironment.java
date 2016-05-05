package RLGlueEnvironment;
import java.util.Arrays;
import java.util.Vector;
import Game.Backgammon.*;
import RLGlueEnvironment.BackgammonRLGluePlayer;
import page.*;

/**
 * Copyright: Steffen Nissen (University of Copenhagen)
 */
public class RLGlueEnvironment 
{
    BackgammonEnvironment env = new BackgammonEnvironment(true, true, 1);
    Agent[] players = new Agent[2];
    BackgammonSyncronization sync = null;
    BackgammonThread thread = null;
    NextStateCollection nextStates = null;
    int actionSize = 0;
    int observationSize = 0;
    boolean firstStep = true;

    public String env_init(String[] args)
    {
    	BackgammonRLGlueRepresentation whiteRepresentation =  new BackgammonRLGlueRepresentation(BGConsts.WHITE);
    	BackgammonRLGlueRepresentation redRepresentation =  new BackgammonRLGlueRepresentation(BGConsts.RED);

        sync = new BackgammonSyncronization();
        thread = new BackgammonThread(env, players);
        
        String p1 = "rl-glue";
        String p2 = "rl-glue";
        if(args.length == 3)
        {
        	p1 = args[1];
        	p2 = args[2];
        }
        
        BackgammonRLGluePlayer player = null;
        
        if(p1.equals("rl-glue"))
        {
            BackgammonRLGluePlayer redPlayer = new BackgammonRLGluePlayer(sync, redRepresentation);
            player = redPlayer;
            players[0] = redPlayer;
        } 
        else if(p1.equals("random"))
        {
        	players[0] = new RandomAgent (new BackgammonActionGenerator());
        } 
        else if(p1.equals("heuristic"))
        {
        	players[0] = new BackgammonHeuristicAgent(BGConsts.RED);
        }
        
        if(p2.equals("rl-glue"))
        {
            BackgammonRLGluePlayer whitePlayer = new BackgammonRLGluePlayer(sync, whiteRepresentation);
            player = whitePlayer;
            players[1] = whitePlayer;        	
        } 
        else if(p2.equals("random"))
        {
        	players[1] = new RandomAgent (new BackgammonActionGenerator());
        }
        else if(p2.equals("heuristic"))
        {
        	players[1] = new BackgammonHeuristicAgent(BGConsts.WHITE);
        }
        
        
    	thread.start();
    	
    	actionSize = whiteRepresentation.getOutputCount();
    	observationSize = 3 + actionSize*player.getMaxNextStates();
    	
    	StringBuilder definition = new StringBuilder();
    	definition.append("0.9:e:");
    	definition.append(observationSize);
    	definition.append("_[i");
    	for (int i = 1; i < observationSize; i++)
    		definition.append(",i");
    	
    	definition.append("]");
    	for (int i = 0; i < observationSize; i++)
    		definition.append("_[0,9]"); //actually it is another range, but the lenght of the buffer is an issue, so only one digit
    	
    	definition.append(":");
    	definition.append(actionSize);
    	definition.append("_[i");
    	for (int i = 1; i < actionSize; i++)
    		definition.append(",i");
    	
    	definition.append("]");
    	for (int i = 0; i < actionSize; i++)
    		definition.append("_[0,9]");//actually it is another range, but the lenght of the buffer is an issue, so only one digit

    	return definition.toString();
    }
	
    public int[] env_start()
    {
    	//System.out.println("ENV: start environment");
    	firstStep = true;
    	nextStates = sync.getObservation();
    		
    	return nextStates.getBoards();
    }

    public Vector env_step(int[] action)
    {
    	int[] observation = null;
    	Boolean isTerminal = new Boolean(false);
    	Double reward = new Double(0);
    	
    	if(nextStates != null)
    	{
    		observation = nextStates.getBoards();
    	}
    	    	
    	if(observation == null)
    	{
    		//we do not have more possible afterstates remaining from the last step, 
    		//so we have to perform an action to get more afterstates 

        	//System.out.println("ENV: taking action");        	
    		Action actionToTake = nextStates.getAction(action);
	    	sync.setSelectedAction(actionToTake);

	    	if(firstStep && players[0].getClass() == BackgammonRLGluePlayer.class && players[1].getClass() == BackgammonRLGluePlayer.class)
	    		reward = new Double(0); //When both players are rl-glue they both need to take a step before we can return a reward 
	    	else
	    		reward = sync.getReward(); 
	    	
	    	firstStep = false;
	    	
	    	nextStates = sync.getObservation();
	    	
	    	if(nextStates != null)
	    	{
	    		//create a list of boards to return 
	    		observation = nextStates.getBoards();
	    	}
	    	else
	    	{
	    		//create an empty list of boards to return
	    		isTerminal = new Boolean(true);
	    		observation = new int[observationSize];
	    		observation[0] = 0;
	    		observation[1] = 0;
	    	}
    	}
    	
    	Vector<Object> ro = new Vector<Object>();
    	ro.setSize(3);
    	
        ro.set(0, observation); 
        ro.set(1, reward);	
        ro.set(2, isTerminal);
     
        return ro;	
    }
    
    public void env_cleanup()
    {
    	//System.exit(0);
    }
}
