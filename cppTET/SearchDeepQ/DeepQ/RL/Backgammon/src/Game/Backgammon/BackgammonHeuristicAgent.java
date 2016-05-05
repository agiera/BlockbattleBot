package Game.Backgammon;
import page.*;
import java.io.*;

/**
 * Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 */
public class BackgammonHeuristicAgent extends AbstractAgent
{
  protected int m_Who;
  protected PrintStream m_out;

  public BackgammonHeuristicAgent(int who)
  {
    m_Who = who;
  }

  public void setVerboseStream (PrintStream s) { m_out = s; }
  public PrintStream getVerboseStream () { return m_out; }

  public double getValue (BackgammonState s)
  {
    int who = m_Who;
    int other = BGConsts.OTHER[m_Who];

    return getValue (s, who) - getValue (s, other);
  }

  protected double getValue (BackgammonState s, int who)
  {
    double value = 0;
    int [][] points;

    if (s.getValue(who) > 0) return 1.0;
    else if (s.getValue(who) < 0) return -1.0;

    points = s.getBoard();
    // 1/15th of a point per man home
    value += (double)points[BGConsts.HOME[who]][who] / 15.0;

    // -1/5th of a point per man on the bar
    value -= (double)points[BGConsts.BAR[who]][who] / 5.0;

    for (int i = 1; i <= 24; i++)
    {
      // -1/10th of a point for each blot
      // +1/20th for contiguous points
      if (points[i][who] == 1) value -= 0.10;
      else if (i > 1 && points[i][who] >= 2 && points[i-1][who] >= 2) value += 0.05;

      int dist = Math.abs(BGConsts.HOME[who] - i);

      // value based on closeness to home
      value += (12.5 - dist) * (double)points[i][who] / (225.0);
    }

    return value;
  }

  public static Action[] randomizeActions(Action[] actions)
  {
          Action a;
          for (int i=0; i<actions.length; i++)
          {
                  int j = (int)(BGConsts.rand.nextDouble()*actions.length);

                  a = actions[i];
                  actions[i] = actions[j];
                  actions[j] = a;
          }
          return actions;
  }

  public Action requestAction (State s)
  {
    BackgammonState currentState = (BackgammonState)s;

    // Get the valid actions for this state
    Action[] actions = currentState.getActions();
    actions = randomizeActions(actions);

    BackgammonState nextState = (BackgammonState)currentState.clone();

    Action bestAction = null;
    double bestValue = 0;

    // Try all the actions in turn and pick the best one
    for (int i = 0; i < actions.length; i++)
    {
      nextState.doAction(actions[i]);
      double value = getValue(nextState);

      if (bestAction == null || value > bestValue)
      {
        bestAction = actions[i];
        bestValue = value;
      }

      nextState.undoAction();
    }

    if (m_out != null)
    {
      System.out.println (BGConsts.ColorNames[currentState.getTurn()]+
                          "'s position is worth "+bestValue);
    }

    return bestAction;
  }

  public void returnReward (State s, double r)
  {
  }

  public void endEpisode (State s)
  {
  }

  public void newEpisode (State s)
  {
  }
}
