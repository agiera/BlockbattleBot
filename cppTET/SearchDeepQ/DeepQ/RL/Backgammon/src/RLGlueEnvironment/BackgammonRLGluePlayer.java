package RLGlueEnvironment;

import Game.Backgammon.BackgammonState;
import page.AbstractAgent;
import page.Action;
import page.State;
import Game.Backgammon.BGConsts;;

/**
 * Copyright: Steffen Nissen (University of Copenhagen)
 */
public class BackgammonRLGluePlayer extends AbstractAgent
{
	private static final long serialVersionUID = 1L;
	private BackgammonSyncronization sync;
	private BackgammonRLGlueRepresentation representation = null;
	private int maxNextStates = 20;

	public BackgammonRLGluePlayer(BackgammonSyncronization sync, BackgammonRLGlueRepresentation representation)
	{
		this.representation = representation;
		this.sync = sync;
	}

	public Action requestAction (State s)
	{
		NextStateCollection c = new NextStateCollection(representation, maxNextStates, (BackgammonState)s);
		sync.setObservation(c);
		Action a = sync.getSelectedAction();

		if(a != null)
			return a;
		else
		{
			Action[] actions = s.getActions();

			return actions[(int) (BGConsts.rand.nextDouble() * actions.length)];
		}
	}

	public void newEpisode (State s) {}

	public void endEpisode (State s) 
	{
		sync.setObservation(null);
	}

	public void returnReward (State s, double r) 
	{
		sync.setReward(r);
	}

	public int getMaxNextStates() {
		return maxNextStates;
	}
}
