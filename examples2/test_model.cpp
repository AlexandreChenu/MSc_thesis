//| This file is a part of the sferes2 framework.
//| Copyright 2016, ISIR / Universite Pierre et Marie Curie (UPMC)
//| Main contributor(s): Jean-Baptiste Mouret, mouret@isir.fr
//|
//| This software is a computer program whose purpose is to facilitate
//| experiments in evolutionary computation and evolutionary robotics.
//|
//| This software is governed by the CeCILL license under French law
//| and abiding by the rules of distribution of free software.  You
//| can use, modify and/ or redistribute the software under the terms
//| of the CeCILL license as circulated by CEA, CNRS and INRIA at the
//| following URL "http://www.cecill.info".
//|
//| As a counterpart to the access to the source code and rights to
//| copy, modify and redistribute granted by the license, users are
//| provided only with a limited warranty and the software's author,
//| the holder of the economic rights, and the successive licensors
//| have only limited liability.
//|
//| In this respect, the user's attention is drawn to the risks
//| associated with loading, using, modifying and/or developing or
//| reproducing the software by the user in light of its specific
//| status of free software, that may mean that it is complicated to
//| manipulate, and that also therefore means that it is reserved for
//| developers and experienced professionals having in-depth computer
//| knowledge. Users are therefore encouraged to load and test the
//| software's suitability as regards their requirements in conditions
//| enabling the security of their systems and/or data to be ensured
//| and, more generally, to use and operate it in the same conditions
//| as regards security.
//|
//| The fact that you are presently reading this means that you have
//| had knowledge of the CeCILL license and that you accept its terms.

#include <iostream>
#include <Eigen/Core>

#include <sferes/eval/parallel.hpp>
#include <sferes/gen/evo_float.hpp>
#include <sferes/modif/dummy.hpp>
#include <sferes/phen/parameters.hpp>
#include <sferes/run.hpp>
#include <sferes/stat/best_fit.hpp>
#include <sferes/stat/qd_container.hpp>
#include <sferes/stat/qd_selection.hpp>
#include <sferes/stat/qd_progress.hpp>
#include <sferes/fit/fit_qd.hpp>
#include <sferes/qd/container/archive.hpp>
#include <sferes/qd/container/kdtree_storage.hpp>
#include <sferes/qd/container/sort_based_storage.hpp>
#include <sferes/qd/container/grid.hpp>
#include <sferes/qd/quality_diversity.hpp>
#include <sferes/qd/selector/tournament.hpp>
#include <sferes/qd/selector/uniform.hpp>
#include <sferes/qd/selector/population_based.hpp>
#include <sferes/qd/selector/value_selector.hpp>
#include <boost/test/unit_test.hpp>
#include <modules/nn2/mlp.hpp>
#include <modules/nn2/gen_dnn.hpp>
#include <modules/nn2/phen_dnn.hpp>
#include <modules/nn2/gen_dnn_ff.hpp>
#include <cmath>
#include <algorithm>
#include <cstdlib>

//#include "exp/examples2/ex_behav_nn.cpp"

#include "/git/sferes2/exp/examples2/fit_behav.hpp"

Eigen::Vector3d forward_model(Eigen::VectorXd a){
    
    Eigen::VectorXd _l_arm=Eigen::VectorXd::Ones(a.size()+1);
    _l_arm(0)=0;
    _l_arm = _l_arm/_l_arm.sum();

    Eigen::Matrix4d mat=Eigen::Matrix4d::Identity(4,4);

    for(size_t i=0;i<a.size();i++){

      Eigen::Matrix4d submat;
      submat<<cos(a(i)), -sin(a(i)), 0, _l_arm(i), sin(a(i)), cos(a(i)), 0 , 0, 0, 0, 1, 0, 0, 0, 0, 1;
      mat=mat*submat;
    }
    
    Eigen::Matrix4d submat;
    submat<<1, 0, 0, _l_arm(a.size()), 0, 1, 0 , 0, 0, 0, 1, 0, 0, 0, 0, 1;
    mat=mat*submat;
    Eigen::VectorXd v=mat*Eigen::Vector4d(0,0,0,1);

    return v.head(3);
 }

