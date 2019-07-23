#!/usr/bin/env python
import os.path
import numpy as np 
import matplotlib.pyplot as plt 
import matplotlib.colors
from mpl_toolkits.mplot3d import Axes3D



# Define a filename.
filename0_1 = "/Users/mobby/git/ex_data/2019-04-16_17_46_18_941/archive_1000.dat" ## basic configuration 100x100 grid for descriptor space + high mutation/cross rates
filename0_2 = "/Users/mobby/git/ex_data/2019-04-16_17_46_18_941/archive_3500.dat"
filename1_1 = "/Users/mobby/git/ex_data/2019-04-18_11_07_55_1246/archive_0.dat" ## small grid configuration 
filename1_2 = "/Users/mobby/git/ex_data/2019-04-18_11_07_55_1246/archive_2000.dat"
filename2_1 = "/Users/mobby/git/ex_data/2019-04-18_11_43_08_1292/archive_0.dat" ## low mutation/cross rates
filename2_2 = "/Users/mobby/git/ex_data/2019-04-18_11_43_08_1292/archive_2000.dat"
filename3_1 = "/Users/mobby/git/ex_data/2019-04-19_11_01_23_2039/archive_0.dat" ## unstructured archive with high mutation/cross rates
filename3_2 = "/Users/mobby/git/ex_data/2019-04-19_11_01_23_2039/archive_2000.dat"


def extract_data(filename):

	L_angles = []
	L_fitness = []
 
	if not os.path.isfile(filename):
		print ("File does not exist.")

	else:
	# Open the file as f.
	# The function readlines() reads the file.
		with open(filename) as f:
			content = f.read().splitlines()
	 
	# Show the file contents line by line.
	# We added the comma to print single newlines and not double newlines.
	# This is because the lines contain the newline character '\n'.

		for line in content:

			split_line = line.split()
			L_angles.append([float(split_line[-3]), float(split_line[-2]), float(split_line[-1])]) 
			L_fitness.append(float(split_line[3]))

	print(len(L_angles)," iterations extracted from", filename)

	return(L_angles, L_fitness)


def forward_model(theta0, theta1, theta2, theta3):

	#print(theta1)
	#print(type(theta1))

	T_01 = np.array([[np.cos(theta0), -np.sin(theta0), 0],[np.sin(theta0), np.cos(theta0), 0], [0, 0, 1]])
	T_12 = np.array([[1, 0, 0], [0, np.cos(theta1), -np.sin(theta1)],[0, np.sin(theta1), np.cos(theta1)]])
	T_23 = np.array([[1, 0, 0], [0, np.cos(theta2), -np.sin(theta2)],[0, np.sin(theta2), np.cos(theta2)]])


	return(T_01, T_12, T_23)


def get_position(theta0, theta1,theta2,theta3) :

	l0 = 1
	l1 = 1 #arm's first part size
	l2 = 1
	l3 = 1

	T_01, T_12, T_23 = forward_model(theta0, theta1, theta2, theta3)
	T_02 = T_01@T_12 
	T_03 = T_01@T_12@T_23

	v_0 = np.array([[0], [0], [l0]])
	v_1 = T_01 @ np.array([[0], [l1*np.cos(theta1)], [l1*np.sin(theta1)]])
	v_2 = T_02 @ np.array([[0], [l2*np.cos(theta2)], [l2*np.sin(theta2)]])
	v_3 = T_03 @ np.array([[0], [l3*np.cos(theta3)], [l3*np.sin(theta3)]])

	return (v_0 + v_1 + v_2 + v_3, v_0, v_1, v_2, v_3)

def get_positions(angles) :

	L_pos = []
	L_vec = []

	for angle in angles :

		pos, v_0, v_1, v_2, v_3 = get_position(angle[0], angle[1], angle[2])
		L_pos.append(pos)
		L_vec.append([v_1,v_2,v_3])

	# plt.figure()
	# plt.scatter()

	return(L_pos, L_vec)

