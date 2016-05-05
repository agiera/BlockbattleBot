package Game.Backgammon;
import page.*;
import java.lang.Math;

/**
 * Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)</p>
 */
public class BackgammonEnvironment extends MultiAgentEnvironment
{
  protected int m_PrintInterval;
  protected int m_Turn;
  protected int m_Win;
  protected int m_Games;

  public BackgammonState getState () { return (BackgammonState)m_State; }
  public int getTurn () { return m_Turn; }
  public void setGames (int g) { m_Games = g; }
  public int getGames () { return m_Games; }

  public Agent[] getPlayers() { return m_Players; }

  public BackgammonEnvironment(boolean stateRewards, boolean actionRewards)
  {
    // Make an environment with no printing
    this (stateRewards, actionRewards, 0);
  }

  public BackgammonEnvironment(boolean stateRewards, boolean actionRewards,
                               int p_Interval)
  {
    super (stateRewards, actionRewards);
    m_PrintInterval = p_Interval;
    m_Turn = 1;
  }

  public int getWin () { return m_Win; }

  /** Start the game in a random state. */
  public int go (Agent[] players)
  {
    int d1, d2;

    // Equivalent to a Bernoulli trial except that it is fancier
    do
    {
      d1 = dRoll(6);
      d2 = dRoll(6);
    }
    while (d1 == d2);

    return go (players,
               new BackgammonState ((d1 > d2? BGConsts.RED : BGConsts.WHITE), true));
  }

  public int dRoll (int size) { return (int)(BGConsts.rand.nextDouble() * size + 1); }

  /**
   * Roll the dice.
   */
  public void actEnvironment()
  {
    BackgammonState s = (BackgammonState)m_State;
    int[] dice = s.getRoll();

    // Roll the dice
    for (int i = 0; i < dice.length; i++)
      dice[i] = dRoll(6);

    // Notify the player if it's not their turn
    for (int i = 0; i < m_Players.length; i++)
      if (m_Players[i] != m_Players[m_State.getTurn()] &&
          m_Players[i] instanceof BackgammonHumanPlayer)
      {
        BackgammonHumanPlayer bhp = (BackgammonHumanPlayer)m_Players[i];
        bhp.notifyState (s);
      }

    // Print the board at given intervals if requested (for non-local or AI games)
    if (m_PrintInterval != 0 && m_Turn % m_PrintInterval == 0)
      System.out.println (BackgammonTextBoard.toString(s));

    m_Turn++;
  }

  /**
   * If one of the players left the game early, he/she loses.
   */
   public void stopEpisode()
   {
     BackgammonState s = (BackgammonState)m_State;

     s.setForcedWin(BGConsts.OTHER[s.getTurn()]);
   }

   public void endEpisode (MultiAgentState mas)
   {
     BackgammonState s = (BackgammonState)mas;
     double val = s.getValue(BGConsts.RED);

     if (val > 0)
       m_Win = BGConsts.RED;
     else if (val < 0)
       m_Win = BGConsts.WHITE;
     else
       m_Win = -1;

     m_Turn = 1;
  }

  public void newEpisode (MultiAgentState mas)
  {
    // Roll the initial dice
    actEnvironment();
  }
  
  public int getCurrentPlayerId()
  {
	    return m_State.getTurn();
  }
}
