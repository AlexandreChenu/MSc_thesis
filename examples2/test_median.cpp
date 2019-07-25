#include <iostream>
#include <fstream>
#include <Eigen/Core>
#include <random>

#include <cmath>
#include <algorithm>

#include <cstdlib>


 double median(std::vector<double> &v)
  {
    size_t n = v.size() / 2;
    std::nth_element(v.begin(), v.begin()+n, v.end());
    return v[n];
  }



int main(int argc, char **argv) 
{   

	std::string filename_in = "/git/sferes2/exp/ex_data/test_300_samples_no_bias/samples_out.txt";
	std::ifstream input_file; 
	input_file.open(filename_in);

    if (!input_file) {
          std::cout << "Unable to open file " << filename_in;
          exit(1);   // call system to stop
        }

    double out;
    std::vector<double> outputs(300);
    double sum =0;

    for (int i=0; i< 300 ; i++){
    	input_file >> out; 
    	outputs[i] = out;
    }

    for (int i=0; i< 300; i++){
    	sum += outputs[i];
    }

    double median_ = median(outputs);
    double average_ = sum/300;

    std::cout << "median: " << median_ << std::endl;
    std::cout << "average: " << average_ << std::endl;
}