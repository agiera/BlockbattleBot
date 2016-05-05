package RLGlueEnvironment;

import page.Action;
import page.Agent;
import Game.Backgammon.BGConsts;
import Game.Backgammon.BackgammonEnvironment;

/**
 * Copyright: Steffen Nissen (University of Copenhagen)
 */
public class BackgammonThread extends Thread 
{
	BackgammonEnvironment env = null;
	Agent[] players = null;
	
	public boolean running = true;
	
	public BackgammonThread(BackgammonEnvironment env, Agent[] players)
    {
		this.players = players; 
    	this.env = env;
	}
	
	public void run()
	{
	    double[] score = new double[] {0, 0};
		while(running)
		{		
			env.go(players);
			
		    int win = env.getWin();
		    if (win == -1)
		    {
		      score[BGConsts.RED] += 0.5;
		      score[BGConsts.WHITE] += 0.5;
		      //System.out.println ("DRAW");
		    }
		    else
		    {
		        score[win] += 1.0;
		        //System.out.println (BGConsts.ColorNames[win]);
		    }
	
		    System.out.println ("Red: "+score[BGConsts.RED]+
		                        "\tWhite: "+score[BGConsts.WHITE]);
		}
	}
}
