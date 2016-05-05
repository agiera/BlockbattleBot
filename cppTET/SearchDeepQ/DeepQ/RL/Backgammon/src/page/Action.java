package page;

/** Defines an action as generally understand in RL and other AI problems.
 *  Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 *
 * @author Francois Rivest
 * @version 1.0
 */


public interface Action {

	/*********************************************************************/
	//Properties

    /** Cost associated to the action.
     *  @return       cost of the action.
     */
    public double getCost();

    /** Indicates whether the action is valid or not.
     *  @return       true if it  is valid, false otherwise.
     */
    public boolean isValid();

}
