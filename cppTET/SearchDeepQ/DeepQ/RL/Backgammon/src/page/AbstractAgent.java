package page;

/** Optional basis for class implementing {@link Agent} interface. Derived
 *  classes constructor must fill the protected variables. Add necessary Agent
 *  information and properties. In general setEvalMode should be overrided.
 *  Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 *
 * @author Francois Rivest
 * @version 1.0
 */


public abstract class AbstractAgent implements Agent {

	/*********************************************************************/
	//Private fields

	static final long serialVersionUID = 2089051628413038225L;

	/** Value returned by {@link Agent#getEvalMode}. Default = false.*/
	protected boolean m_EvalMode = false;

	/** Value returned by {@link Agent#isEvaluable}. Default = true.*/
	protected boolean m_IsEvaluable = true;

	/** Value returned by {@link Agent#isAdaptive}. Default = false.*/
	protected boolean m_IsAdaptive = false;

	/*********************************************************************/
	//Interface implementation

    public void setEvalMode(boolean newEvalMode) {
		if (newEvalMode && !m_IsEvaluable) {
			throw new UnsupportedOperationException("isEvaluable = false");
		}
		m_EvalMode = newEvalMode;
    }
    public boolean getEvalMode() {return m_EvalMode;}

    public boolean isEvaluable() {return m_IsEvaluable;}

    public boolean isAdaptive() {return m_IsAdaptive;}

}
