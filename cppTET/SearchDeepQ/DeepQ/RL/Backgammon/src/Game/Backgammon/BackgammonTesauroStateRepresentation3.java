package Game.Backgammon;
import page.*;

/**
 * <p>Title: CC-Gammon</p>
 * <p>Description: A Backgammon player using function approximators.</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: McGill University</p>
 * <p>Relative representation of the state.
 *  Version 3 removed the unused turn inputs.</p>
 * @todo <Enter description of the state representation here>
 * @author Marc G. Bellemare
 * @version 3.0
 */

public class BackgammonTesauroStateRepresentation3 extends MultiAgentStateRepresentation
{
  public BackgammonTesauroStateRepresentation3(int who)
  {
    super (who);
    m_OutputCount = 196;
  }

  protected void setPoint (int men, double [] inputs, int offset)
  {
    if (men >= 1)
    {
      inputs[offset] = 1.0;
      if (men >= 2)
      {
        inputs[offset+1] = 1.0;
        if (men >= 3)
        {
          inputs[offset+2] = 1.0;
          if (men >= 4)
            inputs[offset+3] = ((double)(men - 3)) / 2;
        }
      }
    }
  }

  /**
   * Returns Tesauro's Backgammon state representation. Most units are binary but
   * some have a degree of activation, which can go beyond 1.0. The state
   * representation is relative to which side we are playing.
   *
   * @param s The state for which we want the representation.
   * @return The resulting representation.
   */
  public double [] getRepresentation (State s)
  {
    BackgammonState bs = (BackgammonState) s;

    int who = m_WhoAmI;
    int other = BGConsts.OTHER[who];

    int points[][] = bs.getBoard();
    double[] inputs = new double[196];

    // First the 24 points: we thermometer encode the three first men there
    int start, end, delta;
    if (who == BGConsts.RED)
    {
      start = 1;
      end = 25;
      delta = 1;
    }
    else
    {
      start = 24;
      end = 0;
      delta = -1;
    }

    for (int i = start, j = 0; i != end; i += delta, j++)
    {
      setPoint (points[i][who], inputs, 8*j);
      setPoint (points[i][other], inputs, 8*j+4);
    }

    // Now we encode the number of men on the bar as n/2
    inputs[192] = ((double)points[BGConsts.BAR[who]][who])/2;
    inputs[193] = ((double)points[BGConsts.BAR[other]][other])/2;
    // The number of checkers already borne off as n/15
    inputs[194] = ((double)points[BGConsts.HOME[who]][who])/15;
    inputs[195] = ((double)points[BGConsts.HOME[other]][other])/15;

    return inputs;
  }
}
