package Game.Backgammon;

import java.io.*;

/**
 * <p>Title: CC-Gammon</p>
 *
 * <p>Description: A Backgammon player using function approximators.</p>
 *
 * <p>Copyright: Copyright (c) 2004</p>
 *
 * <p>Company: McGill University</p>
 *
 * <p>Implements methods for drawing the backgammon board as text.</p>
 * @author Marc G. Bellemare
 * @version 1.0
 */
public class BackgammonTextBoard
{
  protected static String BaseBoard;
  protected static final String fileName = "board.txt";

  /**
   * Helper function for toString, draws up to 15 men at the given location,
   * using the given parameters.
   *
   * @param text Char array to be drawn into.
   * @param limit Number of men to be drawn.
   * @param c Character representing one man.
   * @param x Base x for drawing.
   * @param y Base y for drawing.
   * @param up Whether the other men should be drawn above or below the first.
   */
  protected static void drawMen (char[] text, int limit, char c,
                                 int x, int y, boolean up)
  {
    for (int m = 0; m < limit && m < 15; m++)
    {
      // If we need to draw a 6th man, change columns and reset the y to its
      //  initial value
      if (m == 5) { x--; y += up?5:-5; }
      // Same with 10 men, now we draw it to the right of the first man
      else if (m == 10) { x+=2; y += up?5:-5; }

      // Compute the text offset based on the y-value
      int y_off = (up? (y-m):(y+m)) * 58;

      text[y_off+x] = c;
    }
  }

  public static String toString (BackgammonState s)
  {
    // First we set up the basic canvas
    if (BaseBoard == null)
      {
        try
        {
          loadBaseBoard (fileName);
        }
        catch (FileNotFoundException e)
        {
          return "no board found";
        }
      }

    // @@@ make sure we're not modifying the base board directly
    String base = BaseBoard;
    char[] text = base.toCharArray();

    int[][] points = s.getBoard();

    int pt;
    // Then we add w's and r's to represent the men
    for (pt = 1; pt <= 24; pt++)
    {
      boolean low;
      int x, y;
      // Get the x, y coordinates for this point
      if (pt <= 12) // Lower board
      {
        low = true;
        y = 13;
        x = 2 + 4 * (12 - pt);
        if (pt <= 6) x += 4;
      }
      else
      {
        low = false;
        y = 3;
        x = 2 + 4 * (pt - 13);
        if (pt >= 19) x += 4;
      }

      int limit;
      char c;

      // Find whether we have red or white people on that point
      if (points[pt][BGConsts.RED] > 0)
      {
        limit = points[pt][BGConsts.RED];
        c = 'r';
      }
      else // Reasonably assumes that we cannot have both red and white men on a point
      {
        limit = points[pt][BGConsts.WHITE];
        c = 'w';
      }

      // Now either draw red men or white men
      // @@@ make this a subroutine drawmen (count, x, y)
      drawMen (text, limit, c, x, y, low);
    }

    // Also draw the bars, then the homes
    drawMen (text, points[BGConsts.BAR[BGConsts.RED]][BGConsts.RED], 'r',
             2+4*6, 13, true);
    drawMen (text, points[BGConsts.BAR[BGConsts.WHITE]][BGConsts.WHITE], 'w',
             2+4*6, 3, false);

    drawMen (text, points[BGConsts.HOME[BGConsts.RED]][BGConsts.RED], 'r',
             3+4*13, 2, false);
    drawMen (text, points[BGConsts.HOME[BGConsts.WHITE]][BGConsts.WHITE], 'w',
             3+4*13, 14, true);


    // Then we tell whose turn it is and the dice roll
    String ret = new String(text);
    ret += "\nIt is " + BGConsts.ColorNames[s.getTurn()] + "'s turn.";

    int[] roll = s.getRoll();
    ret += "\nDice roll: " + roll[0] + " " + roll[1];
    return ret;
  }

  public static void loadBaseBoard (String fName) throws FileNotFoundException
  {
    FileReader fr = new FileReader (fName);
    BufferedReader read = new BufferedReader (fr);

    BaseBoard = "";

    do
      {

        int c;

        try
        {
          c = read.read();
        }
        catch (IOException e)
        {
          // Simply report it as EOF
          c = -1;
        }

        if (c == -1) // Test for EOF
          break;

        BaseBoard += (char)c;
      }
    while (true);
  }
}
