/*
 *  YahtzeeNumbersFull.h
 *
 *  Created by Andrea Bonarini, Alessandro Lazaric, Marcello Restelli
 *  Copyright (c) 2005 Politecnico di Milano. All rights reserved.
 * 
 *  A simplified version of Yahtzee. For details about Yahtzee and its rules
 *  please refer to http://www.hasbro.com/common/instruct/Yahtzee.pdf. For
 *  details about this implementation of yahtzee refer to the paper
 *  be published in the proceedings of the "Reinforcement Learning Benchmarks 
 *  and Bake-offs II" workshop at NIPS 2005.
 * 
 *  Numbers version: consists of 20 variables. One is related to the number of rolls
 *  performed in the current round. Thirteen are binary variables that store 0 if
 *  the category has not yet been played, and 1 otherwise. The remaining 6 variables
 *  contain the number of dice that, in the current roll, have, respectively, value
 *  1, 2, 3, 4, 5, and 6.
 * 
 *  Full version: the available configurations are the same as in the
 *  original game.
 *  
 *  State:   20 discrete variables
 *  Actions:  1 discrete variable
 *
 */

#include <iostream>
#include "YahtzeeNumbersFull.h"

using namespace std;

// the number of possible initial states
#define START_SET_SIZE 50

// the counter of the episodes
unsigned int episode_counter = 0;

// the total score for the current episode
unsigned int total_score = 0;

// pointer to a file that contains the score achieved for each episode
FILE* score_file = 0;

void generateRandomStart(YahtzeeEnv* start)
{
    // the initial number of reroll is three
    gYahtzeeEnv.mReroll  = 3;

    // all the configurations are initially available
    for (unsigned int i = 0; i < NUMBER_OF_COMBO; i++)
    {
        gYahtzeeEnv.mIsAvailableCombo[i] = true;
    }

    // the dice are initially set to 0
    for (unsigned int i = 0; i < NUMBER_OF_DICE; i++)
    {
        gYahtzeeEnv.mDice[i] = 0;
    }

    castDice();

    // copy values in gYahtzeeEnv into the start variable
    start->mReroll = gYahtzeeEnv.mReroll;
    for (unsigned int i = 0; i < NUMBER_OF_COMBO; i++)
    {
        start->mIsAvailableCombo[i] = gYahtzeeEnv.mIsAvailableCombo[i];
    }
    for (unsigned int i = 0; i < NUMBER_OF_DICE; i++)
    {
        start->mDice[i] = gYahtzeeEnv.mDice[i];
    }
}

// the set of initial configurations
YahtzeeEnv start_set[START_SET_SIZE];
//void env_set_random_seed(Random_seed_key rsk);

void generate_random_start_set()
{
//    // decomment the line below if a fix random seed must be used
//    //	env_set_random_seed(1);
//    env_set_random_seed(time(NULL));

    for(int k = 0; k < START_SET_SIZE; k++)
    {
        generateRandomStart(&start_set[k]);
    }

/*    cout << "*** START SET ***" << endl;
    for (unsigned int i = 0; i < START_SET_SIZE; i++)
    {
        cout << "Reroll = " << start_set[i].mReroll << endl;
        ;
        for (unsigned int j = 0; j < NUMBER_OF_COMBO; j++)
        {
            cout << "Combo" << j << " = " << start_set[i].mIsAvailableCombo[j] << endl;
        }
        for (unsigned int j = 0; j < NUMBER_OF_DICE; j++)
        {
            cout << "Dice" << j << " = " << start_set[i].mDice[j] << endl;
        }
    }
*/
}

Task_specification env_init()
{
    generate_random_start_set();
    episode_counter = 0;
    total_score = 0;
    score_file = fopen("score.dat","w");

    // initialize reward and observation
    gObservation = new int[STATE_SIZE];
    gRewardOb.r = 0.0;
    gRewardOb.o = gObservation;
    gRewardOb.terminal = false;

    // Return task specification:
    char* Task_spec = new char[1000];
    char temp[500];
    strcpy(Task_spec,"1:e");
    sprintf(temp,":%d", STATE_SIZE); // number of 'i's depends on number of dimensions
    strcat(Task_spec,temp);

    // be aware of the fact that state variables cannot generally assume all
    // the values within the specified intervals
    // i.e. small straight can assume only values: -1, 0, 30
    sprintf(temp,"_[i,i,i,i,i,i,i,i,i,i,i,i,i,i,i,i,i,i,i,i]"); // number of 'i's depends on number of dimensions
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  3.0);  // reroll
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  1.0);  // avail_ones
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  1.0);  // avail_twos
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  1.0);  // avail_threes
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  1.0);  // avail_fours
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  1.0);  // avail_fives
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  1.0);  // avail_sixes
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  1.0);  // avail_tris
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  1.0);  // avail_poker
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  1.0);  // avail_full
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  1.0);  // avail_small
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  1.0);  // avail_large
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  1.0);  // avail_chance
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  1.0);  // avail_yahtzee
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  5.0);  // num_ones
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  5.0);  // num_twos
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  5.0);  // num_threes
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  5.0);  // num_fours
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  5.0);  // num_fives
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0,  5.0);  // num_sixes

    strcat(Task_spec,temp);

    sprintf(temp,":1_[i]");
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",  0.0, 13.0);  // available actions
    strcat(Task_spec,temp);
    
    strcat(Task_spec,"\0");

    return Task_spec;
}

