package RLGlueEnvironment;

import page.Action;

/**
 * Copyright: Steffen Nissen (University of Copenhagen)
 */
public class BackgammonSyncronization 
{
	private MessageSemaphore selectedAction = new MessageSemaphore();
	private MessageSemaphore observation = new MessageSemaphore();	
	private MessageSemaphore reward = new MessageSemaphore();
	
	public NextStateCollection getObservation() 
	{
		try 
		{
			NextStateCollection retval = (NextStateCollection)observation.waits();
			return retval;
		} 
		catch (InterruptedException e)
		{
			e.printStackTrace();
			return null;
		}
	}

	public void setObservation(NextStateCollection o) 
	{
		observation.signals(o);
	}

	public Double getReward() 
	{
		try
		{
			Double r = (Double)reward.waits();
			return r;
		}
		catch(InterruptedException e)
		{
			e.printStackTrace();
			return null;
		}
	}

	public void setReward(double r) 
	{
		reward.signals(r);
	}

	public Action getSelectedAction() 
	{
		try
		{
			Action a = (Action)selectedAction.waits();
			return a;
		}
		catch(InterruptedException e)
		{
			e.printStackTrace();
			return null;
		}		
	}

	public void setSelectedAction(Action a) 
	{
		selectedAction.signals(a);
	}
}
