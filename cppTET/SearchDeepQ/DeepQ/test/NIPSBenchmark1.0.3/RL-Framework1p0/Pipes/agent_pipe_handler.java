import java.io.*;
import java.lang.*;
import java.util.regex.*;
import java.lang.reflect.*;
import java.util.*;

public class agent_pipe_handler 
{
    private static String pipe_in;
    private static String pipe_out;
    private static String javaName; 
    private static int global_count = 0;
    
    private static Class agent; 
    private static Object retobj;
    
    private static FileInputStream fis;
    private static InputStreamReader fr; 
    private static BufferedReader br; 
    private static FileWriter file;
    
    private static StringTokenizer st;
    private static String [] token = new String[100];
    
    private static int si;
    private static float sf;
    private static int [] sia;
    private static float [] sfa;
    
    public static void main(String[] args) throws IOException{

        pipe_in = args[0];
        pipe_out = args[1];
        String [] tmp44 = null;
		tmp44 = args[2].split("/");
		int nn = tmp44.length;
		javaName = tmp44[nn-1].trim();
		
    
        try {
            agent = Class.forName(javaName);
            Class partypes[] = null;
            Constructor ct = agent.getConstructor(partypes);
            Object arglist[] = null;
            retobj = ct.newInstance(arglist);
        
            fis = new FileInputStream(pipe_in);
            fr = new InputStreamReader(fis);
            br = new BufferedReader(fr); 
            file = new FileWriter(pipe_out);
    
    
            String buf = br.readLine();
            
            while(true)
            {    
                if(buf != null)
                { 
                    if(buf.equals("init"))
                    {   
                        pipe_agent_init();
                    }
                    else if(buf.equals("start")) 
                    {   
                        pipe_agent_start();
                    }        
                    else if(buf.equals("step"))    
                    {
                        pipe_agent_step();
                    }
                    else if(buf.equals("end"))    
                    {
                        pipe_agent_end();
                    }
                    else if(buf.equals("getname"))    
                    {
                        pipe_agent_get_name();
                    }
                    else if(buf.equals("cleanup")) 
                    {
                        partypes = null;
                        Method meth = agent.getMethod("agent_cleanup",partypes);
                        arglist = null;
                        meth.invoke(retobj, arglist);
                        System.exit(0);
                    }     
                }   
                buf = br.readLine();
            }
        }
        catch (Throwable e) {
            System.err.println("\nERROR: BAD COMMAN!!  OR Error in agent_cleanup method\n");
            e.printStackTrace();
        }
    }

    private static void pipe_agent_init() throws IOException
    {
        String buf;
        
        buf = br.readLine();
        while(buf == null)
            buf = br.readLine();
    
        try{            
            Class partypes[] = new Class[1];
            partypes[0] = String.class;
            Method meth = agent.getMethod("agent_init", partypes);
            Object arglist[] = new Object[1];
            arglist[0] = new String(buf);
            
            meth.invoke(retobj, arglist);
        }
        catch (InvocationTargetException e)
        {
            System.err.println("\nError: Error in your agent_init method!!\n");
            e.printStackTrace();
        }
        catch (Throwable e) {
            System.err.println("ERROR: Arguments are not valid. RL-Framework supports \nInt, \nFloat, \nInt Array, \nFloat Array \nfor Observation type when using pipe communication. \nExiting...\n");
            e.printStackTrace();
        } 
    }
 
     private static void pipe_agent_get_name() throws IOException
    {
        String buf;
    
        try{            
            Method meth = agent.getMethod("agent_get_name", null);            
            Object retobj2 = meth.invoke(retobj, null);
            
            String retval = (String)retobj2;
            
             buf = String.valueOf(retval);
            
            file.write(buf+"\n");   
            file.flush();
            
        }
        catch (InvocationTargetException e)
        {
            System.err.println("\nError: Error in your agent_name method!!\n");
            e.printStackTrace();
        }
        catch (Throwable e) {
            file.write("NOTIMPLEMENTED"+"\n");
            file.flush();
        }  
    }
    
