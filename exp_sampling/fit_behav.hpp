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
#include <random>

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


using namespace sferes;
using namespace sferes::gen::dnn;
using namespace sferes::gen::evo_float;

struct Params {
  struct evo_float {
    SFERES_CONST float mutation_rate = 0.3f;
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
    SFERES_CONST size_t nb_inputs = 5; // right/left and up/down sensors
    SFERES_CONST size_t nb_outputs  = 3; //usage of each joint
    SFERES_CONST size_t min_nb_neurons  = 15;
    SFERES_CONST size_t max_nb_neurons  = 50;
    SFERES_CONST size_t min_nb_conns  = 20;
    SFERES_CONST size_t max_nb_conns  = 80;
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
      SFERES_CONST double l = 0.05; // TODO value ???
      SFERES_CONST double k = 25; // TODO right value?
      SFERES_CONST double eps = 0.1;// TODO right value??
  };

  // TODO: move to a qd::
  struct pop {
      // number of initial random points
      SFERES_CONST size_t init_size = 100; // nombre d'individus générés aléatoirement 
      SFERES_CONST size_t size = 100; // size of a batch
      SFERES_CONST size_t nb_gen = 20001; // nbr de gen pour laquelle l'algo va tourner 
      SFERES_CONST size_t dump_period = 500; 
  };

  struct qd {

      SFERES_CONST size_t dim = 3;
      SFERES_CONST size_t behav_dim = 3; //taille du behavior descriptor
      SFERES_ARRAY(size_t, grid_shape, 100, 100, 100);
  };

  struct sample {

      SFERES_CONST size_t n_samples = 100; //nombre d'environements aléatoirement générés
      Eigen::MatrixXd samples = cluster_sampling(100);
  };
};


