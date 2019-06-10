#!/usr/bin/env python
import os.path
import numpy as np 
import matplotlib.pyplot as plt 
import matplotlib.colors


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


def forward_model(theta1, theta2, theta3):

	#print(theta1)
	#print(type(theta1))

	T_12 = np.array([[np.cos(theta1), -np.sin(theta1)],[np.sin(theta1), np.cos(theta1)]])
	T_23 = np.array([[np.cos(theta2), -np.sin(theta2)],[np.sin(theta2), np.cos(theta2)]])

	return(T_12,T_23)


def get_position(theta1,theta2,theta3) :

	l1 = 2 #arm's first part size
	l2 = 2
	l3 = 2

	T_12, T_23 = forward_model(theta1, theta2, theta3)
	T_13 = T_12@T_23

	v_1 = np.array([[l1*np.cos(theta1)],[l1*np.sin(theta1)]])
	v_2 = T_12 @ np.array([[l2*np.cos(theta2)],[l2*np.sin(theta2)]])
	v_3 = T_13 @ np.array([[l3*np.cos(theta3)],[l2*np.sin(theta3)]])

	return (v_1 + v_2 + v_3, v_1, v_2, v_3)

def get_positions(angles) :

	L_pos = []
	L_vec = []

	for angle in angles :

		pos, v_1, v_2, v_3 = get_position(angle[0], angle[1], angle[2])
		L_pos.append(pos)
		L_vec.append([v_1,v_2,v_3])

	# plt.figure()
	# plt.scatter()

	return(L_pos, L_vec)

def plot_arm(pos, vecs):

	[v_1, v_2, v_3] = vecs

	plt.figure(figsize=(5,5))
	plt.xlim((-8,8))
	plt.ylim((-8,8))

	plt.scatter(pos[0], pos[1])

	# print(vectors[0][0])
	# print(vectors[0][1])
	# print(vectors[0][2])

	plt.plot([0,v_1[0]],[0,v_1[1]])
	plt.plot([v_1[0],v_1[0]+v_2[0]],[v_1[1],v_1[1]+v_2[1]])
	plt.plot([v_1[0]+v_2[0], v_1[0]+v_2[0]+v_3[0]],[v_1[1]+v_2[1],v_1[1]+v_2[1]+v_3[1]])

	#plt.show()

	return


if __name__ == '__main__':

	L_angles, L_fitness = extract_data(filename0_1)
	positions, vectors = get_positions(L_angles)


	L_angles2, L_fitness2 = extract_data(filename0_2)
	positions2, vectors2 = get_positions(L_angles2)

	plot_arm(positions[0], vectors[0])


	plt.figure()
	plt.xlim((-8,8))
	plt.ylim((-8,8))

	pos_x = []
	pos_y = []

	for position in positions:

		pos_x.append(position[0])
		pos_y.append(position[1])

	sc = plt.scatter(pos_x, pos_y, c=np.asarray(L_fitness).reshape(len(L_fitness),1), marker = 'x')

	clb = plt.colorbar(sc)
	clb.set_label('Fitness')

	plt.figure()
	plt.xlim((-8,8))
	plt.ylim((-8,8))

	pos_x2 = []
	pos_y2 = []

	for position in positions2:

		pos_x2.append(position[0])
		pos_y2.append(position[1])

	sc2 = plt.scatter(pos_x2, pos_y2, c=np.asarray(L_fitness2).reshape(len(L_fitness2),1), marker = 'x')

	clb2 = plt.colorbar(sc2)
	clb2.set_label('Fitness')

	plt.show()
