package page;

/** Optional basis for class implementing {@link State} interface. Derived
 *  classes constructor must fill the protected variables. Add necessary state
 *  information and properties. By default do, undo and clone are not supported,
 *  but can be added in derived classes. When setting IsCloneable to true,
 *  basic cloning is automatically inherited from Object.
 *  Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 *
 * @author Francois Rivest
 * @version 1.0
 */

public abstract class AbstractState implements State {

	/*********************************************************************/
	//Private fields

	/** Value returned by {@link State#supportsDo}. Default = false.*/
	protected boolean m_SupportsDo = false;

	/** Value returned by {@link State#supportsUndo}. Default = false.*/
	protected boolean m_SupportsUndo = false;

	/** Value returned by {@link State#isCloneable}. Default = false.*/
	protected boolean m_IsCloneable = false;

	/** Value returned by {@link State#geValue}. Default = 0 (non-final).*/
	protected double m_Value = 0;

	/** Value returned by {@link State#isValid}. Default = false.*/
	protected boolean m_IsFinal = false;

	/** Value returned by {@link State#isValid}. Default = true.*/
	protected boolean m_IsValid = true;

	/** Value returned by {@link State#geDefault}. Default = 1 (deterministic).*/
	protected double m_Probability = 1;

	/*********************************************************************/
	//Interface implementation

	public boolean supportsDo() {return m_SupportsDo;}

	public boolean supportsUndo() {return m_SupportsUndo;}

	public boolean isCloneable() {return m_IsCloneable;}

    public double getValue() {return m_Value;}

    public boolean isFinal() {return m_IsFinal;}

    public boolean isValid() {return m_IsValid;}

    public double getProbability() {return m_Probability;}

	public boolean doAction(Action a) {
		throw new UnsupportedOperationException("supportsDo = false");
	}

	public void undoAction() {
		throw new UnsupportedOperationException("supportsUndo = false");
	}

	/*********************************************************************/
	//Cloeanble interface

	public Object clone() {
		if (!m_IsCloneable) {
			throw new UnsupportedOperationException("isCloneable = false");
		} else {
			try {
				return super.clone();
			} catch (CloneNotSupportedException e) {
				throw new java.lang.Error();
			}
		}
	}

}