def plot_arm(pos, vecs,color, iteration, ax):

	[v_0, v_1, v_2, v_3] = vecs

	ax.scatter(pos[0], pos[1])

	# print(vectors[0][0])
	# print(vectors[0][1])
	# print(vectors[0][2])

	##print ("v0: ", v_0)
	#print ("v1: ", v_1)

	v_0 = v_0.reshape((1,3))[0]
	v_1 = v_1.reshape((1,3))[0]
	v_2 = v_2.reshape((1,3))[0]
	v_3 = v_3.reshape((1,3))[0]

	#print ("v0: ", v_0)
	#print ("v1: ", v_1)

	ax.plot([0,v_0[0]], [0,v_0[1]], [0,v_0[2]],c=color, label = iteration)
	ax.plot([v_0[0],v_0[0]+v_1[0]], [v_0[1],v_0[1]+v_1[1]], [v_0[2],v_0[2]+v_1[2]], c= color)
	ax.plot([v_0[0]+v_1[0], v_0[0]+v_1[0]+v_2[0]], [v_0[1]+v_1[1],v_0[1]+v_1[1]+v_2[1]], [v_0[2]+v_1[2],v_0[2]+v_1[2]+v_2[2]], c = color)
	ax.plot([v_0[0]+v_1[0]+v_2[0], v_0[0]+v_1[0]+v_2[0]+v_3[0]], [v_0[1]+v_1[1]+v_2[1],v_0[1]+v_1[1]+v_2[1]+v_3[1]], [v_0[2]+v_1[2]+v_2[2],v_0[2]+v_1[2]+v_2[2]+v_3[2]], c = color)

	#plt.show()

	return


if __name__ == '__main__':


	fig = plt.figure()
	ax = fig.add_subplot(111, projection='3d')

	ax.set_xlim((-3,3))
	ax.set_ylim((-3,3))
	ax.set_zlim((0,3))

	# #initialisation
	# angle = [3 , -3 , 3]
	# pos, v_1, v_2, v_3 = get_position(angle[0], angle[1], angle[2])
	# plot_arm(pos, [v_1, v_2, v_3], 'black', 'initialisation')

	# #after 500 iterations
	# #angle = [-0.195093 , -0.459253 , -0.272114]
	# angle = [-0.433375 , -0.277545 , -0.378921]
	# pos, v_1, v_2, v_3 = get_position(angle[0], angle[1], angle[2])
	# plot_arm(pos, [v_1, v_2, v_3], 'r', '500 iterations')

	# #after 1000 iterations
	# #angle = [-0.307975 , -0.455769 , -0.269301]
	# angle = [-0.534194 , -0.403069 , -0.377339]
	# pos, v_1, v_2, v_3 = get_position(angle[0], angle[1], angle[2])
	# plot_arm(pos, [v_1, v_2, v_3], 'g', '1000 iterations')

	# angle = [-0.450883 , -0.424328 , -0.372255]
	# pos, v_1, v_2, v_3 = get_position(angle[0], angle[1], angle[2])
	# plot_arm(pos, [v_1, v_2, v_3], 'y', '2000 iterations with lower mutation rate')

	#target trajectory
	# target_pos = [0.83299100918905145, 0.15455961613055846]
	# target_angle = [-0.43605732917785645, -0.40392923355102539, -0.29289793968200684]

	# target_pos = [0.83299100918905145, 0.15455961613055846, ]
	target_angle = [0, 1, -1, 0.5]

	T1,T2,T3 = forward_model(0, 0.8, -0.8, 0.3)

	pos_t, v_0_t, v_1_t, v_2_t, v_3_t = get_position(target_angle[0], target_angle[1], target_angle[2], target_angle[3])
	plot_arm(pos_t, [v_0_t, v_1_t, v_2_t, v_3_t], 'b', 'Target', ax)




	plt.legend()
	

	plt.show()