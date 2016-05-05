package Game.Backgammon;
import page.*;

/**
 * <p>Title: CC-Gammon</p>
 * <p>Description: A Backgammon player using function approximators.</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: McGill University</p>
 * <p>Uniformly randomly generates state samples for use with the dual memory
 * system, version U.</p>
 * <p>Known bugs: Uniform state sampling ignores invalid states.</p>
 * @author Marc G. Bellemare
 * @version 1.0
 * @todo Allow sampling uniform-action selection states (instead of uniform
 * states).
 * @todo Implement valid-state checking.
 */

public class BackgammonStateSampler
{
  protected MultiAgentStateRepresentation m_StateRep;
  protected boolean m_UniformState;
  protected boolean m_DefaultInvalid;
  /** Whether we should sample from both points of view */
  protected boolean m_MultiPlayer;

  public BackgammonStateSampler(MultiAgentStateRepresentation rep, boolean ustate, boolean invalid,
                                boolean multiplayer)
  {
    m_StateRep = rep;
    m_UniformState = ustate;
    m_DefaultInvalid = invalid;
  }

  public BackgammonState getUniformStateSample (boolean allowInvalid)
  {
    // @@@ implement this once we find a sure way to test for a state's validity
    if (!allowInvalid)
      throw new UnsupportedOperationException ("Valid states-only sampling is not supported.");

    int who;
    int checkers[] = new int[] {15, 15};
    // Create a new board with a random turn
    BackgammonState ret = new BackgammonState((int)(BGConsts.rand.nextDouble()*2.0));
    ret.clearBoard();
    int points[][] = ret.getBoard();

    who = (int)(BGConsts.rand.nextDouble()*2.0);
    // Each player, in turn, places a checker somewhere
    while (checkers[who] > 0)
    {
      int point;

      // Find an empty point
      // @@@ this can be made in a nicer way
      do
        point = (int)(BGConsts.rand.nextDouble()*26.0);
      while (points[point][BGConsts.OTHER[who]] > 0);

      // Place a checker on this point
      points[point][who]++;
      checkers[who]--;
      // Let the other place a checker
      who = BGConsts.OTHER[who];
    }

    return ret;
  }

  public double[] getUniformStateSampleRepresentation (boolean allowInvalid)
  {
    BackgammonState s = getUniformStateSample(allowInvalid);
    if (m_MultiPlayer)
    {
      // This is sort of odd as we should technically have a random representation
      //  as well. However the other sampling methods always sample from after states,
      //  ie when it is the other's turn to play.
      m_StateRep.setWho (BGConsts.OTHER[s.getTurn()]);
    }
    return m_StateRep.getRepresentation(s);
  }

  /**
   * Returns the default sample representation, which is based on the constructor
   * parameters.
   * @return The sample representation.
   */
  public double[] getSampleRepresentation ()
  {
    BackgammonState s = getSample();

    if (m_MultiPlayer)
      m_StateRep.setWho (BGConsts.OTHER[s.getTurn()]);
    return m_StateRep.getRepresentation(s);
  }

  public BackgammonState getSample()
  {
    if (m_UniformState)
      return getUniformStateSample (m_DefaultInvalid);
    else
      throw new UnsupportedOperationException ("Trajectory sampling not implemented.");
  }
}