Observation env_start()
{
    // the initial total score is set to 0
    total_score = 0;

    // retrive the initial configuration and set the global environment state
    int start_state_number = episode_counter % START_SET_SIZE;
    gYahtzeeEnv.mReroll = start_set[start_state_number].mReroll;
    for (unsigned int i = 0; i < NUMBER_OF_COMBO; i++)
    {
        gYahtzeeEnv.mIsAvailableCombo[i] = start_set[start_state_number].mIsAvailableCombo[i];
    }
    for (unsigned int i = 0; i < NUMBER_OF_DICE; i++)
    {
        gYahtzeeEnv.mDice[i] = start_set[start_state_number].mDice[i];
    }

    // increment the episode counter
    episode_counter ++;

    gRewardOb.r = 0;
    gRewardOb.terminal = false;

    // update and return observation
    setObservation();

    // print the state of the environment
//    printState();

    // return the current state as perceived by the agent
    return gYahtzeeState.mState;
}

Reward_observation env_step(Action a)
{
    // set the reward according to the current state and the
    // chosen action
    computeReward(a);

    // execute the action "a"
    getNextPosition(a);

    // update the observation
    setObservation();

    gRewardOb.o = gYahtzeeState.mState;

    // verify the termination condition
    gRewardOb.terminal = isTerminal();

    // print the state of the environment
//    printState();

    // return the current state as perceived by the agent and
    // the reward
    return gRewardOb;
}

void computeReward(Action a)
{
    if (A_Reroll == a && gYahtzeeEnv.mReroll > 0)
    {
        // the reward is set to 0 because the player chose to reroll dice
        gRewardOb.r = 0;
    }
    else if (A_Reroll != a && true == gYahtzeeEnv.mIsAvailableCombo[a-1])
    {
        // the default score is 0
        gRewardOb.r = 0;

        // each position is a face of a dice, count the number of dice that
        // resulted to be 1 or 2 ... or 6
        int results[6];

        // the total sum of the dice
        unsigned int total_sum = 0;

        // initialize the values
        for (int i = 0; i < 6; i++)
        {
            results[i] = 0;
        }

        // compute the number of ones, twos, ...
        for (int i = 0; i < NUMBER_OF_DICE; i++)
        {
            if (1 == gYahtzeeEnv.mDice[i])
                results[0]++;
            else if (2 == gYahtzeeEnv.mDice[i])
                results[1]++;
            else if (3 == gYahtzeeEnv.mDice[i])
                results[2]++;
            else if (4 == gYahtzeeEnv.mDice[i])
                results[3]++;
            else if (5 == gYahtzeeEnv.mDice[i])
                results[4]++;
            else if (6 == gYahtzeeEnv.mDice[i])
                results[5]++;

            // compute the chance value
            total_sum += gYahtzeeEnv.mDice[i];
        }

        // depending on the chosen action, compute the reward value
        if (A_Ones == a)
            gRewardOb.r = results[0];
        else if (A_Twos   == a)
            gRewardOb.r = 2*results[1];
        else if (A_Threes == a)
            gRewardOb.r = 3*results[2];
        else if (A_Fours  == a)
            gRewardOb.r = 4*results[3];
        else if (A_Fives  == a)
            gRewardOb.r = 5*results[4];
        else if (A_Sixes  == a)
            gRewardOb.r = 6*results[5];

        else if (A_Tris == a)
        {
            // compute the tris value
            for (unsigned int i = 0; i < 6; i++)
            {
                if (3 == results[i])
                    gRewardOb.r = total_sum;
            }
        }

        else if (A_Full == a)
        {
            // compute the full value
            for (unsigned int i = 0; i < 6; i++)
            {
                if (3 == results[i])
                {
                    for (unsigned int j = 0; j < 6; j++)
                    {
                        if (2 == results[j])
                            gRewardOb.r = FULL_VALUE;
                    }
                }
            }
        }

        else if (A_Poker == a)
        {
            // compute the poker value
            for (int i = 0; i < 6; i++)
            {
                if (4 == results[i])
                    gRewardOb.r = total_sum;
            }
        }

        else if (A_Chance == a)
        {
            gRewardOb.r = total_sum;
        }

        else if (A_Small == a)
        {
            if (
                1 == results[0] && 1 == results[1] && 1 == results[2] && 1 == results[3]
                ||
                1 == results[1] && 1 == results[2] && 1 == results[3] && 1 == results[4]
                ||
                1 == results[2] && 1 == results[3] && 1 == results[4] && 1 == results[5]
            )
            {
                gRewardOb.r = SMALL_VALUE;
            }
        }

        else if (A_Large == a)
        {
            if (
                1 == results[0] && 1 == results[1] && 1 == results[2] && 1 == results[3] && 1 == results[4]
                ||
                1 == results[1] && 1 == results[2] && 1 == results[3] && 1 == results[4] && 1 == results[5]
            )
            {
                gRewardOb.r = LARGE_VALUE;
            }
        }

        else if (A_Yahtzee == a)
        {
            for (int i = 0; i < 6; i++)
            {
                if (5 == results[i])
                    gRewardOb.r = YAHTZEE_VALUE;
            }
        }

        // the total score is incremented only in case of a valid move
        total_score += (unsigned int) gRewardOb.r;
    }
    else
    {
        // reward given when a not admissible action is chosen (i.e.
        // a configuration not more available or an extra reroll)
        gRewardOb.r = -10;
    }
}

