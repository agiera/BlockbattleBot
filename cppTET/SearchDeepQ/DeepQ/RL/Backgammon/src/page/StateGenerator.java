package page;
import java.io.*;

/** Generates next states.
 *  Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 *
 * @author Francois Rivest
 * @version 1.0
 */

public interface StateGenerator extends Serializable {


	/** Returns the list of possibly resulting state or the resulting state.
	 *  @return    The (list) of (possibly) resulting state.
	 */
	public State[] getStates(State s, Action a);

	/** Indicates whether the resulting state depends only of the sate action
	 *  pair or if there is some randomness.
	 *  @return      true if the resulting state can be fully determined by the
	 *               tate/action pair, false otherwise (some form of randomness).
	 */
	public boolean isDeterministic();

}
