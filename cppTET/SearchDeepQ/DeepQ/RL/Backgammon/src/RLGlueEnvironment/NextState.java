package RLGlueEnvironment;

/**
 * Copyright: Steffen Nissen (University of Copenhagen)
 */
public class NextState 
{
	int[] board;
	
	NextState(int[] board)
	{
		this.board = board;
	}
	
	public boolean equals(Object n) 
	{
		return java.util.Arrays.equals(board, ((NextState)n).getBoard());
	}

	public int[] getBoard() 
	{
		return board;
	}
	
	public int hashCode()
	{
		int hash = 0;
		for (int i = 0; i < board.length; i++) 
		{
			if(board[i] == 0)
			{
				hash++;
			}
		}
		return hash;
	}
}
