#ifndef __BenchmarkData_H__
#define __BenchmarkData_H__

#include <vector>
#include <iostream>
#include <math.h>

using namespace std;

class BenchmarkData
{
public:
	BenchmarkData()
		: episode(0), episodeReward(0), averageStepReward(0), numNeurons(0), 
		  delta(0), totalReward(0), numSteps(0), wins(0), mse(0), avgExpSteps(0), numBenchmarkData(0) {}

	BenchmarkData(unsigned int episode, double episodeReward, double averageStepReward, 
		unsigned int numNeurons, double delta, double totalReward, unsigned int numSteps,
		unsigned int wins, double mse, double avgExpSteps)
		: episode(episode), episodeReward(episodeReward), averageStepReward(averageStepReward), 
			numNeurons(numNeurons), delta(delta), totalReward(totalReward), 
			numSteps(numSteps), wins(wins), mse(mse), avgExpSteps(avgExpSteps), numBenchmarkData(1) {}
	
	void printBench(FILE *out)
	{
		//		fprintf(out, "%.20e %.20e %.20e %.20e %.20e %.20e %.20e %.20e %.20e %.20e %.20e\n", episode/(double)numBenchmarkData, episodeReward/(double)numBenchmarkData, averageStepReward/(double)numBenchmarkData, numNeurons/(double)numBenchmarkData, delta/(double)numBenchmarkData, totalReward/(double)numBenchmarkData, numSteps/(double)numBenchmarkData, wins/(double)numBenchmarkData, mse/(double)numBenchmarkData, avgExpSteps/(double)numBenchmarkData, totalReward/episode);
		fprintf(out, "%f %f %f %f %f %f %f %f %f %f %f\n", episode/(double)numBenchmarkData, episodeReward/(double)numBenchmarkData, averageStepReward/(double)numBenchmarkData, numNeurons/(double)numBenchmarkData, delta/(double)numBenchmarkData, totalReward/(double)numBenchmarkData, numSteps/(double)numBenchmarkData, wins/(double)numBenchmarkData, mse/(double)numBenchmarkData, avgExpSteps/(double)numBenchmarkData, totalReward/episode);
	}
	
	void add(BenchmarkData *data)
	{
		episode	+= data->episode;
		episodeReward += data->episodeReward;	
		averageStepReward += data->averageStepReward;	
		numNeurons += data->numNeurons;	
		delta += data->delta;
		numBenchmarkData += data->numBenchmarkData;	
		totalReward += data->totalReward;	
		numSteps += data->numSteps;
		wins += data->wins;
		mse += data->mse;
		avgExpSteps += data->avgExpSteps;
	}
	
	void mult(double value)
	{
		episode	*= value;
		episodeReward *= value;	
		averageStepReward *= value;	
		numNeurons *= value;	
		delta *= value;
		numBenchmarkData *= value;	
		totalReward	*= value;	
		numSteps *= value;
		wins *= value;
		mse *= value;
		avgExpSteps *= value;
	}
	
	double episode;
	double episodeReward;
	double averageStepReward;
	double numNeurons;
	double delta;
	double totalReward;
	double numSteps;
	double wins;
	double mse;
	double avgExpSteps;
	double numBenchmarkData;
};

class BenchmarkDataCollector
{
private:
	vector< vector<BenchmarkData *> > collection;
public:
	BenchmarkDataCollector()
	{
		
	}
	
	void addBench(BenchmarkData *data)
	{
		collection[collection.size()-1].push_back(data);
	}
	
	void newCollection()
	{
		collection.push_back(vector<BenchmarkData *>());	
	}
	
	double getWinPercent()
	{
		double numWins = 0;
		double totalEpisodes = 0;		
				
		for(vector< vector<BenchmarkData *> >::iterator it1 = collection.begin(); 
			it1 != collection.end(); it1++)
		{
			for(vector<BenchmarkData *>::iterator it2 = it1->begin(); 
				it2 != it1->end(); it2++)
			{
				totalEpisodes++;
				numWins += (*it2)->wins;
			}		
		}
		
		cout << "(" << numWins << "*100.0)/" << totalEpisodes << endl;
		
		return (numWins*100.0)/totalEpisodes;
	}
	
	void printAvgCollection(string filename, unsigned int beforeAndAfter = 0)
	{
		//all sizes should be the same, because the same number of episodes have been used
		int length = 0;
		if(collection.size() != 0)
			length = collection[0].size();
			
		if(beforeAndAfter*2 >= (unsigned int)length)
			return; //no data will be printed
	
		FILE *out = fopen(filename.c_str(), "w");
		if(out == NULL)
		{
			cout << "unable to open file: " << filename << endl;
			exit(-1);
		}
	
		for(int idx = 0; idx < length; idx++)
		{
			int startIndex = idx-beforeAndAfter;
			int endIndex = idx+beforeAndAfter;
			if(startIndex >= 0 && endIndex < length)
			{
				BenchmarkData avgdata;
				for(int i = startIndex; i <= endIndex; i++)
				{
					for(unsigned int col = 0; col < collection.size(); col++)
					{
						avgdata.add(collection[col][i]);
					}
				}
				avgdata.printBench(out);
			}
		}
		
		fclose(out);
	}

	void printGaussCollection(string filename, unsigned int beforeAndAfter, double spread)
	{
		//all sizes should be the same, because the same number of episodes have been used
		int length = 0;
		if(collection.size() != 0)
			length = collection[0].size();
			
		if(beforeAndAfter*2 >= (unsigned int)length)
			return; //no data will be printed
	
		FILE *out = fopen(filename.c_str(), "w");
		if(out == NULL)
		{
			cout << "unable to open file: " << filename << endl;
			exit(-1);
		}
	
		for(int idx = 0; idx < length; idx++)
		{
			int startIndex = idx-beforeAndAfter;
			int endIndex = idx+beforeAndAfter;
			if(startIndex >= 0 && endIndex < length)
			{
				BenchmarkData avgdata;
				for(int i = startIndex; i <= endIndex; i++)
				{
					double value = (1/(2*3.14159265359*pow(spread,2)))*(pow(2.7182818,(-(pow((i-idx),2))/(2*pow(spread,2)))));
					BenchmarkData tmpGaussData;
					for(unsigned int col = 0; col < collection.size(); col++)
					{
						tmpGaussData.add(collection[col][i]);
					}
					tmpGaussData.mult(value);
					avgdata.add(&tmpGaussData);
				}
				avgdata.printBench(out);
			}
		}
		
		fclose(out);
	}
};

#endif
