package Game.Backgammon;

/**
 * <p>Title: CC-Gammon</p>
 *
 * <p>Description: A BackGammon player using function approximators.</p>
 *
 * <p>Copyright: Copyright (c) 2004</p>
 *
 * <p>Company: McGill University</p>
 *
 * <p>Class that holds constants for the Backgammon game.</p>
 * @author Marc G. Bellemare
 * @version 1.0
 */
public class BGConsts
{
  /** Defines the red color */
  public static final int RED = 0;
  /** Defines the white color */
  public static final int WHITE = 1;
  /** Defines 'both' colors */
  public static final int BOTH = 2;

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
  /** Maximum number of moves per turn */
  public static final int MAX_NMOVES = 4;

  /** Player names */
  public static final String[] ColorNames = new String[] {"red", "white"};

  /** Error messages */
  public static final String MenOnBarError = "There are men on the bar.";
  public static final String NoManThereError = "You have no man on that point.";
  public static final String OccupiedPointError = "The destination is occupied.";
  public static final String MenBehindError = "There are still men behind this one.";
  public static final String MenOnOuterTableError = "There are still men on the outer table.";
  public static final String DiceNotRolledError = "This move was not rolled.";
  public static java.util.Random rand = new java.util.Random(666);


  public static int parseWho (String s)
  {
    for (int i = 0; i < ColorNames.length; i++)
      if (ColorNames[i].equals(s)) return i;
    return -1;
  }
}

