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

//#include <exp/examples2/phen_arm.hpp>

#include <cmath>
#include <algorithm>

#include <cstdlib>


using namespace sferes;
using namespace sferes::gen::dnn;
using namespace sferes::gen::evo_float;

struct Params {
  struct evo_float {
    SFERES_CONST float mutation_rate = 0.5f;
    SFERES_CONST float cross_rate = 0.1f;
    SFERES_CONST mutation_t mutation_type = polynomial;
    SFERES_CONST cross_over_t cross_over_type = sbx;
    SFERES_CONST float eta_m = 10.0f;
    SFERES_CONST float eta_c = 10.0f;
  };

  struct parameters {
    // maximum value of parameters
    SFERES_CONST float min = -2.0f;
    // minimum value
    SFERES_CONST float max = 2.0f;
  };

  struct dnn {
    SFERES_CONST size_t nb_inputs = 2; // right/left and up/down sensors
    SFERES_CONST size_t nb_outputs  = 3; //usage of each joint
    SFERES_CONST size_t min_nb_neurons  = 10; 
    SFERES_CONST size_t max_nb_neurons  = 20;
    SFERES_CONST size_t min_nb_conns  = 20;
    SFERES_CONST size_t max_nb_conns  = 100;
    SFERES_CONST float  max_weight  = 2.0f;
    SFERES_CONST float  max_bias  = 2.0f;

    SFERES_CONST float m_rate_add_conn  = 1.0f;
    SFERES_CONST float m_rate_del_conn  = 1.0f;
    SFERES_CONST float m_rate_change_conn = 1.0f;
    SFERES_CONST float m_rate_add_neuron  = 1.0f;
    SFERES_CONST float m_rate_del_neuron  = 1.0f;

    SFERES_CONST int io_param_evolving = true;
    //SFERES_CONST init_t init = random_topology;
    SFERES_CONST init_t init = ff;
  };

    struct nov {
      SFERES_CONST size_t deep = 2;
      SFERES_CONST double l = 0.01; // TODO value ???
      SFERES_CONST double k = 25; // TODO right value?
      SFERES_CONST double eps = 0.1;// TODO right value??
  };

  // TODO: move to a qd::
  struct pop {
      // number of initial random points
      SFERES_CONST size_t init_size = 100; // nombre d'individus générés aléatoirement 
      SFERES_CONST size_t size = 100; // size of a batch
      SFERES_CONST size_t nb_gen = 10001; // nbr de gen pour laquelle l'algo va tourner 
      SFERES_CONST size_t dump_period = 500; 
  };

  struct qd {

      SFERES_CONST size_t dim = 3;
      SFERES_CONST size_t behav_dim = 3; //taille du behavior descriptor
      SFERES_ARRAY(size_t, grid_shape, 100, 100, 100);
  };
};


FIT_QD(nn_mlp){

  public :
    //Indiv : still do not know what it is 
    //IO : Neural Network Input and Output type
    template <typename Indiv>

      //void eval(Indiv & ind, IO & input, IO & target){ //ind : altered phenotype
      void eval(Indiv & ind){ //ind : altered phenotype

      //std::cout << "ca evalue en bal?" <<std::endl;
        // target = ind.get_target();
        // target[2] = 0; //z = 0, we are working in a 2D space
        // angles = ind.get_robot_angles();
        // motor_usage = ind.get_motor_usage();

        //std::cout << "EVALUATION" << std::endl;

        std::vector<double> motor_usage(3);
        Eigen::Vector3d robot_angles;
        Eigen::Vector3d target;
        double dist = 0;

        //std::cout << "INIT" << std::endl;

        //robot_angles = {0,M_PI,M_PI}; //init everytime at the same place

        //init tables
        for (int j = 0; j < 3 ; ++j){ 
                    motor_usage[j] = 0; //starting usage is null  
                    robot_angles[j] = M_PI*(((double) rand() / (RAND_MAX))-0.5); //random init for robot angles
                    target[j] = 2*(((double) rand() / (RAND_MAX))-0.5); //random init for target position
                  }

        if (sqrt(target[0]*target[0] + target[1]*target[1]) > 1){ //check is the target is reachable (inside a circle of radius 1)
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


        //std::cout << "LOOP" << std::endl;

        for (int t=0; t< _t_max/_delta_t; ++t){ //iterate through time

          //TODO : what input do we use for our Neural network? 
          std::vector<float> inputs(2);

          Eigen::Vector3d prev_pos; //compute previous position

          prev_pos = forward_model(robot_angles);

          //std::cout << "target x: " << target[0] << "position y: " << target[1] << std::endl;
          //std::cout << "position x: " << prev_pos[0] << "position y: " << prev_pos[1] << std::endl;

          inputs[0] = target[0] - prev_pos[0]; //get side distance to target (-1 < input < 1)
          inputs[1] = target[1] - prev_pos[1]; //get front distance to target (-1 < input < 1)

          //DATA GO THROUGH NN
          ind.nn().init(); //init neural network 
          for (int j = 0; j < ind.gen().get_depth() + 1; ++j)
            ind.nn().step(inputs);

          Eigen::Vector3d output;
          for (int indx = 0; indx < 3; ++indx){
            output[indx] = 2*(ind.nn().get_outf(indx) - 0.5)*_vmax; //Remap to a speed between -v_max and v_max (speed is saturated)
            robot_angles[indx] += output[indx]*_delta_t; //Compute new angles
            motor_usage[indx] += abs(output[indx]); //Compute motor usage
          }

          //Eigen::Vector3d new_pos;
          prev_pos = forward_model(robot_angles); //remplacer pour ne pas l'appeler deux fois

          target[2] = 0; //get rid of z coordinate
          prev_pos[2] = 0;

          dist -= sqrt(square(target.array() - prev_pos.array()).sum());

          // prev_pos = new_pos;
        }

        // ind.set_motor_usage(motor_usage); //set new values 
        // ind.set_robot_angles(angles);
        //ind.set_target(target); //if target is moving 

        this->_value = dist; //cumulative distance during the experiment

        std::vector<double> desc(3);
        desc = {motor_usage[0], motor_usage[1], motor_usage[2]};

        this->set_desc(desc); //Which behavior descriptor? The three motors angles 
      }

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

private:
  double _vmax = 1;
  double _delta_t = 0.1;
  double _t_max = 10; //TMax guidé poto
};