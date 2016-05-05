package page;

/** Optional basis for class implementing {@link MultiAgentState} interface. Derived
 *  classes constructor must fill the protected variables. Add necessary state
 *  information and properties. This implementation uses {@link ActionGenerator}
 *  and {@link StateGenerator} to respond to {@link MultiAgentState#getActions} and
 *  {@link MultiAgentState#getStates} calls. It does not  support local Do or Undo
 *  operation (within an instance do operation) nor clone operation (by default).
 *  Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 *
 * @author Francois Rivest / Marc G. Bellemare
 * @version 1.0
 */


public abstract class AbstractMultiAgentStateWithGen extends AbstractMultiAgentState {

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
