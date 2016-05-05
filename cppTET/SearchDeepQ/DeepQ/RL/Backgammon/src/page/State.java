package page;

/** Defines a state as generally understand in RL and other AI problems.
 *  Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 *
 * @author Francois Rivest
 * @version 1.0
 */

public interface State extends Cloneable {

	/** Returns the list of available action from the current state.
	 *  @return    The list of available action.
	 */
	public Action[] getActions();

	/** Returns the list state following the current state under a given action.
	 *  @param     a     The action to apply.
	 *  @return    The list of available action.
	 */
	public State[] getStates(Action a);

	/** Do an action.
	 *  @param      Action to be done.
	 */
	public boolean doAction(Action a);

	/** Undo last action done.
	 */
	public void undoAction();

	/** Indicates whether or not do action is supported locally.
	 *  @return     true if the do function is implemented.
	 */
	public boolean supportsDo();

	/** Indicates whether or not undo action is supported.
	 *  @return     true if the undo function is implemented.
	 */
	public boolean supportsUndo();

	/** Indicates whether or not the state can be copied
	 *  @return     true if the clone function is implemented.
	 */
	public boolean isCloneable();

	/*********************************************************************/
	//Properties

	/** Value associated to the state.
	 *  @return      value of the sate.
	 */
	public double getValue();

	/** Indicates whether or not a state is final (generally a goal state).
	 *  @return     true if it is a final state (end of episode), false otherwise.
	 */
	public boolean isFinal();

	/** Indicates whether the state is valid or not.
	 *  @return     true if it  is valid, false otherwise.
	 */
	public boolean isValid();

	/** Probability of the state, for non-deterministic StateGenerators only.
	 *  @return       state probability.
	 */
	public double getProbability();

	/*********************************************************************/
	//Cloeanble interface

	public Object clone();

}

