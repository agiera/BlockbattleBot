package RLGlueEnvironment;

/**
 * A counting semaphore class
 * 
 * @author Steffen Larsen (zool@diku.dk)
 * @author Anja Lee Pedersen (leep@diku.dk)
 */
public class CountingSemaphore {
	private int counter = 0;

	/**
	 * Creates a new instance of CountingSemaphore with initial count zero
	 */
	public CountingSemaphore() {
	}

	/**
	 * Create counting semaphore with an initial counting value
	 * 
	 * @param initCount
	 *            Initial counter
	 */
	public CountingSemaphore(int initCount) {
		counter = initCount;
	}

	/**
	 * If a threads are waiting, one thread will be released. If no threads are
	 * waiting, we makes sure that the next thread which try to wait is realease
	 * without waiting.
	 */
	public synchronized void signals() {
		if (counter == 0) {
			this.notify();
		}
		counter++;
	}

	/**
	 * If a signal has been called earlier we do not have to wait, but if not,
	 * we wait for a signal.
	 * 
	 * @throws InterruptedException
	 *             thrown if the wait is interrupted
	 */
	public synchronized void waits() throws InterruptedException {
		while (counter == 0) {
			this.wait();
		}
		counter--;
	}
}