    private static void pipe_agent_start() throws IOException
    {
        String buf;
        int act, count=0, obs_case;
        Class partypes[];
        Method meth;
        Object arglist[];
        Object retobj2 = null;
        String buf2;
    
        try{ 
    
            buf = br.readLine();
            while(buf == null)
                buf = br.readLine(); 
        
            st = new StringTokenizer(buf);
            
            while (st.hasMoreTokens()) 
            {
                token[count] = st.nextToken().trim();
                if(!token[count].equals("\n"))
                    count++;
            }
            
            if(count == 1)
            {
                obs_case = 1;
                for(int i=0;i<token[0].length();i++)
                    if(token[0].charAt(i) == '.')
                        obs_case = 2;
            }
            else
            {
                obs_case = 3;
                for(int i=0; i< count;i++)
                    for(int j=0; j< token[i].length(); j++)
                        if(token[i].charAt(j) == '.')
                            obs_case = 4;
            }
            
            if(obs_case == 1)
            {
                si = Integer.parseInt(token[0]);  
               
                partypes = new Class[1];
                partypes[0] = Integer.TYPE;
                meth = agent.getMethod("agent_start", partypes);
                arglist = new Object[1];
                arglist[0] = new Integer(si);
                retobj2 = meth.invoke(retobj, arglist);
            }
            else if(obs_case == 2)
            {
                sf = Float.parseFloat(token[0]);  
               
                partypes = new Class[1];
                partypes[0] = Float.TYPE;
                meth = agent.getMethod("agent_start", partypes);
                arglist = new Object[1];
                arglist[0] = new Float(sf);
                retobj2 = meth.invoke(retobj, arglist);
            }
            else if(obs_case == 3)
            {
                sia = new int[count];
                for(int i=0;i<count;i++)
                    sia[i] = Integer.parseInt(token[i]);
             
                partypes = new Class[1];
                partypes[0] = Class.forName("[I");
                meth = agent.getMethod("agent_start", partypes);
                arglist = new Object[1];
                arglist[0] = sia;
                retobj2 = meth.invoke(retobj, arglist);   
            }
            else if(obs_case == 4)
            {
                sfa = new float[count];
                for(int i=0;i<count;i++)
                    sfa[i] = Float.parseFloat(token[i]);
             
                partypes = new Class[1];
                partypes[0] = Class.forName("[F");
                meth = agent.getMethod("agent_start", partypes);
                arglist = new Object[1];
                arglist[0] = sfa;
                retobj2 = meth.invoke(retobj, arglist);   
            }

        
            buf2 = "";
            if( retobj2  instanceof Integer)
            {
                Integer retval1 = (Integer)retobj2;
                 buf2 = String.valueOf(retval1.intValue());
            }
            else if(retobj2  instanceof Float)    
            {
                Float retval2 = (Float)retobj2;
                 buf2 = String.valueOf(retval2.floatValue());
            }
            else if ( Class.forName ( "[I" ).isInstance ( retobj2 ) )
            {
                buf2 = "";
                for(int i=0;i< Array.getLength(retobj2);i++)
                    buf2 = buf2 + String.valueOf(Array.getInt(retobj2,i))+" ";
                    buf2 = buf2.trim();
            }
            else if (Class.forName ( "[F" ).isInstance ( retobj2 )  )
            {
                buf2 = "";
                for(int i=0;i< Array.getLength(retobj2);i++)
                    buf2 = buf2 + String.valueOf(Array.getFloat(retobj2,i))+ " ";
                    buf2 = buf2.trim();
            }
            else
            {
                System.out.println("ERROR2: Action is not a valid type. RL-Framework supports \nInt, \nFloat, \nInt Array, \nFloat Array \nfor Observation type when using pipe communication. \nExiting...\n");
                System.exit(1);
            }
            
            file.write(buf2+"\n");
            file.flush();
        }
        catch (InvocationTargetException e)
        {
            System.err.println("\nError: Error in your agent_start method!!\n");
            e.printStackTrace();
        }
        catch (Throwable e) {
            System.err.println("ERROR: Arguments are not valid. RL-Framework supports \nInt, \nFloat, \nInt Array, \nFloat Array \nfor Observation type when using pipe communication. \nExiting...\n");
            e.printStackTrace();
        }              
    }

