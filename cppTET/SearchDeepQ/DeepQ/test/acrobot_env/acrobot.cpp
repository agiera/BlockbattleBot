/*
 *  acrobot.cpp
 *  
 *  Created by Adam White on September 20 2005.
 *  Copyright (c) 2005 UAlberta. All rights reserved.
 *
 *	Description:
 *		Force is applied at the junction between the two links (Sutton in 1996), and from a horizontal double-arm pendulum 
 *		(where the main link rotates in the horizontal plane, and the secondary link rotates vertically with respect to the main link). 
 *		EPISODIC
 *	
 *		Rewards are zero everywhere but in the balanced region.
 *
 *  State: 4D continuous values
 *  Actions: 1D (0,1,2)
 */
#include "acrobot.h"





#define DT 0.2
#define INTEG_SCHRITTE 10


#define GRAVITY 9.8

// Mass of Links
#define M1 1
#define M2 1

// Length of Links
#define L1 1
#define L2 1

//Length to the center of mass of gravity
#define LC1 0.5
#define LC2 0.5

//Moments of intertia of links
#define I1 1
#define I2 1


//extreme values
#define pi  3.1415927
#define maxThetaDot_1  4*pi
#define maxThetaDot_2  9*pi
#define thetaWidth  pi/3
#define thetaDotWidth_0  8*pi/6
#define thetaDotWidth_1  3*pi

void f(const double* s,const double tau,double* sdot)
{
  double phi1;
  double phi2;
  double d1;
  double d2;

  double newa1;
  double newa2;


  d1=M1*LC1*LC1 + M2*(L1*L1+LC2*LC2+2*L1*LC2*cos(s[1])) + I1 +I2;

  d2=M2*(LC2*LC2+L1*LC2*cos(s[1])) + I2;

  phi2=M2*LC2*GRAVITY*cos(s[0]+s[1]-mp2);

  phi1=-M2*L1*LC2*s[3]*s[3]*sin(s[1]) - 2*M2*L1*LC2*s[3]*s[2]*sin(s[1])
                + (M1*LC1+M2*L1)*GRAVITY*cos(s[0]-mp2) + phi2;

   newa2=(1.0/(M2*LC2*LC2 + I2 -(d2*d2)/d1)) *
        (tau + (d2/d1)*phi1 - M2*L1*LC2*s[2]*s[2]*sin(s[1]) - phi2); // ok

   newa1=(-1.0/d1) * (d2*newa2+phi1);

  sdot[0]=s[2]; // theta1_dot
  sdot[1]=s[3]; // theta2_dot
  sdot[2]=newa1; //theta1_dotdot
  sdot[3]=newa2; //theta2_dotdot
}

static double s0_dot[4];
static double s1[4];
static double s1_dot[4];
static double s2[4];
static double s2_dot[4];
static double s3[4];
static double s3_dot[4];
static double hilf[4];

double s[4];
double ss[4];
//Declare local variables whose value must prosist between function calls

Task_specification env_init()
{
    Task_specification ret = new char[100];
    char thetaMax[10], thetaDot1Max[10], thetaDot2Max[10];
    o = new double[4];
    
    sprintf(thetaMax,"%f",thetaWidth);
    sprintf(thetaDot1Max,"%f",thetaDotWidth_0);
    sprintf(thetaDot2Max,"%f",thetaDotWidth_1);
    sprintf(ret,"1:e:4_[f,f,f,f]_[0,%s]_[0,%s]_[0,%s]_[0,%s]:1_[i]_[0,2]",thetaMax,thetaMax,thetaDot1Max,thetaDot2Max);
    
    return ret;
}

Observation env_start()
{


    s[0] = 0;
    s[1] = 0;
    s[2] = 0;
    s[3] = 0;
    
    return s;    
}

Reward_observation env_step(Action a)   
{
//void step (const double *s, double u,double *ss)
//{
       /* 4-Dimensionaler Zustand s
          s[0] = theta_1
          s[1] = theta_2
          s[2] = theta_dot_1
          s[3] = theta_dot_2
       */

		double u = a-1;
		
       if (u > 1 || u < -1){
          printf("F E H L E R !!!!! u=%f ist nicht zulaessig ! \n",u);
          exit(0);
       }


        // Nur alle DT sec darf Aktion eingestellt werden
        double h=DT/double(INTEG_SCHRITTE);

        for (int j=0;j<4;j++) hilf[j]=s[j];



        for (int i=0;i<INTEG_SCHRITTE;i++){



           // Runge-Kutta (4. Ordnung)
           f(hilf,u,s0_dot);
           for(int j=0;j<4;j++)  s1[j] = hilf[j] + (h/2)*s0_dot[j];

           f(s1,u,s1_dot);
           for(int j=0;j<4;j++)  s2[j] = hilf[j] + (h/2)*s1_dot[j];

           f(s2,u,s2_dot);
           for(int j=0;j<4;j++)  s3[j] = hilf[j] + h*s2_dot[j];

           f(s3,u,s3_dot);
           for(int j=0;j<4;j++) hilf[j] = hilf[j] + (h/6) * (s0_dot[j] + 2*(s1_dot[j]+s2_dot[j]) + s3_dot[j]);


           //for (int j=0;j<4;j++) zwischenpos[i][j]=hilf[j];   //fŸr graphische Ausgabe Zwischenpositionen speichern

        }

        for (int j=0;j<4;j++) ss[j]=hilf[j];


        if (ss[0] > mp)  ss[0]-=2*mp;        // Winkel gehen rundherum
        if (ss[0] < -mp) ss[0]+=2*mp;
        if (ss[1] > mp)  ss[1]-=2*mp;        // Winkel gehen rundherum
        if (ss[1] < -mp) ss[1]+=2*mp;

    position = -(L1*cos(ss[0]) + L2*cos(ss[1]));

    s[0] = ss[0];
    s[1] = ss[1];
    s[2] = ss[2];
    s[3] = ss[3];

    ro.o = s;
    ro.r = -1;
    ro.terminal = false;
    if(acrobotGoal())
    {	
        ro.terminal = true;
        ro.r = 0;
    }
    
    return ro;
	

 }//ende ZustandsŸbergang


 
bool acrobotGoal()  // Has the goal been achieved?
{
  return (position > env_goal);
}  

void env_cleanup()
{}
