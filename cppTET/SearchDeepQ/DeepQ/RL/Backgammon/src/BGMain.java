import Game.Backgammon.*;
import page.*;
import Game.Backgammon.BackgammonHumanPlayer;

import java.net.*;
import java.io.*;

/**
 * Copyright: Francois Rivest (Université of Montreal) / Marc G. Bellemare (McGill University)
 */
public class BGMain
{
  public static String[] AgentFileName = new String[] {"agent.dat", "agent.dat"};

  public static int argp = 0;
  public static String Color;

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
    BGMain me = new BGMain();

    int nHumans;

    argp = 0;
    nHumans = Integer.parseInt (getArg (args, "2"));

    if (nHumans == 1) Color = getArg (args, "red");

    // If less than two humans, next get the data files to use
    if (nHumans < 2)
      AgentFileName[0] = getArg (args, "random");
    if (nHumans < 1)
      AgentFileName[1] = getArg (args, "random");

    int port = Integer.parseInt (getArg (args, "0"));

    me.go(nHumans, port);
  }

  protected ServerSocket server;

  public void go(int humans, int port) throws Exception
  {
    BackgammonEnvironment env = new BackgammonEnvironment(true, true);
    Agent[] players = new Agent[2];

    if (port > 0)
      server = new ServerSocket (port);
    // If we are playing both players in hotseat, create only one player with
    //  'BOTH' colors (avoids duplicate board printing)
    else if (port == 0 && humans == 2)
    {
      players[0] = players[1] = new BackgammonHumanPlayer(BGConsts.BOTH, System.in,
          System.out, true);
    }

    else
    {
      int p;
      int c;
      if (Color.equals("red")) c = BGConsts.RED;
      else c = BGConsts.WHITE;

      for (p = 0; p < humans; p++)
      {
        if (port == 0)
          players[c] = new BackgammonHumanPlayer(c, System.in, System.out, true);
        else
        {
            System.out.println ("Waiting for connection "+(p+1)+"...");
            players[c] = getRemotePlayer(c);
        }

        c = BGConsts.OTHER[c];
      }

      // Fill the rest with AI players
      for (int i = 0; p < 2; p++, i++)
      {
        if (AgentFileName[i].equals("heuristic"))
        {
          BackgammonHeuristicAgent agent = new BackgammonHeuristicAgent(c);
          players[c] = agent;
          agent.setVerboseStream(System.out);
        }
        else
        {
          // Create a dummy agent
          players[c] = new RandomAgent (new BackgammonActionGenerator());
        }
      }
    }

    // Simply run the game and let the environment create a random starting state
    // (random as in we don't know who plays first)
    env.go(players);
  }

  BackgammonHumanPlayer getRemotePlayer(int p) throws Exception
  {
    Socket sock = server.accept();
    PrintStream ps = new PrintStream(sock.getOutputStream());

    ps.println("You are "+BGConsts.ColorNames[p]+".");
    return new BackgammonHumanPlayer (p, sock.getInputStream(),
                                      ps, true);
  }
}
