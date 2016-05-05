package Game.Backgammon;
import page.*;

/**
 * Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 */
public class MultiAgentEnvironment implements Environment
{
  protected Agent m_Players[];
  protected MultiAgentState m_State;

  protected boolean m_UseStateRewards;
  protected boolean m_UseActionRewards;

  protected int m_MaxSteps = 0;

  /** Interval at which dots should be printed (in steps). Set to 0 for no dots. */
  public int dotInterval = 10;

  /**
   * Create a MultiAgentEnvironment with the given parameters and no time limit.
   *
   * @param stateRewards boolean
   * @param actionRewards boolean
   */
  public MultiAgentEnvironment(boolean stateRewards, boolean actionRewards)
  {
    this (stateRewards, actionRewards, 0);
  }

  public MultiAgentEnvironment(boolean stateRewards, boolean actionRewards,
                               int maxSteps)
  {
    m_UseStateRewards = stateRewards;
    m_UseActionRewards = actionRewards;
    m_MaxSteps = maxSteps;
  }

  public void Init (Agent [] players, MultiAgentState initState)
  {
    m_State = initState;
    m_Players = players;
  }

  public int go (Agent [] players, MultiAgentState initState)
  {
    // @@@ Throw an exception
    if (initState.supportsDo() == false) return 0;

    Init (players, initState);

    newEpisode (initState);

    for (int i = 0; i < players.length; i++)
      players[i].newEpisode(initState);

    int count = 0;
    double[] rewards = new double[players.length];

    for (int i = 0; i < rewards.length; i++)
      rewards[i] = 0;

    boolean first[] = new boolean[2];
    first[0] = true;
    first[1] = true;

    // Play until one of the players has won
    while (!m_State.isFinal() && (m_MaxSteps == 0 || count < m_MaxSteps))
    {
      if (dotInterval != 0 && (count+1) % dotInterval == 0)
        System.out.print (".");

      int curTurn = m_State.getTurn();

      // Our policy here is to return one reward between each of the player's
      //  turns, before they take their next action.
      if (first[curTurn])
        first[curTurn] = false;
      else
      {
        players[curTurn].returnReward(m_State, rewards[curTurn]);
        rewards[curTurn] = 0;

        // Allow the environment to act
        if (m_State.getSuccess()) actEnvironment();
      }

      // Request an action
      Action a = players[curTurn].requestAction(m_State);
      if (a == null) // Forfeit?
      {
        stopEpisode ();
        break;
      }

      // Do this action. If it is invalid, the state should be left unchanged;
      //  else the state's turn will also be modified.
      m_State.doAction(a);
      // @@@ must get the dice roll in

      // @@@ tell the players the action that was done, for output purposes?
      // If the action was successful, grant rewards
      if (m_State.getSuccess() == true)
        {
          // For all players...
          for (int i = 0; i < players.length; i++)
          {
            double r = 0;
            // Compute the reward for this player
            if (m_UseStateRewards)
              r += m_State.getValue (i);
              // Use action cost if he is the one who did the action
            if (m_UseActionRewards && i == curTurn)
              r -= a.getCost();

            // Cumulate the rewards
            rewards[i] += r;
          }
        }

      // @@@ Allow for an action failure cost?
      count++;
    }

    /*
    for (int i = 0; i < players.length; i++)
    {
      // Also return partial rewards
      players[i].returnReward(m_State, rewards[i]);
      players[i].endEpisode(m_State);
    }
    */
    // Only return rewards for the one of the players
    players[1].returnReward(m_State, rewards[1]);
    players[1].endEpisode(m_State);

    endEpisode (m_State);
    return count;
  }

  public void actEnvironment()
  {
  }

  public void stopEpisode()
  {
  }

  public void endEpisode(MultiAgentState s)
  {
  }

  public void newEpisode(MultiAgentState s)
  {
  }
}
