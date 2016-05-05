package Game.Backgammon;

import page.*;
import java.util.LinkedList;

/**
 * <p>Title: CC-Gammon</p>
 *
 * <p>Description: A BackGammon player using function approximators.</p>
 *
 * <p>Copyright: Copyright (c) 2004</p>
 *
 * <p>Company: McGill University</p>
 *
 * <p>This class defines a Backgammon state in terms of the number of checkers
 * on a point and the color of these checkers. </p>
 * <p>Bug: The undo queue can contain partial actions.</p>
 * @author Marc G. Bellemare
 * @version 1.0
 */
public class BackgammonState extends AbstractMultiAgentStateWithGen
{
  /** Defines the red color */
  public static final int RED = 0;
  /** Defines the white color */
  public static final int WHITE = 1;
  /** Defines the bar locations */
  public static final int[] BAR = new int[] {0, 25};
  /** Defines the home locations */
  public static final int[] HOME = new int[] {25, 0};
  /** Defines the beginning of the inner table */
  public static final int[] INNER = new int[] {19, 6};
  /** Defines the inverse of the given color */
  public static final int[] OTHER = new int[] {1, 0};

  /** Total number of men per player */
  public static final int TOTAL_MEN = 15;

  /** Undo queue size, in moves */
  protected static final int UndoQueueSize = 12;

  protected static final int ActionsUndoQueueSize = 3;

  /** 24 points + bar + home (we assume that one player's bar is the other's player
    * home).
    */
  protected int [][] m_Points = new int[26][2];

  /** Whose turn it is to play. */
  protected int m_Turn;

  /** Forced win? */
  protected int m_ForcedWin = -1;

  /** The current dice roll */
  protected int [] m_DiceRoll = new int[2];

  /** Game value (increased by doubling) */
  protected int m_GameValue = 1;

  /** Undo queue */
  transient protected LinkedList m_UndoQueue;

  /** Contains a textual explanation of the last error. Note the static. */
  protected static String lastError;

  /** Defines whether we should set the last error string on errors. */
  protected boolean wantsErrors = false;

  protected BackgammonActionGenerator m_StaticActionGen = new BackgammonActionGenerator();

  public BackgammonState(int turn)
  {
    this(turn, false);
  }

  public BackgammonState(int turn, boolean allowUndo)
  {
    // Initial board state, 0 being the point closest to white's home
    m_Points[1][RED] = 2;
    m_Points[12][RED] = 5;
    m_Points[17][RED] = 3;
    m_Points[19][RED] = 5;

    m_Points[24][WHITE] = 2;
    m_Points[13][WHITE] = 5;
    m_Points[8][WHITE] = 3;
    m_Points[6][WHITE] = 5;

    m_Turn = turn;

    m_SupportsDo = true;
    m_SupportsUndo = allowUndo;

    m_ActionGen = m_StaticActionGen;
  }

  public void clearBoard ()
  {
    for (int i = 0; i < m_Points.length; i++)
      m_Points[i][RED] = m_Points[i][WHITE] = 0;

    m_Points[BAR[RED]][RED] = m_Points[BAR[WHITE]][WHITE] = 0;
    m_Points[HOME[RED]][RED] = m_Points[HOME[WHITE]][WHITE] = 0;

    setDirty();
  }

  public int getTurn () { return m_Turn; }
  public void setTurn (int t) { m_Turn = t; }
  public int[][] getBoard() { return m_Points; }
  public int[] getRoll() { return m_DiceRoll; }
  public void setForcedWin (int who) { m_ForcedWin = who; }
  public int getForcedWin () { return m_ForcedWin; }

  public static String getLastError() { return lastError; }
  public void setWantsErrors(boolean v) { wantsErrors = v; }
  public boolean getWantsErrors() { return wantsErrors; }

  public boolean isFinal()
  {
    return (m_ForcedWin != -1 ||
            m_Points[HOME[RED]][RED] == TOTAL_MEN ||
            m_Points[HOME[WHITE]][WHITE] == TOTAL_MEN);
  }

  public double getValue (int who)
  {
    int mul = (who == RED?1:-1);

    // Simplified game value version (1.0, 0.0, -1.0)
    if (m_Points[HOME[RED]][RED] == TOTAL_MEN || m_ForcedWin == RED)
      return mul * 1.0;
    else if (m_Points[HOME[WHITE]][WHITE] == TOTAL_MEN || m_ForcedWin == WHITE)
      return mul * -1.0;
    else
      return 0.0;
  }


