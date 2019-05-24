simple_ebn.cpp is a SFERES2 experience. It uses NN2 module to train a Neural Network in order to allow a robot arm to autonomously learn a controller to reach a fix target. 

Neural Network :
Inputs : - distance between the gripper and the target (x-axis)
         - distance between the gripper and the target (y-axis)
         
Outputs : - first motor input 
          - second motor input 
          - third motor input 

Algorithm's pipeline :
1. Creation of all the template types in order to create a QD algorithm
2. Algorithm running 
3. Results collection

Dependences :
The algorithm depends on :
- NN2 module, in order to install it, please refer to Usage & installation section in the module's 
github page https://github.com/sferes2/nn2.
- fit_behav.hpp, a file describing both QD algorithm's parameters and evaluation function.
- best_fit_nn.hpp, a modified version of SFERES2's best_fit.hpp implementation. best_fit_nn.hpp 
refers to absolute path, you will have to manually change it. 
TODO: change absolute path to relative path

How to launch it :
- Install and modify all necessary dependences
- Compile the experience with ./waf --exp simple_ex
- Launch it with ./<path-to-executable>/simple_ebn
