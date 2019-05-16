#ifndef PHEN_ARM_HPP
#define PHEN_ARM_HPP

#include <modules/nn2/phen_dnn.hpp>

#include <cmath>
#include <algorithm>
#include <iostream>
#include <Eigen/Core>

#include <cstdlib>


namespace sferes {

	namespace phen {

		SFERES_INDIV(Dnn_arm, Indiv)

			public :

				Dnn_arm(){

					for (int j = 0; j < 3 + 1; ++j){
                		_motor_usage[j] = 0;
                		_robot_angles[j] = M_PI*(((double) rand() / (RAND_MAX))-0.5);
                		_target[j] = 10*(((double) rand() / (RAND_MAX))-0.5);
				}
			}

				const std::vector<double> &get_motor_usage(void) const{
					return _motor_usage;
				}

				void set_motor_usage(std::vector<double> new_motor_usage) {
					_motor_usage = new_motor_usage;
				}

				const std::vector<double> &get_robot_angles(void) const{
					return _robot_angles;
				}

				void set_robot_angles(std::vector<double> new_robot_angles) {
					_robot_angles = new_robot_angles;
				}

				const std::vector<double> &get_target(void) const{
					return _target;
				}

				void set_target(std::vector<double> new_target) {
					_target = new_target;
				}


			protected : 

				std::vector<double> _motor_usage(3);
				std::vector<double> _robot_angles(3);
				std::vector<double> _target(3);

		}



	}



}