  /** Applies the given move to the board. If the action is invalid, the state
   * will be left unchanged (including the current turn).
   *  @param a The move to be applied.
   */
  public boolean doAction (Action _a)
  {
    BackgammonAction a = (BackgammonAction)_a;
    BackgammonMove[] moves = a.getMoves();
    boolean ok = true;
    boolean pair;
    boolean bad_dice;
    int i;

    // Test if we have the same number on both dice
    pair = (m_DiceRoll[0] == m_DiceRoll[1]);

    bad_dice = false;

    BackgammonAction[] actions = (BackgammonAction[])getActions();
    int maxMoves;

    if (actions == null) maxMoves = 0;
    else maxMoves = actions[0].getNMoves();

    // Make sure we're using as many dice as possible
    if (moves.length < maxMoves)
    // @@@ change error message
      bad_dice = true;
    // If we used only one die and it's not the highest, note it
    else if (moves.length == 1 && m_StaticActionGen.getIgnoreLowDie() == true &&
             moves[0].die < Math.max(m_DiceRoll[0], m_DiceRoll[1]))
      // @@@ better error message
      bad_dice = true;
    else
    {
      // Try to assign the given moves to dice; if we leave the loop early there
      //  is something wrong with the move.
      int used = 0;

      for (i = 0; i < moves.length; i++)
      {
        // Test for the die's value (double)
        if (pair)
        {
          if (moves[i].die != m_DiceRoll[0]) break;
        }

        else
        {
          // If not a double, assign the die's value
          if (moves[i].die == m_DiceRoll[0])
          {
            if (used == m_DiceRoll[0])
              break;
            else
              used = moves[i].die;
          }
          else if (moves[i].die == m_DiceRoll[1])
          {
            if (used == m_DiceRoll[1])
              break;
            else
              used = moves[i].die;
          }
          else
            break;
          }
      }

      if (i < moves.length)
        bad_dice = true;
    }

    if (bad_dice)
    {
      m_Success = false;
      lastError = BGConsts.DiceNotRolledError;
      return m_Success;
    }

    for (i = 0; i < moves.length; i++)
      if (doMove (moves[i]) == false)
        {
          ok = false;
          break;
        }

    // If all the moves were valid, also change the state's turn
    if (ok)
    {
      // We must store the action list for undoing purposes
      storeActionList();
      m_Turn = OTHER[m_Turn];
    }

    // Else reset the state to what it was before by undoing the valid moves
    else while (i > 0)
      {
        undoMove ();
        i--;
      }

    m_Success = ok;
    setDirty();
    
    return m_Success;
  }

  public void undoAction ()
  {
    if (!m_SupportsUndo || m_UndoQueue == null) return;

    // To undo a whole action, we will pop moves from the undo queue until we
    //  find that the next move to be undone belongs to the other player.
    int who = -1;

    // Loop until the undo queue is empty
    while (m_UndoQueue.size() > 0)
    {
      BackgammonUndo uInfo = (BackgammonUndo)m_UndoQueue.removeLast();

      if (who == -1) who = uInfo.who;
      // Test if we've changed of players
      else if (who != uInfo.who)
      {
        // Push this undo item back into the queue and stop undoing things
        m_UndoQueue.addLast(uInfo);
        break;
      }

      // Else undo this move
      undoMove (uInfo);
    }

    if (who != -1) // If we undid at least one move, change turns
      {
        m_Turn = who;
      }

    // Also recover the previous action list if possible
    recoverActionList();
  }

  /**
   * This method is currently bad because it dirties the action generator.
   *
   * @param act The action to be tested.
   * @return Whether the given action is valid.
   */
  public boolean isValid (BackgammonAction act)
  {
    // Here we have to actually do the action since the series of moves might
    //  not all be valid if taken individually (multi-step move)
    doAction (act);

    // If the action was actually done, we have to undo it!
    if (m_Success)
      undoAction();

    return m_Success;
  }


  /** Applies a move according to the backgammon rules. This function assumes that
   * the board state is originally valid, and tests the given move before doing it.
   *
   * @param m The move to be applied.
   * @return True if the move was valid and applied, false otherwise.
   */
  public boolean doMove (BackgammonMove m)
  {
    return doMove (m, true);
  }

  /** Applies a move according to the backgammon rules. This function assumes that
   * the board state is originally valid. It does not test for the move's validity
   * if requested not to through the 'test' flag, and should be used with caution.
   *
   * @param m The move to be applied.
   * @param test Whether to test for the move's validity.
   * @return True if the move was valid and applied, false otherwise.
   */
  public boolean doMove (BackgammonMove m, boolean test)
  {
    return doMove (m.point, m.die, test);
  }