FIT_QD(nn_mlp){

  public :
    //Indiv : still do not know what it is 
    //IO : Neural Network Input and Output type
    template <typename Indiv>

      //void eval(Indiv & ind, IO & input, IO & target){ //ind : altered phenotype
      void eval(Indiv & ind){ //ind : altered phenotype

        //std::cout << "EVALUATION" << std::endl;

        std::vector<double> motor_usage(3);
        Eigen::MatrixXd motor_usages(Params::sample::n_samples,3);
        Eigen::Vector3d robot_angles;
        Eigen::Vector3d target;
        std::vector<double> dists(Params::sample::n_samples);

        // double sum_dist = 0;
        // double mean_dist = 0;
        // Eigen::Vector3d sum_motor_usage;
        double median_dist;
        std::vector<double> motor_usage_v0(Params::sample::n_samples);
        std::vector<double> motor_usage_v1(Params::sample::n_samples);
        std::vector<double> motor_usage_v2(Params::sample::n_samples);
        std::vector<double> motor_medians(3);

        Eigen::MatrixXd samples(Params::sample::n_samples,2); //init samples with cluster sampling 
        //samples = cluster_sampling(Params::sample::n_samples); // CHANGE THIS TO NON-STOCHASTIC INITIALISATION
        samples << -0.0523658,   -0.0159459,
                    0.0729398,     0.153243,
                    0.173819,    -0.156174,
        -0.0632467,      0.11341,
       -0.00815998,  -0.00284898,
         0.0629565,     0.116503,
        0.00143088,  -0.00128703,
         0.0145146,  -0.00828067,
          0.145554,    0.0910638,
         -0.132153,     0.191423,
         -0.110345,   -0.0719534,
          0.141234,   -0.0823328,
         -0.148198,    0.0936306,
         0.0148942,    -0.189967,
        0.00103637,    0.0118208,
         0.0551736,    0.0607411,
         -0.188803,    0.0106435,
        -0.0016992,   -0.0913189,
         0.0419884,     0.242022,
          0.109244,     0.153419,
         0.0123025,    0.0133735,
         0.0314529,    -0.218929,
        -0.0112872,     0.108517,
       -0.00916528,    -0.119081,
          0.043563,   -0.0531566,
          0.290581,   -0.0246753,
         -0.399291,     0.256194,
         -0.218968,     0.149509,
          0.374162,    0.0384356,
         -0.328597,    0.0276442,
         0.0378219,    -0.371574,
         -0.258128,    0.0878984,
          0.268435,  0.00119261,
         0.0585977,    -0.341038,
          0.470121,    0.0889074,
         -0.341225,     0.132676,
        -0.0189758,     0.261834,
         -0.207862,     0.390698,
         -0.279944,   -0.0280032,
          -0.28555,     0.310871,
         0.0352168,     0.405861,
          -0.43135,   0.00146929,
        -0.0497609,    -0.469513,
          0.193641,    -0.262979,
          0.317999,     0.204943,
          0.392853,    -0.242166,
         0.0557408,    -0.456991,
          0.344173,    0.0821805,
         0.0850246,    -0.356994,
         -0.167534,    -0.242303,
         -0.207891,     0.608374,
          0.496403,     0.109159,
         -0.600212,     0.172903,
           0.64706,     0.231047,
          0.511499,     0.510531,
         -0.381586,    -0.599347,
          0.121658,     0.539645,
          -0.44791,    -0.288178,
         -0.568546,   -0.0107167,
         -0.594988,    -0.101441,
         -0.626532,     0.257688,
         -0.235571,    -0.508017,
         -0.439361,     0.377688,
          -0.38858,    -0.537209,
           0.50509,    -0.440722,
          0.596931, -0.000971291,
           0.45832,     0.279619,
          0.600389,     0.381594,
          0.693351,     0.255277,
         -0.534086,    0.0562305,
         -0.378521,    -0.468355,
         0.0085669,    -0.641167,
          0.606308,    -0.139409,
         -0.520051,    -0.526832,
          0.231804,    -0.498698,
         -0.634631,    -0.648435,
          0.658962,     0.631662,
        -0.0128926,    -0.950681,
          0.667266,   -0.556871,
         -0.788119,    -0.142019,
          0.873232,    -0.434634,
         -0.743134,     0.254501,
         -0.578973,    -0.625844,
         -0.813005,    -0.531661,
         -0.713045,    -0.341372,
          0.016161,     -0.84118,
         -0.162089,     0.766834,
          0.505653,    -0.700366,
         -0.312391,     0.804556,
           0.56949,     0.801131,
          0.344108,     0.726432,
       0.000771163,     -0.97723,
          0.949523,    -0.173338,
          0.707818,      0.51694,
        -0.0350335,     0.953747,
         -0.825465,      0.26039,
          0.842995,    -0.337875,
          0.357677,     0.886756,
         -0.922534,     0.074673,
         -0.587449,     0.795136;
         //change it for a cleaner version

        for (int s = 0; s < Params::sample::n_samples ; ++s){ //iterate through several random environements

          //init data
          double dist = 0;
          double speed = 0;
          double desc1, desc2, desc3;
          double tot_mot_usage = 0;

          robot_angles = {0,M_PI,M_PI}; //init everytime at the same place
          for (int j = 0; j < 3 ; ++j){ 
                    motor_usage[j] = 0; //starting usage is null  
                    }

          target[0] = samples(s,0);
          target[1] = samples(s,1);

          std::vector<float> inputs(5);//TODO : what input do we use for our Neural network?

          for (int t=0; t< _t_max/_delta_t; ++t){ //iterate through time

            Eigen::Vector3d prev_pos; //compute previous position
            Eigen::Vector3d new_pos;
            prev_pos = forward_model(robot_angles);

            inputs[0] = target[0] - prev_pos[0]; //get side distance to target (-2 < input < 2)
            inputs[1] = target[1] - prev_pos[1]; //get front distance to target (-2 < input < 2)
            inputs[2] = robot_angles[0];
            inputs[3] = robot_angles[1];
            inputs[4] = robot_angles[2];

            //DATA GO THROUGH NN
            ind.nn().init(); //init neural network 
            
            //for (int j = 0; j < 100+ 1; ++j)
            for (int j = 0; j < ind.gen().get_depth() + 1; ++j) //In case of FFNN
              ind.nn().step(inputs);

            Eigen::Vector3d output;
            for (int indx = 0; indx < 3; ++indx){
              output[indx] = 2*(ind.nn().get_outf(indx) - 0.5)*_vmax; //Remap to a speed between -v_max and v_max (speed is saturated)
              robot_angles[indx] += output[indx]*_delta_t; //Compute new angles
              motor_usage[indx] += abs(output[indx]); //Compute motor usage
            }
            new_pos = forward_model(robot_angles);

            speed = sqrt(square(prev_pos.array() - new_pos.array()).sum())/_delta_t; //compute gripper's speed at each timestep

            target[2] = 0; //get rid of z coordinate
            new_pos[2] = 0;
	
	         if (sqrt(square(target.array() - new_pos.array()).sum()) < 0.01){
		          dist -= sqrt(square(target.array() - new_pos.array()).sum());
	         }
	

            // if (sqrt(square(target.array() - new_pos.array()).sum()) < 0.1){
            //   dist -= sqrt(square(target.array() - new_pos.array()).sum());
            // }

            else {
            //dist -= exp(t-_t_max/_delta_t)*sqrt(square(target.array() - prev_pos.array()).sum()); //cumulative squared distance between griper and target
              //dist -= (log(1+t)/log(1+_t_max/_delta_t))*(sqrt(square(target.array() - prev_pos.array()).sum())/dist_max); //cumulative squared distance between griper and target
              dist -= log(1+t) + sqrt(square(target.array() - new_pos.array()).sum());
            //dist -= sqrt(square(target.array() - prev_pos.array()).sum());
          }

        }
        dists[s] = dist;

        tot_mot_usage = motor_usage[0] + motor_usage[1] + motor_usage[2];
        desc1 = motor_usage[0]/tot_mot_usage;
        desc2 = motor_usage[1]/tot_mot_usage;
        desc3 = motor_usage[2]/tot_mot_usage;

        motor_usage_v0[s] = desc1; //TODO: Generalize to n arms
        motor_usage_v1[s] = desc2;
        motor_usage_v2[s] = desc3;
        } 

        median_dist = median(dists);
        motor_medians[0] = median(motor_usage_v0); //geometric median is approximated 
        motor_medians[1] = median(motor_usage_v1); 
        motor_medians[2] = median(motor_usage_v2);

        double dist_metric = median_dist;

        this->_value = dist_metric; //negative mean cumulative distance 

        std::vector<double> desc(3); 
        desc = {motor_medians[0], motor_medians[1], motor_medians[2]};

        //std::cout << "fitness " << dist_metric  << std::endl;
        //std::cout << "behavior descriptor " << motor_medians[0] << "  " << motor_medians[1] << "  " << motor_medians[2] << std::endl;

        this->set_desc(desc); //mean usage of each motor

      }

  double median(std::vector<double> &v)
  {
    size_t n = v.size() / 2;
    std::nth_element(v.begin(), v.begin()+n, v.end());
    return v[n];
  }

  Eigen::MatrixXd cluster_sampling(int n_s)
  { 
    Eigen::MatrixXd samples(n_s,2);

    double dist = 0;
    double radius = 0;
    double theta = 0;

    for (int i=0; i < n_s/4; ++i){
      radius = 0.25*((double) rand() / (RAND_MAX)); //radius E[0,1]
      theta = 2*M_PI*(((double) rand() / (RAND_MAX))-0.5);
      samples(i,0) = radius*cos(theta);
      samples(i,1) = radius*sin(theta);
    }
    for (int i=n_s/4; i< n_s/2 ; ++i){
      radius = 0.25*((double) rand() / (RAND_MAX)) + 0.25 ; //radius E[0,1]
      theta = 2*M_PI*(((double) rand() / (RAND_MAX))-0.5);
      samples(i,0) = radius*cos(theta);
      samples(i,1) = radius*sin(theta);
    }
    for (int i=n_s/2; i< 3*n_s/4 ; ++i){
      radius = 0.25*((double) rand() / (RAND_MAX)) + 0.5; //radius E[0,1]
      theta = 2*M_PI*(((double) rand() / (RAND_MAX))-0.5);
      samples(i,0) = radius*cos(theta);
      samples(i,1) = radius*sin(theta);
    }
    for (int i=3*n_s/4; i< n_s ; ++i){
      radius = 0.25*((double) rand() / (RAND_MAX)) + 0.75; //radius E[0,1]
      theta = 2*M_PI*(((double) rand() / (RAND_MAX))-0.5);
      samples(i,0) = radius*cos(theta);
      samples(i,1) = radius*sin(theta);
    }
    return samples;
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
  //std::default_random_engine generator; 
  //std::uniform_real_distribution<double> distribution(-1.0,1.0);
  double _vmax = 1;
  double _delta_t = 0.1;
  double _t_max = 10; //TMax guidé poto
};