template <typename T>
int run_simu(T & model, int t_max, std::string filename) { 


    //init variables
    double _vmax = 1;
  	double _delta_t = 0.1;
  	double _t_max = t_max; //TMax guidé poto
  	Eigen::Vector3d robot_angles;
    Eigen::Vector3d target;
    double dist;

    //init tables
    for (int j = 0; j < 3 ; ++j){  
            robot_angles[j] = M_PI*(((double) rand() / (RAND_MAX))-0.5); //random init for robot angles
            target[j] = 2*(((double) rand() / (RAND_MAX))-0.5); //random init for target position
            }

    if (sqrt(target[0]*target[0] + target[1]*target[1]) > 1){ //check is the target is reachable
          if (target[0] > 0){
            target[0] -= 1;
          }
          else{
            target[0] += 1;
          }
          if (target[1] > 0){
            target[1] -= 1;
          }
          else{
            target[1] += 1; 
        }
      }


  	//open logfile
  	std::ofstream logfile;
  	logfile.open(filename);

  	//iterate through time
    for (int t=0; t< _t_max/_delta_t; ++t){

          //TODO : what input do we use for our Neural network? 
          std::vector<float> inputs(2);

          Eigen::Vector3d prev_pos; //compute previous position
          prev_pos = forward_model(robot_angles);
          inputs[0] = target[0] - prev_pos[0]; //get side distance to target
          inputs[1] = target[1] - prev_pos[1]; //get front distance to target

          logfile << "inputs 1: " << inputs[0] << " 2: " << inputs[1] << "\n";

          //DATA GO THROUGH NN
          model.nn().init(); //init neural network 

          for (int j = 0; j < model.gen().get_depth() + 1; ++j)
            model.nn().step(inputs);

          Eigen::Vector3d output;
          for (int indx = 0; indx < 3; ++indx){
            output[indx] = 2*(model.nn().get_outf(indx) - 0.5)*_vmax; //Remap to a speed between -v_max and v_max (speed is saturated)
            robot_angles[indx] += output[indx]*_delta_t; //Compute new angles
          }

          logfile << "ouputs 1: " << output[0] << " 2: " << output[1] << "\n";

          //Eigen::Vector3d new_pos;
          prev_pos = forward_model(robot_angles); //remplacer pour ne pas l'appeler deux fois

          //write data into logfile
          logfile << "t: " << t << " x: " << prev_pos[0] << " y: " << prev_pos[1] << "\n";

          dist = - sqrt(square(target.array() - prev_pos.array()).sum());

          if (abs(dist) < 0.1) //we converged before the end of the time
            break;

          // prev_pos = new_pos;
        }
    logfile << "target position x: " << target[0] << " y: " << target[1] <<"\n" ;
    logfile.close();

    return 0;
}


int main(int argc, char **argv) {

	using namespace sferes;
	using namespace nn;

	typedef nn_mlp<Params> fit_t; 
	typedef phen::Parameters<gen::EvoFloat<1, Params>, fit::FitDummy<>, Params> weight_t;
    typedef phen::Parameters<gen::EvoFloat<1, Params>, fit::FitDummy<>, Params> bias_t;
    typedef PfWSum<weight_t> pf_t;
    typedef AfSigmoidBias<bias_t> af_t;
    typedef sferes::gen::DnnFF<Neuron<pf_t, af_t>,  Connection<weight_t>, Params> gen_t; // TODO : change by DnnFF in order to use only feed-forward neural networks
                                                                                       // TODO : change by hyper NN in order to test hyper NEAT 
    typedef phen::Dnn<gen_t, fit_t, Params> phen_t;
	typedef boost::archive::binary_iarchive ia_t;

	phen_t model; 
	phen_t *ptr_model;

	ptr_model = &model;

	const std::string filename = "/git/sferes2/exp/tmp/serialize_nn1.bin";

	std::cout << "model loading" << std::endl;

	{
	std::ifstream ifs(filename , std::ios::binary);
	ia_t ia(ifs);
    ia >> model;
	}

	std::cout << "model loaded" << std::endl;

	// model.nn().init(); //initialize model

	std::cout << "model initialized" << std::endl;

	std::string logfile = "/git/sferes2/exp/tmp/logfile.txt";

	run_simu(model, 3, logfile);


	}