  /** Applies a move according to the backgammon rules. This function assumes that
   * the board state is originally valid. It does not test for the move's validity
   * if requested not to through the 'test' flag, and should be used with caution.
   *
   * @param m The move to be applied.
   * @param test Whether to test for the move's validity.
   * @return True if the move was valid and applied, false otherwise.
   */
  public boolean doMove (int point, int die, boolean test)
  {
    // Create the undo queue if necessary
    if (m_SupportsUndo && m_UndoQueue == null)
      m_UndoQueue = new LinkedList();

    int who = m_Turn;

    // 0. No test is done for the move's values validity (ie correct ranges)
    if (test && !isValidMove (point, die))
      return false;
    else
    {
        int endpoint;
        boolean hit;

        if (who == RED) endpoint = point + die;
        else endpoint = point - die;

        // If moving into home with a higher-than-needed die, force the endpoint
        //  to be home
        if (endpoint < HOME[who] && who == WHITE ||
            endpoint > HOME[who] && who == RED)
        {
          endpoint = HOME[who];
        }

        // Remove the man from this point
        m_Points[point][who]--;
        // And add it there
        m_Points[endpoint][who]++;

        // Test if we hit a blot
        if (m_Points[endpoint][OTHER[who]] == 1 && endpoint != BAR[OTHER[who]])
        {
          // If so move the man to the bar
          m_Points[endpoint][OTHER[who]]--;
          m_Points[BAR[OTHER[who]]][OTHER[who]]++;
          hit = true;
        }
        else
          hit = false;

        // Add this move to the undo queue if needed
        if (m_SupportsUndo)
          {
            // Make space for this move by removing the oldest moves
            while (m_UndoQueue.size() >= UndoQueueSize) m_UndoQueue.removeFirst();
            m_UndoQueue.addLast (new BackgammonUndo (point, endpoint, hit, who));
          }
        return true;
      }
  }

  /**
   * Returns true if the given move is valid (and obeys the Backgammon rules) in
   * this board state.
   *
   * @param m The move to be tested.
   * @return Whether the move is valid.
   */
  public boolean isValidMove (BackgammonMove m)
  {
    return isValidMove (m.point, m.die);
  }

  /**
   * Returns true if the given move is valid (and obeys the Backgammon rules) in
   * this board state.
   *
   * @param point The starting point.
   * @param die The value of the die to apply to this move.
   * @return Whether the move is valid.
   */
  public boolean isValidMove (int point, int die)
  {
    // @@@ If there is a higher valued die that we can use, and that using the
    //  current one would result in this other die to be unusable, then the move
    //  is invalid.
    int who = m_Turn;

    // 1. We must be moving our own checker.
    if (m_Points[point][who] == 0)
      {
        if (wantsErrors) lastError = BGConsts.NoManThereError;
        return false;
      }

    // 2. We must have no men on the bar
    if (m_Points[BAR[who]][who] > 0 && point != BAR[who])
      {
        if (wantsErrors) lastError = BGConsts.MenOnBarError;
        return false;
      }

    int endpoint;
    boolean endmove;

    if (who == RED) endpoint = point + die;
    else endpoint = point - die;

    if (endpoint < HOME[who] && who == WHITE ||
        endpoint > HOME[who] && who == RED)
    {
      // If we are moving with a higher die than needed, note it down
      endmove = true;
      endpoint = HOME[who];
    }

    else endmove = false;

    // 3. A checker may only be moved to an open point
    if (endpoint != HOME[who] && m_Points[endpoint][OTHER[who]] > 1)
    {
      if (wantsErrors) lastError = BGConsts.OccupiedPointError;
      return false;
    }

    // 4a. Allow movement into home if we have no men out
    int sum = 0;
    if (endpoint == HOME[who])
      {
        int d = INNER[who] < HOME[who]? 1:-1;
        boolean last = false;

        // Count the total number of men on the inner table & home
        for (int i = INNER[who]; i != HOME[who]; i += d)
        {
          // If we have reached the starting point  for this move and we have not
          //  yet met any men, this is the farthest point from home which has some
          //  of our men on it (unless we have men not on the inner table).
          if (i == point && sum == 0) last = true;
          sum += m_Points[i][who];
        }
        sum += m_Points[HOME[who]][who];

        // Check if everyone's there, else this is not a valid move
        if (sum < TOTAL_MEN)
          {
            if (wantsErrors) lastError = BGConsts.MenOnOuterTableError;
            return false;
          }

        // 4b. We can only go home from this position with a higher die than the
        //  minimum needed if all other positions before are empty.
        if (endmove && !last)
          {
            if (wantsErrors) lastError = BGConsts.MenBehindError;
            return false;
          }
      }

      return true;
  }

