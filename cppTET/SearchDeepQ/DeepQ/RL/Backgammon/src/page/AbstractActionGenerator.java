package page;

/** Optional basis for class implementing {@link ActionGenerator} interface.
 *  Derived classes constructor must fill the protected variables and implement
 *  {@link #getActions}.
 *  Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 *
 * @author Francois Rivest
 * @version 1.0
 */

public abstract class AbstractActionGenerator implements ActionGenerator {

	/*********************************************************************/
	//Private fields

	/** Value returned by {@link ActionGenerator#areFixed}. Default = false (count = -1).*/
	protected boolean m_AreFixed = false;

	/** Value returned by {@link ActionGenerator#getActionCount}. Default = -1 (not fixed).*/
	protected int m_ActionCount = -1;

	/*********************************************************************/
    //Interface implementation

    public boolean areFixed() {return m_AreFixed;}

    public int getActionCount() {return m_ActionCount;}

}
