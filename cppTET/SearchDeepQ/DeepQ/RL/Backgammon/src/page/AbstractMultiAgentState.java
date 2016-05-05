package page;
import java.io.Serializable;

/** Optional basis for class implementing {@link MultiAgentState} interface. Derived
 *  classes constructor must fill the protected variables. Add necessary state
 *  information and properties. By default undo and clone are not supported,
 *  but can be added in derived classes. When setting IsCloneable to true,
 *  basic cloning is automatically inherited from Object.
 *  Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 *
 * @author Francois Rivest / Marc G. Bellemare
 * @version 1.0
 */

public abstract class AbstractMultiAgentState implements MultiAgentState, Serializable {

	/*********************************************************************/
	//Private fields

	/** Value returned by {@link MultiAgentState#supportsDo}. Default = false.*/
	protected boolean m_SupportsDo = true;

	/** Value returned by {@link MultiAgentState#supportsUndo}. Default = false.*/
	protected boolean m_SupportsUndo = false;

	/** Value returned by {@link MultiAgentState#isCloneable}. Default = false.*/
	protected boolean m_IsCloneable = false;

	/** Value returned by {@link MultiAgentState#getValue}. Default = 0 (non-final).*/
	protected double m_Value = 0;

	/** Value returned by {@link MultiAgentState#isValid}. Default = false.*/
	protected boolean m_IsFinal = false;

	/** Value returned by {@link MultiAgentState#isValid}. Default = true.*/
	protected boolean m_IsValid = true;

	/** Value returned by {@link MultiAgentState#getProbability}. Default = 1 (deterministic).*/
	protected double m_Probability = 1;

	/** Value returned by {@link MultiAgentState#getTurn}. Default is invalid (-1). */
	protected int m_Turn = -1;

	/** Value returned by {@link MultiAgentState#getSuccess}. Default is true. */
	protected boolean m_Success = true;

	/*********************************************************************/
	//Interface implementation

	public boolean supportsDo() {return m_SupportsDo;}

	public boolean supportsUndo() {return m_SupportsUndo;}

	public boolean isCloneable() {return m_IsCloneable;}

    public double getValue() {return m_Value;}

    public boolean isFinal() {return m_IsFinal;}

    public boolean isValid() {return m_IsValid;}

	public boolean getSuccess() {return m_Success;}

    public double getProbability() {return m_Probability;}

	public boolean doAction(Action a) {
		throw new UnsupportedOperationException("supportsDo = false");
	}

	public void undoAction() {
		throw new UnsupportedOperationException("supportsUndo = false");
	}

	/*********************************************************************/
	// Multi-agent specific methods

	public double getValue (int who) { return getValue(); }

	public int getTurn () { return m_Turn; }

 /*********************************************************************/
	//Cloneable interface

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