  /**
   * Undoes the last move. Assumes that both the state and the undo information
   *  are valid to speed up the process - however this means corruption will
   *  happen if somehow the undo information is wrong.
   * @return True if the last move was undone.
   */
  public boolean undoMove ()
  {
    // Of course we cannot undo if we have no move to undo
    if (!m_SupportsUndo || m_UndoQueue.size() == 0) return false;

    // Now pop the last element we put in
    BackgammonUndo undo = (BackgammonUndo)m_UndoQueue.removeLast();
    return undoMove (undo);
  }

  /**
   * Undoes the given move. Assumes that both the state and the undo information
   *  are valid to speed up the process - however this means corruption will
   *  happen if somehow the undo information is wrong.
   * @return True if the last move was undone.
   */
  protected boolean undoMove (BackgammonUndo undo)
  {
    // Remove the man from the endpoint and put it back at start
    m_Points[undo.end][undo.who]--;
    m_Points[undo.start][undo.who]++;

    // If we hit a blot through this move, we should replace it
    if (undo.hit)
    {
      m_Points[BAR[OTHER[undo.who]]][OTHER[undo.who]]--;
      m_Points[undo.end][OTHER[undo.who]]++;
    }

    // All done!
    return true;
  }

  /* Set of functions related to the Action Generator, which uses a dirty
   * flag system to avoid redundant calls to getActions().
   */

  /** Defines whether the state is dirty (ie needs the current action list for
   * this state is not up to date).
   */
  protected boolean m_Dirty = true;

  /** Holds the list of valid actions for this state. */
  transient protected BackgammonAction[] validActions;

  /** Contains the last x turns' list of valid actions */
  transient protected LinkedList m_ActionsUndoQueue;

  /** Set this state as dirty. */
  public void setDirty() { m_Dirty = true; }

  /** Used by undoAction to recover the action list. */
  protected void recoverActionList ()
  {
    if (!m_SupportsUndo || m_ActionsUndoQueue == null) return;

    // If we have no action list to recover, we must set it as dirty
    if (m_ActionsUndoQueue.size() == 0)
      setDirty();
    else
    {
        // Recover the last action list stored
        validActions = (BackgammonAction[])m_ActionsUndoQueue.removeLast();
        m_Dirty = false;
    }
  }

  /** Used by doAction to store the action list */
  protected void storeActionList ()
  {
    if (!m_SupportsUndo) return;
    else if (m_ActionsUndoQueue == null)
      m_ActionsUndoQueue = new LinkedList ();

    // Clean the undo queue
    while (m_ActionsUndoQueue.size() >= ActionsUndoQueueSize)
      m_ActionsUndoQueue.removeFirst();

    m_ActionsUndoQueue.addLast (validActions);
  }

  public Action[] getActions ()
  {
    // If not dirty, the action list we have is good
    if (!m_Dirty) return validActions;

    validActions = (BackgammonAction[])m_ActionGen.getActions (this);
    m_Dirty = false;

    return validActions;
  }


  /***** Implements the cloneable interface *****/


  /**
   * Constructor for clone().
   *
   * @param points int[][]
   * @param turn int
   * @param allowUndo boolean
   */
  protected BackgammonState (int [][] points, int turn, boolean allowUndo)
  {
    m_Points = points;

    m_Turn = turn;

    m_SupportsDo = true;
    m_SupportsUndo = allowUndo;

    m_ActionGen = m_StaticActionGen;
  }

  public java.lang.Object clone ()
  {
    // m_Points.clone() fails here because of the double indirection
    int [][] cloned_points = new int[26][2];

    for (int i = 0; i < cloned_points.length; i++)
    {
      cloned_points[i][0] = m_Points[i][0];
      cloned_points[i][1] = m_Points[i][1];
    }

    BackgammonState s = new BackgammonState (cloned_points, m_Turn, m_SupportsUndo);

    s.m_ForcedWin = m_ForcedWin;
    s.m_DiceRoll = (int[])m_DiceRoll.clone();
    s.m_GameValue = m_GameValue;

    // Note! the undo queue is not copied
    s.wantsErrors = wantsErrors;
    return s;
  }
}