    private static void pipe_agent_step() throws IOException
    {
    
        String buf1, buf2;
        int act, count=0, obs_case;
        float r;
    
        Class partypes[];
        Method meth;
        Object arglist[];
        Object retobj2 = null;
      
        try{  
        
            buf1 = br.readLine();
            while(buf1 == null)
                buf1 = br.readLine();
                
            buf2 = br.readLine();
            while(buf2 == null || buf2.length() <= 0)
                buf2 = br.readLine();
                
            r = Float.parseFloat(buf2);
            
            st = new StringTokenizer(buf1);
            
            while (st.hasMoreTokens()) 
            {
                token[count] = st.nextToken().trim();
                if(!token[count].equals("\n"))
                    count++;
            }
            
            if(count == 1)
            {
                obs_case = 1;
                for(int i=0;i<token[0].length();i++)
                    if(token[0].charAt(i) == '.')
                        obs_case = 2;
            }
            else
            {
                obs_case = 3;
                for(int i=0; i< count;i++)
                    for(int j=0; j< token[i].length(); j++)
                        if(token[i].charAt(j) == '.')
                            obs_case = 4;
            }
            
            if(obs_case == 1)
            {
                si = Integer.parseInt(token[0]);  
               
                partypes = new Class[2];
                partypes[0] = Float.TYPE;
                partypes[1] = Integer.TYPE;
                meth = agent.getMethod("agent_step", partypes);
                arglist = new Object[2];
                arglist[0] = new Float(r);
                arglist[1] = new Integer(si);
                retobj2 = meth.invoke(retobj, arglist);
            }
            else if(obs_case == 2)
            {
                sf = Float.parseFloat(token[0]);  
               
                partypes = new Class[2];
                partypes[0] = Float.TYPE;
                partypes[1] = Float.TYPE;
                meth = agent.getMethod("agent_step", partypes);
                arglist = new Object[2];
                arglist[0] = new Float(r);
                arglist[1] = new Float(sf);
                retobj2 = meth.invoke(retobj, arglist);
            }
            else if(obs_case == 3)
            {
                sia = new int[count];
                for(int i=0;i<count;i++)
                    sia[i] = Integer.parseInt(token[i]);
             
                partypes = new Class[2];
                partypes[0] = Float.TYPE;
                partypes[1] = Class.forName("[I");
                meth = agent.getMethod("agent_step", partypes);
                arglist = new Object[2];
                arglist[0] = new Float(r);
                arglist[1] = sia;
                retobj2 = meth.invoke(retobj, arglist);   
            }
            else if(obs_case == 4)
            {
                sfa = new float[count];
                for(int i=0;i<count;i++)
                    sfa[i] = Float.parseFloat(token[i]);
             
                partypes = new Class[2];
                partypes[0] = Float.TYPE;
                partypes[1] = Class.forName("[F");
                meth = agent.getMethod("agent_step", partypes);
                arglist = new Object[2];
                arglist[0] = new Float(r);
                arglist[1] = sfa;
                retobj2 = meth.invoke(retobj, arglist);   
            }

        
            buf2 = "";
        
            if( retobj2  instanceof Integer)
            {
                Integer retval1 = (Integer)retobj2;
                 buf2 = String.valueOf(retval1.intValue());
            }
            else if(retobj2  instanceof Float)    
            {
                Float retval2 = (Float)retobj2;
            }
            else if (Class.forName ( "[I" ).isInstance ( retobj2 )   )
            {
                buf2 = "";
                for(int i=0;i< Array.getLength(retobj2);i++)
                    buf2 = buf2 + String.valueOf(Array.getInt(retobj2,i))+" ";
                    buf2 = buf2.trim();
            }
            else if (Class.forName ( "[F" ).isInstance ( retobj2 )  )    
            {
                buf2 = "";
                for(int i=0;i< Array.getLength(retobj2);i++)
                    buf2 = buf2 + String.valueOf(Array.getFloat(retobj2,i))+ " ";
                    buf2 = buf2.trim();
            }
            else
            {
                System.out.println("ERROR4: Action is not a valid type. RL-Framework supports \nInt, \nFloat, \nInt Array, \nFloat Array \nfor Observation type when using pipe communication. \nExiting...\n");
                System.exit(1);
            }
            
            file.write(buf2+"\n");
            file.flush();
        }
        catch (InvocationTargetException e)
        {
            System.err.println("\nError: Error in your agent_step method!!\n");
            e.printStackTrace();
        }
        catch (Throwable e) {
            System.err.println("ERROR: Arguments are not valid. RL-Framework supports \nInt, \nFloat, \nInt Array, \nFloat Array \nfor Observation type when using pipe communication. \nExiting...\n");
            e.printStackTrace();
        }    
    }

    private static void pipe_agent_end() throws IOException
    {
        String buf;
        float r;
        
        buf = br.readLine();
        while(buf == null)
            buf = br.readLine();   
       
        r = Float.parseFloat(buf);
    
        try{    
            Class partypes[] = new Class[1];
            partypes[0] = Float.TYPE;
            Method meth = agent.getMethod("agent_end", partypes);
            Object arglist[] = new Object[1];
            arglist[0] = new Float(r);
            
            meth.invoke(retobj, arglist);
        }
        catch (InvocationTargetException e)
        {
            System.err.println("\nError: Error in your agent_end method!!\n");
            e.printStackTrace();
        }
        catch (Throwable e) {
            System.err.println("ERROR: Arguments are not valid. RL-Framework supports \nInt, \nFloat, \nInt Array, \nFloat Array \nfor Observation type when using pipe communication. \nExiting...\n");
            e.printStackTrace();
        }
             
    }

}
  
    
    