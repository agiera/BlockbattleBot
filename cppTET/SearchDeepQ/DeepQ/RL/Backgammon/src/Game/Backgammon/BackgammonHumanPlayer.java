package Game.Backgammon;

import java.io.*;
import page.*;

import java.util.StringTokenizer;

/**
 * <p>Title: CC-Gammon</p>
 * <p>Description: A Backgammon player using function approximators.</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: McGill University</p>
 * <p>Defines a human Backgammon player. Input and output streams must be supplied.
 * @author Marc G. Bellemare
 * @version 1.0
 */

public class BackgammonHumanPlayer extends AbstractAgent
{
  protected InputStream m_In;
  protected PrintStream m_Out;
  protected boolean m_Verbose;
  protected int m_Player;

  protected boolean m_Resigned = false;

  /**
   * Create a new Backgammon player with the given parameters. It will be
   * prompted for moves through the input/output streams.
   *
   * @param in Player's input stream.
   * @param out Player's output stream.
   * @param verbose Whether the player should get debugging information.
   */
  public BackgammonHumanPlayer(int who, InputStream in, PrintStream out, boolean verbose)
  {
    m_Player = who;
    m_In = in;
    m_Out = out;
    m_Verbose = verbose;
  }

  public Action requestAction (State cs)
  {
    BackgammonState s = (BackgammonState)cs;
    BufferedReader in = new BufferedReader (new InputStreamReader (m_In));
    // First print the board
    m_Out.println (BackgammonTextBoard.toString (s));

    BackgammonAction act = null;

    if (s.getSuccess() == false) // The last move we issued was wrong
      m_Out.println (s.getLastError());

    while (!m_Resigned && !s.isFinal() && act == null)
    {
      m_Out.print ("Your move: ");
      String cmd;

      try
      {
        cmd = in.readLine ();
      }
      catch (IOException e)
      {
        return null;
      }

      // Test if the player inputted some misc. action
      if (miscAction (cmd, s) == true)
        continue;
      // Test if the player gave an admin command
      if (adminAction (cmd, s) == true)
        continue;

      act = BackgammonAction.parseAction (cmd, s.getTurn());

      if (act != null)
      {
        // Enforce correct values
        BackgammonMove[] moves = act.getMoves();

        if (moves != null)
          {
            for (int i = 0; i < moves.length; i++)
              if (moves[i].point < 0 || moves[i].point > 25 ||
                  moves[i].die < 1 || moves[i].die > 6)
              {
                //  @@@ print specific error message
                act = null;
                break;
              }
          }
      }

      // Print error and retry (as per the while loop)
      if (act == null)
        m_Out.println ("Incorrect move entry.");
    }

    // We want the error messages
    s.setWantsErrors(true);
    return act;
  }

  public void returnReward (State s, double r)
  {
    BackgammonState bs = (BackgammonState)s;

    // If not our turn, also print the board
    // @@@ must wait until dice roll has been rolled
    if (m_Player != BGConsts.BOTH && bs.getTurn() != m_Player)
      m_Out.println (BackgammonTextBoard.toString(bs));

    if (r != 0 && m_Verbose)
      m_Out.println("Reward received: "+r);
  }

  public void newEpisode (State s)
  {
    // @@@ print board if not our turn
    if (m_Verbose)
      {
        BackgammonState bs = (BackgammonState)s;
        if (m_Player != BGConsts.BOTH && bs.getTurn() != m_Player)
          m_Out.println ("New game - "+BGConsts.ColorNames[bs.getTurn()]+
                            " goes first.");
      }
  }

  public void endEpisode (State s)
  {
    if (m_Verbose)
    {
      BackgammonState bs = (BackgammonState)s;

      String winner;
      int val = (int)bs.getValue(BGConsts.RED);

      if (val > 0)
        winner = BGConsts.ColorNames[BGConsts.RED] + " won ";
      else if (val < 0)
        winner = BGConsts.ColorNames[BGConsts.WHITE] + " won ";
      else
        winner = "draw.";

      if (val < 0) val = -val;
      if (val > 0)
      {
        winner += "("+val+" point";
        if (val > 1) winner += "s";
        winner += ").";
      }

      m_Out.println ("End of game - "+winner);
    }
  }

  public void notifyState (BackgammonState s)
  {
    // Print the board
    m_Out.println (BackgammonTextBoard.toString(s));
  }

  /** Interface function. */
  protected boolean miscAction (String cmdline, BackgammonState s)
  {
    if (cmdline == null || cmdline.length() == 0) return true;

    StringTokenizer token = new StringTokenizer (cmdline);
    String cmd = token.nextToken();

    if (cmd.equals("r")) // Redraw
    {
      m_Out.println(BackgammonTextBoard.toString(s));
      return true;
    }

    if (cmd.equals("?")) // Help
    {
      m_Out.println("No extensive help available. Commands:\n"+
                    "p-p, p-p-p, p/d, p/dd where p is a point, d a die: move checker.\n"+
                    "skip: skip your turn if no move can be done.\n"+
                    "r: redraw the board.\n" +
                    "q: forfeit the game and quit.\n");
      return true;
    }

    if (cmd.equals("q")) // Quit
    {
      m_Resigned = true;
      return true;
    }

    return false;
  }

  /***** For debugging purposes *****/
  protected boolean adminMode = true;


  protected boolean adminAction (String cmdline, BackgammonState s)
  {
    if (adminMode == false) return false;
    if (cmdline == null || cmdline.length() == 0) return true;

    StringTokenizer token = new StringTokenizer(cmdline);

    String cmd = token.nextToken();

    // Undo
    if (cmd.equals("u"))
    {
      s.undoAction();
      m_Out.println(BackgammonTextBoard.toString(s));
      m_Out.println ("Action undone.");

      // Return true - we did parse the command
      return true;
    }

    // Clear
    else if (cmd.equals ("c"))
    {
      s.clearBoard();
      m_Out.println(BackgammonTextBoard.toString(s));
      return true;
    }

    else if (cmd.equals ("s"))
    {
      try
      {
        int pt = Integer.parseInt (token.nextToken());
        int count = Integer.parseInt (token.nextToken());

        int who;
        if (!token.hasMoreTokens()) who = s.getTurn();

        else
          {
            who = BGConsts.parseWho (token.nextToken());
            if (who == -1) throw new Exception ("Wrong player name.");
          }

        // @@@ Put in State.setPoint?
        int [][] points = s.getBoard();
        points[pt][who] = count;
        s.setDirty();

        m_Out.println(BackgammonTextBoard.toString(s));
        return true;
      }
      catch (Exception e)
      {
        m_Out.println ("Usage: set <point> <count> <who>");
        return true;
      }
    }
    else if (cmd.equals ("w")) // Write state to disk
    {
      String fName;
      if (!token.hasMoreTokens()) fName = "state";
      else fName = token.nextToken();

      try
      {
        // Flash the BackgammonState to fname.dat
        ObjectOutputStream outData = new ObjectOutputStream (new FileOutputStream (fName+".dat"));
        outData.writeObject(s);

        // And dump the state as text to fname.txt
        PrintStream outText = new PrintStream (new FileOutputStream (fName+".txt"));
        outText.println(BackgammonTextBoard.toString(s));
      }
      catch (Exception e)
      {
        m_Out.println ("State snapshot failed: "+e.getMessage());
      }
      return true;
    }

    return false;
  }
}
