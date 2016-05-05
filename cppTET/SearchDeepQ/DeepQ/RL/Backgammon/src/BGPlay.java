
import Game.Backgammon.*;
import page.*;

import java.net.*;
import java.io.*;

/**
 * Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 */
public class BGPlay
{
  public static String[] AgentFileName = new String[] {"agent.dat", "agent.dat"};
  public static boolean Verbose = false;

  public static int argp = 0;

  public static String getArg (String[] args, String def)
  {
    String ret;

    if (args.length < argp+1 || args[argp] == null || args[argp].length() == 0)
      ret = def;
    else
      ret = args[argp];

    argp++;
    return ret;
  }

  public static void main (String [] args) throws Exception
  {
    BGPlay me = new BGPlay();

    // Get the data files to use
    AgentFileName[0] = getArg (args, "agent.dat");
    AgentFileName[1] = getArg (args, "agent.dat");

    me.go();
  }

  protected ServerSocket server;

  public void go() throws Exception
  {
    BackgammonEnvironment env = new BackgammonEnvironment(true, true, 1);
    Agent[] players = new Agent[2];

    for (int p = 0; p < 2; p++)
    {
      if (AgentFileName[p].equals("heuristic"))
      {
        BackgammonHeuristicAgent agent = new BackgammonHeuristicAgent(p);
        players[p] = agent;
        agent.setVerboseStream(System.out);
      }

      else
      {
        // Create a dummy agent
        players[p] = new RandomAgent (new BackgammonActionGenerator());
        System.out.println (BGConsts.ColorNames[p]+" is random");
      }

      players[p].setEvalMode(true);
    }

    // @@@ randomize the starting colors?

    // Simply run the game and let the environment create a random starting state
    // (random as in we don't know who plays first)
    double[] score = new double[] {0, 0};

    env.dotInterval = 0;
    env.go(players);

    int win = env.getWin();
    if (win == -1)
    {
      score[BGConsts.RED] += 0.5;
      score[BGConsts.WHITE] += 0.5;
      System.out.println ("DRAW");
    }
    else
    {
        score[win] += 1.0;
        if (Verbose) System.out.println (BGConsts.ColorNames[win]);
    }

    System.out.println ("Score:\nRed: "+score[BGConsts.RED]+
                        "\tWhite: "+score[BGConsts.WHITE]);
  }
}
