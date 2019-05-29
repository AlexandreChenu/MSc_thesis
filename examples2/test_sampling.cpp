#include <iostream>
#include <Eigen/Core>
#include <random>
#include <cmath>
#include <algorithm>
#include <cstdlib>
#include <fstream>

int main(int argc, char **argv) 
{   

    const std::string filename = "/git/sferes2/exp/ex_data/sampling.txt";

    std::ofstream logfile;

    logfile.open(filename);

    int n_s = 64;

    Eigen::MatrixXd samples(n_s,2);

    double dist = 0;
    double radius = 0;
    double theta = 0;

    for (int i=0; i < n_s/4; ++i){
      radius = 0.25*((double) rand() / (RAND_MAX)); //radius E[0,0.25]
      theta = 2*M_PI*(((double) rand() / (RAND_MAX))-0.5);
      samples(i,0) = radius*cos(theta);
      samples(i,1) = radius*sin(theta);
      logfile << samples(i,0) << "    " << samples(i,1) << "\n";
    }
    //logfile << "\n";
    for (int i=n_s/4; i< n_s/2 ; ++i){
      radius = 0.25*((double) rand() / (RAND_MAX)) + 0.25 ; //radius E[0.25,0.5]
      theta = 2*M_PI*(((double) rand() / (RAND_MAX))-0.5);
      samples(i,0) = radius*cos(theta);
      samples(i,1) = radius*sin(theta);
      logfile << samples(i,0) << "    " << samples(i,1) << "\n";
    }
    //logfile << "\n";

    for (int i=n_s/2; i< 3*n_s/4 ; ++i){
      radius = 0.25*((double) rand() / (RAND_MAX)) + 0.5; //radius E[0.5,0.75]
      theta = 2*M_PI*(((double) rand() / (RAND_MAX))-0.5);
      samples(i,0) = radius*cos(theta);
      samples(i,1) = radius*sin(theta);
      logfile << samples(i,0) << "    " << samples(i,1) << "\n";
    }
    //logfile << "\n";

    for (int i=3*n_s/4; i< n_s ; ++i){
      radius = 0.25*((double) rand() / (RAND_MAX)) + 0.75; //radius E[0.75,1]
      theta = 2*M_PI*(((double) rand() / (RAND_MAX))-0.5);
      samples(i,0) = radius*cos(theta);
      samples(i,1) = radius*sin(theta);
      logfile << samples(i,0) << "    " << samples(i,1) << "\n";
    }
    logfile.close();
    
    return 0;

  }
