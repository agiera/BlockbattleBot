package Game.Backgammon;

import page.*;
import java.util.Vector;

/**
 * <p>Title: CC-Gammon</p>
 *
 * <p>Description: A Backgammon player using function approximators.</p>
 *
 * <p>Copyright: Copyright (c) 2004</p>
 *
 * <p>Company: McGill University</p>
 *
 * <p>Action generator for CC-Gammon.</p>
 * @author Marc G. Bellemare
 * @version 1.0
 * @todo Allow moves that do not use the whole roll when this is the only legal
 * move.
 */
public class BackgammonActionGenerator extends AbstractActionGenerator
{
  /** The maximum number of moves that can be done on the last state passed to
   * getActions().
   */
  protected int m_MaxMoves;
  protected boolean m_IgnoreLowDie;

  public int getMaxMoves () { return m_MaxMoves; }
  public boolean getIgnoreLowDie () { return m_IgnoreLowDie; }

  public Action[] getActions (State _s)
  {
    BackgammonState s = (BackgammonState)_s;
    Vector actions = new Vector(50); // Initial vector size is 50
    boolean pair;

    m_MaxMoves = 0;
    m_IgnoreLowDie = false;

    int[] dice = s.getRoll();
    int[] steps;

    if (dice[0] == dice[1]) // Test for a double
    {
      pair = true;
      steps = new int[4]; // 4 moves in total
      for (int i = 0; i < steps.length; i++) steps[i] = dice[0];
    }
    else
    {
      pair = false;
      steps = new int[2];
      // Order the steps so that the highest valued die is first
      if (dice[0] > dice[1])
      {
        steps[0] = dice[0];
        steps[1] = dice[1];
      }
      else
      {
        steps[0] = dice[1];
        steps[1] = dice[0];
      }
    }

    int pStep; // The step pointer (which die we are allocating)
    int[] pPoints = new int[steps.length]; // The point pointers

    pPoints[0] = 0;

    boolean xErrors = s.getWantsErrors();
    s.setWantsErrors(false);

    boolean done = false;

    // Loop until we've tried all possible dice assignments (basically a tree
    //  traversal)
    for (pStep = 0; !done; )
    {
      // Try applying this move and if it works, assign the rest of the dice
      if (s.doMove (pPoints[pStep], steps[pStep], true))
      {
        // Next die assignment
        pStep++;
        if (pStep < pPoints.length) pPoints[pStep] = -1;

        // Add this action if it has the minimum required number of moves to be
        //  valid
        if (pStep >= m_MaxMoves)
        {
          // If we have found an action that has more steps than any other action
          //  found before, reset the action list with this new amount (since we must
          //  play as many steps as possible).
          if (pStep > m_MaxMoves)
          {
            m_MaxMoves = pStep; // Technically should be equivalent to incrementing
            actions.clear();
            m_IgnoreLowDie = false;
          }

          // Here we implement the exception rule, "if either number can be
          //  played but not both, the larger number must be played."
          if (!(steps[1] > steps[0] && m_IgnoreLowDie))
          {
            if (m_MaxMoves == 1 && steps[0] > steps[1]) m_IgnoreLowDie = true;

            BackgammonAction a = new BackgammonAction (pStep);
            for (int i = 0; i < pStep; i++)
              a.addMove(pPoints[i], steps[i]);
            actions.add(a);
          }
        }
      }

      // Next node
      if (pStep < steps.length) pPoints[pStep]++;

      // End of this branch, step out of the recursion
      if (pStep == steps.length || pPoints[pStep] >= 26)
      {
        do
        {
          if (pStep > 0) s.undoMove();
          pStep--;
          if (pStep >= 0) pPoints[pStep]++;
        }
        while (pStep >= 0 && pPoints[pStep] >= 26);

        // We've unwinded all our moves and we're done with all permutations.
        if (pStep < 0)
        {
          // Now, if we have mixed dice and this is the first run, start over
          //  again in a different order (since we might have to use the second
          //  die before the first)
          if (steps[0] > steps[1])
          {
            int tmp = steps[0];
            steps[0] = steps[1];
            steps[1] = tmp;

            pStep = 0;
            pPoints[pStep] = 0;
          }
          // Otherwise, we're finally done
          else
            done = true;
        }
      }
    }

    s.setWantsErrors(xErrors);

    // This means we have no valid actions at all! We'll return the 'skip' action
    if (actions.size() == 0)
      return new BackgammonAction[] {new BackgammonAction(0)};

    else
    {
      BackgammonAction[] retArray = new BackgammonAction[actions.size()];
      actions.copyInto(retArray);
      return retArray;
    }
  }
}
