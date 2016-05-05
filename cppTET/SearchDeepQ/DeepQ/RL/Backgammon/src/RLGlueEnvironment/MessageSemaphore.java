package RLGlueEnvironment;

import java.util.LinkedList;

/**
 * This class implements our Message Semaphore structure. It is implemented with a
 * Counting Semaphore
 * @author Steffen Larsen (zool@diku.dk)
 * @author Anja Lee Pedersen (leep@diku.dk)
 */
public class MessageSemaphore 
{
	LinkedList<Object> objectQueue;
	CountingSemaphore countSem;
	
	/**
	 * Creates a new instance of MessageSemaphore
	 */
	public MessageSemaphore() 
	{
		objectQueue = new LinkedList<Object>();
		countSem = new CountingSemaphore();
	}
		
	/**
	 * Waits for a message
	 * @return the object from the queue (message)
	 * @throws InterruptedException thrown if the wait is interrupted
	 */
	public Object waits () throws InterruptedException 
	{
		countSem.waits();
		synchronized(objectQueue)
		{
		    return objectQueue.removeLast();
		}
	}
	
	/**
	 * add a message to the queue
	 * @param o the message to be added to the queue
	 */
	public void  signals(Object o) 
	{
	    synchronized(objectQueue)
	    {
	    	if(objectQueue.size() != 0)//just for breakpoints
	    	{
		    	objectQueue.addFirst(o);	    		
	    	}
	    	else
	    	{
	    		objectQueue.addFirst(o);
	    	}	    	
	    }
	    countSem.signals();
	}
}