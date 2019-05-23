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

#include "/git/sferes2/exp/examples2/best_fit_nn.hpp"

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
#include <boost/serialization/shared_ptr.hpp>
#include <boost/serialization/nvp.hpp>
#include <boost/archive/binary_oarchive.hpp>
#include <boost/archive/binary_iarchive.hpp>

#include <modules/nn2/mlp.hpp>
#include <modules/nn2/gen_dnn.hpp>
#include <modules/nn2/phen_dnn.hpp>

#include <modules/nn2/gen_dnn_ff.hpp>

//#include <exp/examples2/phen_arm.hpp>

#include <cmath>
#include <algorithm>
#include <typeinfo>

#include <cstdlib>

//#include "/git/sferes2/exp/examples2/fit_behav.hpp"

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



int main(int argc, char **argv) 
{
    using namespace sferes;
    using namespace nn;

    std::cout << "STARTING INIT" <<std::endl;

    typedef nn_mlp<Params> fit_t; 

    typedef phen::Parameters<gen::EvoFloat<1, Params>, fit::FitDummy<>, Params> weight_t;
    typedef phen::Parameters<gen::EvoFloat<1, Params>, fit::FitDummy<>, Params> bias_t;
    typedef PfWSum<weight_t> pf_t;
    typedef AfSigmoidBias<bias_t> af_t;
    typedef sferes::gen::DnnFF<Neuron<pf_t, af_t>,  Connection<weight_t>, Params> gen_t; // TODO : change by DnnFF in order to use only feed-forward neural networks
                                                                                       // TODO : change by hyper NN in order to test hyper NEAT 
    typedef phen::Dnn<gen_t, fit_t, Params> phen_t;

    //start with a fit dummy for debugging
    // typedef phen::Parameters<gen::EvoFloat<1, Params>, fit::FitDummy<>, Params> weight_t;
    // typedef phen::Parameters<gen::EvoFloat<1, Params>, fit::FitDummy<>, Params> bias_t;
    // typedef PfWSum<weight_t> pf_t;
    // typedef AfTanh<bias_t> af_t;
    // typedef sferes::gen::Dnn<Neuron<pf_t, af_t>,  Connection<weight_t>, Params> gen_t; //does this exist in sferes??
    // typedef phen::Dnn<gen_t, fit::FitDummy<>, Params> phen_t;


    typedef qd::selector::Uniform<phen_t, Params> select_t; //TODO : test other selector

    // typedef qd::selector::getFitness ValueSelect_t;
    // typedef qd::selector::Tournament<phen_t, ValueSelect_t, Params> select_t; 

    typedef qd::container::SortBasedStorage< boost::shared_ptr<phen_t> > storage_t; 
    typedef qd::container::Archive<phen_t, storage_t, Params> container_t; 

    //typedef eval::Eval<Params> eval_t; //(useful for debbuging)
    typedef eval::Parallel<Params> eval_t; //parallel eval (faster)
 
    typedef boost::fusion::vector< 
        stat::BestFitNN<phen_t, Params>, 
        stat::QdContainer<phen_t, Params>, 
        stat::QdProgress<phen_t, Params> 
        >
        stat_t; 

    typedef modif::Dummy<> modifier_t; //place holder
    
    typedef qd::QualityDiversity<phen_t, eval_t, stat_t, modifier_t, select_t, container_t, Params> qd_t; 
    //typedef qd::MapElites<phen_t, eval_t, stat_t, modifier_t, Params> qd_t;

    qd_t qd;
    //run_ea(argc, argv, qd); 

    qd.run();
    std::cout<<"best fitness:" << qd.stat<0>().best()->fit().value() << std::endl;
    std::cout<<"archive size:" << qd.stat<1>().archive().size() << std::endl;


    //save model
    // std::ofstream ofs("/git/sferes2/exp/tmp/test_nn2.dot");
    // qd.stat<0>().best()->nn().init(); //init network for best fit
    // qd.stat<0>().best()->nn().write(ofs);

    // std::cout<<"model written in test_nn2.dot" <<std::endl;

    qd.stat<0>().best()->nn().init(); //init network for best fit

    typedef boost::archive::binary_oarchive oa_t;
    typedef boost::archive::binary_iarchive ia_t;

    
    const std::string filename = "/git/sferes2/exp/tmp/serialize_nn1.bin";
    
    std::string typeuh = typeid(*qd.stat<0>().best()).name();
    std::cout << "typeuh : " << typeuh << std::endl;
    //gen_t model1 = qd.stat<0>().best()->gen(); //toujours pas
    //phen_t model = *qd.stat<0>().best();
    //boost::shared_ptr<phen_t> m_ptr = qd.stat<0>().best();

    //model.nn().init();


    //save model
    {
    std::ofstream ofs(filename, std::ios::binary);
    oa_t oa(ofs);
    //oa << model;
    oa << *qd.stat<0>().best();
    }
    std::cout << "model written" << std::endl;
    
    //load model
    phen_t model_load;
    {
    std::ifstream ifs(filename , std::ios::binary);
    ia_t ia(ifs);
    ia >> model_load;
    }

    //develop loaded model
    model_load.develop();

    //init variables
    double _vmax = 1;
    double _delta_t = 0.1;
    double _t_max = 5;
    Eigen::Vector3d robot_angles;
    Eigen::Vector3d target;
    double dist;

    //initialize data
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
    logfile.open("/git/sferes2/exp/tmp/logfile_test.txt");

    std::vector<float> inputs(2);

    Eigen::Vector3d prev_pos; //compute previous position
    prev_pos = forward_model(robot_angles);

    for (int t=0; t< _t_max/_delta_t; ++t){

      inputs[0] = target[0] - prev_pos[0]; //get side distance to target
      inputs[1] = target[1] - prev_pos[1]; //get front distance to target

      logfile << inputs[0] << "    " << inputs[1] << "    ";
      std::cout << "inputs: " << inputs[0] << "  " << inputs[1] << std::endl; 
      //std::cout << "input written" << std::endl;

      //DATA GO THROUGH NN
      for (int j = 0; j < qd.stat<0>().best()->gen().get_depth() + 1; ++j){
        qd.stat<0>().best()->nn().step(inputs);
        model_load.nn().step(inputs);
        }
        //std::cout << j << std::endl;}
      //std::cout << "data went through nn" << std::endl;

      Eigen::Vector3d output;
      for (int indx = 0; indx < 3; ++indx){
        output[indx] = 2*(qd.stat<0>().best()->nn().get_outf(indx) - 0.5)*_vmax; //Remap to a speed between -v_max and v_max (speed is saturated)
        robot_angles[indx] += output[indx]*_delta_t; //Compute new angles
      }
      std::cout << "output obtained: " << model_load.nn().get_outf(0) << "   " << model_load.nn().get_outf(1) << "    " << model_load.nn().get_outf(2) << std::endl;
      std::cout << "output we should have: " << qd.stat<0>().best()->nn().get_outf(0) << "   " << qd.stat<0>().best()->nn().get_outf(1) << "   " << qd.stat<0>().best()->nn().get_outf(2) << std::endl;
      logfile << output[0] << "    " << output[1] << "    ";
      //std::cout << "output written" << std::endl;

      prev_pos = forward_model(robot_angles);
      logfile << robot_angles[0] << "    " << robot_angles[1] << "    " << robot_angles[2] << "    ";
      logfile << prev_pos[0] << "    " << prev_pos[1] << "    ";
      logfile << target[0] << "    " << target[1] << "\n";
    }

    logfile.close();

    std::cout << "ex_behav...done" << std::endl;
    return 0;

  }
