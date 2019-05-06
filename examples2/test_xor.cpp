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


using namespace sferes;
using namespace sferes::gen::dnn;
using namespace sferes::gen::evo_float;

struct Params {
  struct evo_float {
    SFERES_CONST float mutation_rate = 0.8f;
    SFERES_CONST float cross_rate = 0.1f;
    SFERES_CONST mutation_t mutation_type = polynomial;
    SFERES_CONST cross_over_t cross_over_type = sbx;
    SFERES_CONST float eta_m = 15.0f;
    SFERES_CONST float eta_c = 15.0f;
  };

  struct parameters {
    // maximum value of parameters
    SFERES_CONST float min = -5.0f;
    // minimum value
    SFERES_CONST float max = 5.0f;
  };

  struct dnn {
    SFERES_CONST size_t nb_inputs = 2; //x and y
    SFERES_CONST size_t nb_outputs  = 1; //output of function 
    // minimum number of neurons used for the random generation
    SFERES_CONST size_t min_nb_neurons = 2;
    // maximum number of neurons used for the random generation
    SFERES_CONST size_t max_nb_neurons = 10;
    // minimum number of connections used for the random generation
    SFERES_CONST size_t min_nb_conns = 20;
    // maximum number of connections used for the random generation
    SFERES_CONST size_t max_nb_conns = 25;

    SFERES_CONST float  max_weight  = 3.0f;
    SFERES_CONST float  max_bias  = 3.0f;

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
      SFERES_CONST size_t init_size = 200; // nombre d'individus générés aléatoirement 
      SFERES_CONST size_t size = 200; // size of a batch
      SFERES_CONST size_t nb_gen = 501; // nbr de gen pour laquelle l'algo va tourner 
      SFERES_CONST size_t dump_period = 200; 
  };

  struct qd { //TODO : investigate how to use a structured archive

      SFERES_CONST size_t dim = 4;
      SFERES_CONST size_t behav_dim = 4; //taille du behavior descriptor
      SFERES_ARRAY(size_t, grid_shape, 100, 100, 100, 100);
  };
};


FIT_QD(nn_xor){

  public :
    //Indiv : still do not know what it is 
    //IO : Neural Network Input and Output type
    template <typename Indiv>

      //void eval(Indiv & ind, IO & input, IO & target){ //ind : altered phenotype
      void eval(Indiv & ind){ //ind : altered phenotype

        std::cout << "New eval" << std::endl;

        float fit = 0;
        static const std::vector<std::vector<float>> inputs = {{0, 0}, {0, 1}, {1, 0}, {1, 1}};
        static const std::vector<float> outputs = {0, 1, 1, 0};

        std::vector<double> data(4);

        for (int i = 0; i < 4 ; ++i)
        {   
            ind.nn().init(); //init NNet
            // keep in mind that step() performing a single step here
            // but we may have several "layers" and recurrence
            // this is why here we sometimes call it 10 times (this is an arbitrary number)
            // for feed-forward networks (dnn_ff), we can compute the number of required steps
            // and retrieve it by .get_depth() + 1
            for (int j = 0; j < ind.gen().get_depth() + 1; ++j)
                ind.nn().step(inputs[i]);

            std::vector<float> outf = ind.nn().get_outf(); //Replace with just a float? 
                                                                  //Nota : Neural Network outputs are between 0 and 1

            std::cout << "Neural Network output :" << ind.nn().get_outf(0) << std::endl;
            std::cout << "Neural Network input :" << inputs[i][0] << " " << inputs[i][1] << std::endl;

            // fit -= std::pow(2*(outf[0]-0.5) - outputs[i], 2.0);
            fit -= std::pow(outf[0] - outputs[i], 2.0);

            //data[i] = 2*(outf[0]-0.5); 
            data[i] = outf[0];}

        this->_value = fit;

        this->set_desc(data); //4 points values
        
      }

};


int main(int argc, char **argv) 
{
    using namespace sferes;
    using namespace nn;

    std::cout << "STARTING INIT" <<std::endl;

    typedef nn_xor<Params> fit_t; //TODO : Fitness to test

    typedef phen::Parameters<gen::EvoFloat<1, Params>, fit_t, Params> weight_t;
    typedef phen::Parameters<gen::EvoFloat<1, Params>, fit_t, Params> bias_t;
    typedef PfWSum<weight_t> pf_t;
    typedef AfSigmoidBias<bias_t> af_t;
    typedef sferes::gen::DnnFF<Neuron<pf_t, af_t>,  Connection<weight_t>, Params> gen_t; // TODO : change by DnnFF in order to use only feed-forward neural networks
                                                                                       // TODO : change by hyper NN in order to test hyper NEAT 
    typedef phen::Dnn<gen_t, fit_t, Params> phen_t;


    typedef qd::selector::Uniform<phen_t, Params> select_t; //TODO : test other selector -> tournament ok

    typedef qd::selector::getFitness ValueSelect_t;
    //typedef qd::selector::Tournament<phen_t, ValueSelect_t, Params> select_t; 

    typedef qd::container::SortBasedStorage< boost::shared_ptr<phen_t> > storage_t; 
    typedef qd::container::Archive<phen_t, storage_t, Params> container_t; 

    typedef eval::Eval<Params> eval_t; //(useful for debbuging)
    //typedef eval::Parallel<Params> eval_t; //parallel eval (faster)
 
    typedef boost::fusion::vector< 
        stat::BestFit<phen_t, Params>, 
        //stat::QdContainer<phen_t, Params>, 
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


    std::vector<float> in_0(2); 
    in_0 = {0, 0};

    std::vector<float> in_1(2); 
    in_1 = {0, 1};

    std::vector<float> in_2(2); 
    in_2 = {1, 0};

    std::vector<float> in_3(2); 
    in_3 = {1, 1};

    qd.stat<0>().best()->nn().init(); //init network for best fit
    for (int j = 0; j < qd.stat<0>().best()->gen().get_depth() + 1; ++j)
                qd.stat<0>().best()->nn().step(in_0);
    std::cout << "xor(0,0) ="  << qd.stat<0>().best()->nn().get_outf(0) << std::endl;



    qd.stat<0>().best()->nn().init();
    for (int j = 0; j < qd.stat<0>().best()->gen().get_depth() + 1; ++j)
                qd.stat<0>().best()->nn().step(in_1);
    std::cout << "xor(0,1) ="  << qd.stat<0>().best()->nn().get_outf(0) << std::endl;



    qd.stat<0>().best()->nn().init();
    for (int j = 0; j < qd.stat<0>().best()->gen().get_depth() + 1; ++j)
                qd.stat<0>().best()->nn().step(in_2);
    std::cout << "xor(1,0) ="  << qd.stat<0>().best()->nn().get_outf(0) << std::endl;



    qd.stat<0>().best()->nn().init();
    for (int j = 0; j < qd.stat<0>().best()->gen().get_depth() + 1; ++j)
                qd.stat<0>().best()->nn().step(in_3);
    std::cout << "xor(1,1) ="  << qd.stat<0>().best()->nn().get_outf(0) << std::endl;


    return 0;
    
}