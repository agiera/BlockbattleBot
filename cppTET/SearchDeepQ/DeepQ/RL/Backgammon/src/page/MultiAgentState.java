package page;

/** Defines a state as generally understood in RL and other AI problems. Also
 * holds information regarding turn-based multi agent systems such as games.
 *  Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 *
 * @author Francois Rivest / Marc G. Bellemare
 * @version 1.0
 */

public interface MultiAgentState extends State {
	/*********************************************************************/
	//Properties

	/** Value associated to the state, from the point of view of the given agent.
	 *  @return      value of the sate.
	 */
	public double getValue(int who);

	/** Indicates whose turn it is.
	 *  @return     An integer indicating the current agent whose turn it is to act.
	 */
	public int getTurn ();

	/** Indicates whether the last action was successful.
	 *  @return     True if the action was successful.
	 */
	public boolean getSuccess();
}

