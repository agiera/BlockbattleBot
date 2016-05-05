package page;

/** Optional basis for class implementing {@link State} interface. Derived
 *  classes constructor must fill the protected variables. Add necessary state
 *  information and properties. This implementation uses {@link ActionGenerator}
 *  and {@link StateGenerator} to respond to {@link State#getActions} and
 *  {@link State#getStates} calls. It does not  support local Do or Undo
 *  operation (within an instance do operation) nor clone operation (by default).
 *  Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 *
 * @author Francois Rivest
 * @version 1.0
 */


public abstract class AbstractStateWithGen extends AbstractState {

	/*********************************************************************/
	//Private fields

	/** Use to generate the list of possible actions. */
	protected ActionGenerator m_ActionGen;

	/** Use to generate the next state in response to an action. */
	protected StateGenerator m_StateGen;

	/*********************************************************************/
	//Interface implementation

	public Action[] getActions() {return m_ActionGen.getActions(this);}

	public State[] getStates(Action a) {return m_StateGen.getStates(this, a);}

}
