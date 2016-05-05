package page;

import Game.Backgammon.BGConsts;

/**
 * <p>Title: Neural Network Simulator</p>
 *
 * <p>Description: This is a neural network simulator that include principally:
 *
 * <p>Copyright: Copyright (c) Francois Rivest / Marc G. Bellemare</p>
 *
 * <p>Company: LNSC/McGill University</p>
 * <p>Random agent to be used with states that support action generators.</p>
 * @author Marc G. Bellemare
 * @version 1.0
 */
public class RandomAgent extends AbstractAgent
{
  ActionGenerator m_ActionGenerator;

  public RandomAgent (ActionGenerator gen)
  {
    m_ActionGenerator = gen;
  }

  public Action requestAction (State s)
  {
    Action[] actions = m_ActionGenerator.getActions(s);
    int idx = (int) (BGConsts.rand.nextDouble() * actions.length);
    return actions[idx];
  }

  public void newEpisode (State s) {}

  public void endEpisode (State s) {}

  public void returnReward (State s, double r) {}
}
