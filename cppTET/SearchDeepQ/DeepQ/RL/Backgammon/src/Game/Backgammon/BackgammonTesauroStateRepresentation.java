package Game.Backgammon;
import page.*;

/**
 * <p>Title: CC-Gammon</p>
 * <p>Description: A Backgammon player using function approximators.</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: McGill University</p>
 * <p>Version 1 has a static state representation, player-independant.</p>
 * @todo <Enter description of the state representation here>
 * @author Marc G. Bellemare
 * @version 1.0
 * @deprecated
 */

public class BackgammonTesauroStateRepresentation extends AbstractStateRepresentation
{
  protected int m_WhoAmI;

  public BackgammonTesauroStateRepresentation(int who)
  {
    m_OutputCount = 198;
    m_WhoAmI = who;
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

    // @@@ fix me to be color-independant
    int who = m_WhoAmI;
    int other = BGConsts.OTHER[who];

    int points[][] = bs.getBoard();
    double[] inputs = new double[198];

    // First the 24 points: we thermometer encode the three first men there
    // @@@ this should be reversed if who is white
    for (int i = 1; i <= 24; i++)
    {
      setPoint (points[i][who], inputs, 8*(i-1));
      setPoint (points[i][other], inputs, 8*(i-1)+4);
    }

    // Now we encode the number of men on the bar as n/2
    inputs[192] = ((double)points[BGConsts.BAR[who]][who])/2;
    inputs[193] = ((double)points[BGConsts.BAR[other]][other])/2;
    // The number of checkers already borne off as n/15
    inputs[194] = ((double)points[BGConsts.HOME[who]][who])/15;
    inputs[195] = ((double)points[BGConsts.HOME[other]][other])/15;

    // And the turn in a binary fashion
    inputs[196] = bs.getTurn() == who? 1.0 : 0.0;
    inputs[197] = bs.getTurn() == other? 1.0 : 0.0;

    return inputs;
  }
}
