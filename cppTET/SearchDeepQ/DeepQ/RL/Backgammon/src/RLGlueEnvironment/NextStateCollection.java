package RLGlueEnvironment;

import java.util.Arrays;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;

import page.Action;
import Game.Backgammon.BackgammonState;

/**
 * Copyright: Steffen Nissen (University of Copenhagen)
 */
public class NextStateCollection 
{
	private Vector<int[]> boardVector = new Vector<int[]>();
	private Hashtable<NextState, Action> allNextStates;
	private int boardsToReturn = 0;
	private int boardsSize = 0;
	private int extraRoom = 3;
	
	NextStateCollection(BackgammonRLGlueRepresentation representation, int boardsPerOperation, BackgammonState observation)
	{
		boardsSize = representation.getOutputCount()*boardsPerOperation+extraRoom;
		SetNextStates(representation, boardsPerOperation, observation);
	}

	public Action getAction(int[] board)
	{
		Action a = allNextStates.get(new NextState(board));
		if(a == null)
		{
			System.out.println("Unable to find action: "+Arrays.toString(board));
			System.exit(-1);
		}
		return a;
	}
	
	private void SetNextStates(BackgammonRLGlueRepresentation representation, 
							   int boardsPerOperation, BackgammonState observation)
	{
		if(observation != null)
		{
			// Get the valid actions for this state
			Action[] actions = observation.getActions();
			
			BackgammonState nextState = (BackgammonState)observation.clone();

			allNextStates = new Hashtable<NextState, Action>();
						
			for (int i = 0; i < actions.length; i++)
			{
				if(nextState.doAction(actions[i]))
				{
					int board[] = representation.getRepresentation(nextState);
					allNextStates.put(new NextState(board), actions[i]);
				}
				else
				{
					System.out.println("Wrong action returned from getActions");
				}
				
				nextState.undoAction();
			}

			Enumeration<NextState> en = allNextStates.keys();

			while (en.hasMoreElements())
			{
				int boards[] = new int[boardsSize];
				
				int boardsIndex = extraRoom;			
				int boardsAdded = 0;
				while (en.hasMoreElements() && boardsAdded < boardsPerOperation) 
				{
					int[] board = ((NextState)en.nextElement()).getBoard();
					for (int i = 0; i < board.length; i++) 
					{
						boards[boardsIndex] = board[i];
						boardsIndex++;
					}								
					boardsAdded++;
				}
				
				boards[0] = boardsAdded; //first indicates how many in this batch
				boards[1] = en.hasMoreElements() ? 1 : 0; //second indicates whether there are more comming
				boards[2] = representation.getWho(); //third indicates whether which player that is playing
				boardVector.add(boards);
			}
			//System.out.println("ENV: next states size : "+allNextStates.size()+" separated in "+boardVector.size()+" groups");
			
		}
		else
		{
			//System.out.println("ENV: no observation, so we send an empty board");
			//create an empty list of boards to return
			int boards[] = new int[boardsSize];
			boards[0] = 0;
			boards[1] = 0;
			boards[2] = 0;
			boardVector.add(boards);
		}    	
	}

	
	public int[] getBoards() 
	{
		int[] retVal = null;
		
		if(boardVector.size() > boardsToReturn)
		{
			retVal = boardVector.get(boardsToReturn);
			boardsToReturn++;
			//System.out.println("ENV: Returning observation with "+retVal[0]+" boards, and hasmore "+retVal[1]+" of total "+boardVector.size());
		}
		
		return retVal;
	}
}
