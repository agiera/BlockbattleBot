package Game.Backgammon;
import page.*;

/**
 * <p>Title: CC-Gammon</p>
 * <p>Description: A Backgammon player using function approximators.</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: McGill University</p>
 * @author Marc G. Bellemare
 * @version 1.0
 */

public abstract class MultiAgentStateRepresentation extends AbstractStateRepresentation
{
  protected int m_WhoAmI;

  public int getWho () { return m_WhoAmI; }
  public void setWho (int who) { m_WhoAmI = who; }

    public MultiAgentStateRepresentation(int who)
    {
      m_WhoAmI = who;
    }

}
