package RLGlueEnvironment;

import page.State;
import Game.Backgammon.BGConsts;
import Game.Backgammon.BackgammonState;

/**
 * Copyright: Steffen Nissen (University of Copenhagen)
 */
public class BackgammonRLGlueRepresentation 
{
	private int who = 0;
	private int size = 28;
//	private BackgammonTesauroStateRepresentation3 rep;
	
	BackgammonRLGlueRepresentation(int who)
	{
	    this.who = who;
//	    rep = new BackgammonTesauroStateRepresentation3(who);
	}
	
	public int[] getRepresentation(State s) 
	{
		//debug stuff to test c++ representation
		//double foo[] = rep.getRepresentation(s);
		//System.out.println(Arrays.toString(foo)); 
		//debug stuff to test c++ representation
		
		
	    BackgammonState bs = (BackgammonState) s;

	    int other = BGConsts.OTHER[who];

	    int points[][] = bs.getBoard();
	    int[] inputs = new int[size];

	    // First the 24 points: we thermometer encode the three first men there
	    int start, end, delta;
	    if (who == BGConsts.RED)
	    {
	      start = 1;
	      end = 25;
	      delta = 1;
	    }
	    else
	    {
	      start = 24;
	      end = 0;
	      delta = -1;
	    }

	    for (int i = start, j = 0; i != end; i += delta, j++)
	    {
	    	if(points[i][who] != 0)
	    		inputs[j] = points[i][who];
	    	else
	    		inputs[j] = -points[i][other];
	    }

	    // Now we encode the number of men on the bar
	    inputs[24] = points[BGConsts.BAR[who]][who];
	    inputs[25] = points[BGConsts.BAR[other]][other];
	    // The number of checkers already borne off 
	    inputs[26] = points[BGConsts.HOME[who]][who];
	    inputs[27] = points[BGConsts.HOME[other]][other];
	    
	    //System.out.println(Arrays.toString(inputs));
	    
	    return inputs;
	}

	public int getOutputCount() 
	{
		return size;
	}

	public int getWho()
	{
		return who;
	}
}
