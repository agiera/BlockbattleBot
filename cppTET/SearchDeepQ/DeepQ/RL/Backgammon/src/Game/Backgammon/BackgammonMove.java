package Game.Backgammon;

/**
 * <p>Title: CC-Gammon</p>
 * <p>Description: A BackGammon player using function approximators.</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: McGill University</p>
 * <p>Simple storage class for a Backgammon move.</p>
 * @author Marc G. Bellemare
 * @version 1.0
 */

public class BackgammonMove
{
  public int point, die;

  public BackgammonMove(int p, int d)
  {
    point = p;
    die = d;
  }

}
