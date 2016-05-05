package page;

/** Action representation converter, use to convert an Action into a real-vector.
 *  Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 *
 * @author Francois Rivest
 * @version 1.0
 */

public interface ActionRepresentation {

	/** Converts the Action into a vector of real based on specific representation.
	 *  @param     a     Action to be converted.
	 *  @return    Real-vector representation of the Action.
	 */
	public double[] getRepresentation(Action a);

	/** Indicates the number of values in the action representation.
	 *  @return    Number of outputs.
	 */
	public int getOutputCount();

}
