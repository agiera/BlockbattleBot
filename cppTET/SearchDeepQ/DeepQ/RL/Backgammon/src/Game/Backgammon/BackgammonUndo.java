package Game.Backgammon;

/**
 * <p>Title: CC-Gammon</p>
 * <p>Description: A Backgammon player using function approximators.</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: McGill University</p>
 * <p>Stores one move (not action)'s undo information.
 * @author Marc G. Bellemare
 * @version 1.0
 */

public class BackgammonUndo
{
  public int start, end;
  public boolean hit;
  public int who;

  public BackgammonUndo(int s, int e, boolean h, int w)
  {
    start = s;
    end = e;
    hit = h;
    who = w;
  }

}