void getNextPosition(int action)
{
    if (A_Reroll == action && gYahtzeeEnv.mReroll > 0)
    {
        castDice();
    }
    else if (A_Reroll != action && true == gYahtzeeEnv.mIsAvailableCombo[action-1])
    {
        // since the action number corresponds to the configuration number
        gYahtzeeEnv.mIsAvailableCombo[action-1] = false;
        gYahtzeeEnv.mReroll = 3;
        castDice();
    }
}

void env_cleanup()
{
    delete [] gObservation;
    fclose(score_file);
}

void castDice()
{
    // cast all the six-faces dice
    for (int i = 0; i < NUMBER_OF_DICE; i++)
    {
        gYahtzeeEnv.mDice[i] = rand() % 6 + 1;
    }
//    cout << endl;

    // decrement the number of available reroll
    gYahtzeeEnv.mReroll--;
}

bool isTerminal()
{
    bool is_terminal = true;

    // a trial is finished when there is no configuration available
    for (int i = 0; i < NUMBER_OF_COMBO && is_terminal; i++)
    {
        if (true == gYahtzeeEnv.mIsAvailableCombo[i])
        {
            is_terminal = false;
        }
    }

    if (true == is_terminal)
    {
        // print to file the score obtained in the current episode
        //fprintf(score_file,"%d\n",total_score);
    }

    return is_terminal;
}

// translate the inner state of the environment into the state space
// as perceived by the agent
void setObservation()
{
    // set the reroll state variable
    gYahtzeeState.mState[STATE_REROLL] = gYahtzeeEnv.mReroll;

    // set to 0 all the configuration not available
    for (unsigned int i = 0; i < NUMBER_OF_COMBO; i++)
    {
        if (false == gYahtzeeEnv.mIsAvailableCombo[i])
            gYahtzeeState.mState[i+1] = 0;
        else
            gYahtzeeState.mState[i+1] = 1;
    }

    // each position is a face of a dice, count the number of dice that
    // resulted to be 1 or 2 ... or 6
    int results[6];

    // the total sum of the dice
//     unsigned int total_sum = 0;

    // initialize the values
    for (int i = 0; i < 6; i++)
    {
        results[i] = 0;
    }

    // compute the number of ones, twos, ...
    for (int i = 0; i < NUMBER_OF_DICE; i++)
    {
        if (1 == gYahtzeeEnv.mDice[i])
            results[0]++;
        else if (2 == gYahtzeeEnv.mDice[i])
            results[1]++;
        else if (3 == gYahtzeeEnv.mDice[i])
            results[2]++;
        else if (4 == gYahtzeeEnv.mDice[i])
            results[3]++;
        else if (5 == gYahtzeeEnv.mDice[i])
            results[4]++;
        else if (6 == gYahtzeeEnv.mDice[i])
            results[5]++;
    }
    // update the values of the state variables
    gYahtzeeState.mState[STATE_NUM_ONES]   = results[0];
    gYahtzeeState.mState[STATE_NUM_TWOS]   = results[1];
    gYahtzeeState.mState[STATE_NUM_THREES] = results[2];
    gYahtzeeState.mState[STATE_NUM_FOURS]  = results[3];
    gYahtzeeState.mState[STATE_NUM_FIVES]  = results[4];
    gYahtzeeState.mState[STATE_NUM_SIXES]  = results[5];
}



void printState()
{
    cout << "*** Yahtzee Numbers Full Environment ***" << endl;
    cout << gYahtzeeEnv.mReroll << ":";
    for (unsigned int j = 0; j < NUMBER_OF_COMBO; j++)
    {
        cout << gYahtzeeEnv.mIsAvailableCombo[j] << ":";
    }
    for (unsigned int j = 0; j < NUMBER_OF_DICE; j++)
    {
        cout << gYahtzeeEnv.mDice[j] << ":";
    }

    cout << endl;
    cout << "*** Observation ***" << endl;
    for (unsigned int i = 0; i < STATE_SIZE; i++)
    {
        cout << gYahtzeeState.mState[i] << ":";
    }

    cout << endl;
    cout << "*** Reward ***" << endl;
    cout << "RW = " << gRewardOb.r << endl;
    cout << "Termination = " << gRewardOb.terminal << endl;

    cout << endl;
}
