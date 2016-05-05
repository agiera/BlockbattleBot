package page;

/** Optional basis for class implementing {@link Action} interface. Derived
 *  classes constructor must fill the protected variables. Add necessary action
 *  information and properties.
 *  Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 *
 * @author Francois Rivest
 * @version 1.0
 */

public abstract class AbstractAction implements Action {

	/*********************************************************************/
	//Private fields

	/** Value returned by {@link Action#getCost}. Default = 1.*/
	protected double m_Cost = 1;

	/** Value returned by {@link Action#isValid}. Default = true.*/
	protected boolean m_IsValid = true;

	/*********************************************************************/
	//Interface implementation

    public double getCost() {return m_Cost;}

    public boolean isValid() {return m_IsValid;}

}
