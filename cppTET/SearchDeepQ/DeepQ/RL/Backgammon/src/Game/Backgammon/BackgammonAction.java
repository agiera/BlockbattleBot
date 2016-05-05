package Game.Backgammon;

import page.*;
import java.util.StringTokenizer;

/**
 * <p>Title: CC-Gammon</p>
 * <p>Description: A BackGammon player using function approximators.</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: McGill University</p>
 * <p>Class used to represent a backgammon action. The moves are ordered,
 * that is 1-3,3-5 is not the same as 3-5,1-3 (since there might not be a
 * checker in 3 before it is moved from 1-3).</p>
 * @author Marc G. Bellemare
 * @version 1.0
 */

public class BackgammonAction extends AbstractAction
{
  /** List of moves for this action */
  protected BackgammonMove[] m_Moves;
  /** Number of valid moves in the array */
  protected int nMoves;

  /** Creates an action based on the given list of moves.
   * @param list  The list of moves to be kept for this action.
   */

  public BackgammonAction(BackgammonMove[] list)
  {
    m_Moves = list;
    nMoves = list.length;
    m_Cost = 0;
  }

  /** Creates an action with the given amount of moves. Those moves must be
   * added using the setMove or addMove methods. Until then, they are invalid.
   * @param count The number of moves the action should contain. If count == 0,
   *  this action is equivalent to skipping a turn.
   */

  public BackgammonAction (int count)
  {
    // Allocate the array, but leave the moves as <0,0>
    m_Moves = new BackgammonMove[count];
    nMoves = 0;
    m_Cost = 0;
  }

  public BackgammonMove [] getMoves () { return m_Moves; }
  public int getNMoves () { return nMoves; }

  public void setMove (int m, int point, int die)
  {
    if (m_Moves[m] == null)
      m_Moves[m] = new BackgammonMove (point, die);
    else
    {
      m_Moves[m].point = point;
      m_Moves[m].die = die;
      // Technically incorrect, since we might have null moves before this one
      nMoves = m+1;
    }
  }

  public boolean addMove (int point, int die)
  {
    if (nMoves == m_Moves.length) return false;
    else
    {
        // Set the die and increment the number of moves
        m_Moves[nMoves] = new BackgammonMove (point, die);
        nMoves++;
        return true;
    }
  }

  /**
   * Parse a text command and converts it into a BackgammonAction. The command
   * should be in the form p1/d1 p2/d2 [p3/d3 p4/d4] where p are points and d
   * are the corresponding dice. Also accepted are p1/d1d2..., which expands to
   * p1/d1 p1/d2 p1/... Also accepted is p1-p1e p2-p2e... which moves from p1 to
   * p1e. Short form is p1-p2-p2e. Note that the values' validity is not enforced.
   *
   * @param s The string to be parsed.
   * @return The action corresponding to the string, or null if it is invalid.
   */
  public static BackgammonAction parseAction (String s, int who)
  {
    StringTokenizer words = new StringTokenizer (s);
    BackgammonMove[] moves = new BackgammonMove[BGConsts.MAX_NMOVES];

    int n = 0;

    if (s.equals("s") || s.equals("skip"))
      return new BackgammonAction (0);

    // Get all the words
    while (words.hasMoreTokens())
    {
      // Fail if we have more than 4 moves
      if (n >= moves.length) return null;

      String word = words.nextToken();

      // Does this contain a slash?
      if (word.indexOf ('/') >= 0)
      {
        // Parse the words according to slashes
        StringTokenizer parts = new StringTokenizer (word, "/");

        try
        {
          int pt = Integer.parseInt (parts.nextToken());
          String dice = parts.nextToken();

          // For each die given, create a move out of it
          for (int i = 0; i < dice.length(); i++)
            {
              String x = dice.substring(i,i+1);
              int die = Integer.parseInt(x);

              moves[n] = new BackgammonMove (pt, die);
              n++;
            }
        }
        catch (Exception e)
        {
          // Return null if one of the arguments was bad, or if we didn't have
          //  enough tokens...
          return null;
        }
      }
      else if (word.indexOf ('-') >= 0)
      {
        StringTokenizer parts = new StringTokenizer (word, "-");

        try
        {
          int start = Integer.parseInt (parts.nextToken());

          if (!parts.hasMoreTokens()) throw new Exception ("Missing end die");
          // Loop through the list of pairs a-b and create moves
          do
          {
            int end = Integer.parseInt(parts.nextToken());
            // If white is playing, the walk direction is reversed
            moves[n] = new BackgammonMove (start, who == BGConsts.RED?
                                           end - start : start - end);

            // The last pair's end becomes the next pair's start
            start = end;
            n++;
          }
          while (parts.hasMoreTokens());
        }
        catch (Exception e)
        {
          // Return null - the argument was incorrect
          return null;
        }
      }
    }

    // No moves is not valid
    if (n == 0) return null;

    // Contract the array so that it has no null moves
    if (n < moves.length)
      {
        BackgammonMove[] rmoves = new BackgammonMove[n];
        for (int i = 0; i < n; i++)
          rmoves[i] = moves[i];
        moves = rmoves;
      }

    return new BackgammonAction (moves);
  }
}
