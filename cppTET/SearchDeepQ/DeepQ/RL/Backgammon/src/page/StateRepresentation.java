package page;

/** State representation converter, use to convert a state into a real-vector.
 *  Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 *
 * @author Francois Rivest
 * @version 1.0
 */

public interface StateRepresentation {

  /** Converts the state into a vector of real based on specific representation.
   *  @param      s     State to be converted.
   *  @return     Real vector representation of the state.
   */
  public double[] getRepresentation(State s);

  /** Indicates the number of values in the state representation.
   *  @return    Number of outputs.
   */
  public int getOutputCount();

}
