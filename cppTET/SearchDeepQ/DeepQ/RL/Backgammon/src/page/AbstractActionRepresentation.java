package page;

/** Optional basis for class implementing {@link ActionRepresentation} interface.
 *  Derived classes constructor must fill the protected variables and implement
 *  {@link #getRepresentation}.
 *  Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 *
 * @author Francois Rivest
 * @version 1.0
 */


public abstract class AbstractActionRepresentation implements ActionRepresentation {

	/*********************************************************************/
	//Private fields

	/** Value returned by {@link ActionRepresentation#getOutputCount}.
	 * No default (must be specified).*/
	protected int m_OutputCount;

	/*********************************************************************/
	//Interface implementation

    public int getOutputCount() {return m_OutputCount;}

}
