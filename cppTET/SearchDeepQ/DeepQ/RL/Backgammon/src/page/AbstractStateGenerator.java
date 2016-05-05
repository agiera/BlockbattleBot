package page;

/** Optional basis for class implementing {@link StateGenerator} interface.
 *  Derived classes constructor must fill the protected variables and implement
 *  {@link #getStates}.
 *  Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 *
 * @author Francois Rivest
 * @version 1.0
 */

public abstract class AbstractStateGenerator implements StateGenerator {

	/*********************************************************************/
    //Private fields

	static final long serialVersionUID = -247216248750708711L;

	/** Value returned by {@link StateGenerator#isDeterministic}. Default = true.*/
	protected boolean m_IsDeterministic = true;

	/*********************************************************************/
	//Interface implementation

    public boolean isDeterministic() {return m_IsDeterministic;}

}
