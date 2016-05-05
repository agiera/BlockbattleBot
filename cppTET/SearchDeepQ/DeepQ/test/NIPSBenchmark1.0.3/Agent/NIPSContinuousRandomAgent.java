import java.util.*;

public class NIPSContinuousRandomAgent {

Random random = new Random(666);
int minAction;
int actionRange;
Java_agent_parser jap = new Java_agent_parser();

public void agent_init(String ts)
{
    jap.parser(ts);
    minAction = (int)jap.action_mins[0];
    actionRange = (int)jap.action_maxs[0]-minAction;

}            

public int agent_start(float[] obs)
{
    return randomAction();
}

public void agent_cleanup()
{
}

public int agent_step(float r, float[] obs)
{
    return randomAction();
}

public void agent_end(float r)
{
}    

public String agent_get_name()
{
    return "tedmunds_Rutgers_NIPSContinuousRandomAgentJava";
}

private int randomAction()
{
    int value = random.nextInt(actionRange+1);
    return minAction+value;
}

}