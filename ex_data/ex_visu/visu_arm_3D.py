#!/usr/bin/env python
import os.path
import numpy as np 
import matplotlib.pyplot as plt 
import matplotlib.colors
from matplotlib import animation
import time

#filename = "/Users/mobby/git/ex_data/logfile_test_1000.txt"


def extract_data(filename):

	L_X = []
	L_Y = []
	L_angles = []
 
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
			L_X.append([float(split_line[-4])]) 
			L_Y.append([float(split_line[-3])])
			L_angles.append([float(split_line[-8]), float(split_line[-7]), float(split_line[-6]), float(split_line[-5])])
			#L_fitness.append(float(split_line[3]))
			print("pos : ",L_X[-1]," ",L_Y[-1])
			
		target = [float(split_line[-2]), float(split_line[-1])]

	print(len(L_X)," timesteps extracted from", filename)

	return(L_X, L_Y, L_angles, target)


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
	v_3 = T_03 @ np.array([[0], [l3*np.cos(theta3)], [l2*np.sin(theta3)]])

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

def plot_arm(pos, vecs, axe):

	[v_1, v_2, v_3] = vecs

	axe.scatter(pos[0], pos[1])

	# print(vectors[0][0])
	# print(vectors[0][1])
	# print(vectors[0][2])

	axe.plot([0,v_1[0]],[0,v_1[1]])
	axe.plot([v_1[0],v_1[0]+v_2[0]],[v_1[1],v_1[1]+v_2[1]])
	axe.plot([v_1[0]+v_2[0], v_1[0]+v_2[0]+v_3[0]],[v_1[1]+v_2[1],v_1[1]+v_2[1]+v_3[1]])

	#plt.show()

def init_figure(xmin,xmax,ymin,ymax):
	fig = figure(0)
	ax = fig.add_subplot(111, aspect='equal')
	ax.xmin=xmin
	ax.xmax=xmax
	ax.ymin=ymin
	ax.ymax=ymax
	clear(ax)
	return ax

def clear(ax):
	pause(0.001)
	cla()
	ax.set_xlim(ax.xmin,ax.xmax)
	ax.set_ylim(ax.ymin,ax.ymax)

if __name__ == '__main__':

	### PLOT RANDOM BEHAVIOURS
	# for i in range(0,5):

	# 	filename = "/Users/mobby/git/ex_data/test_1000it_10_sec2/logfile_test" + str(i) + ".txt"
		
	# 	L_X, L_Y, target = extract_data(filename)

	# 	plt.figure()
		
	# 	print("Target :", target)
	# 	plt.scatter(L_X[0],L_Y[0],c='black')

	# 	plt.scatter(L_X[1:],L_Y[1:],c='r')

	# 	plt.scatter(target[0],target[1],c='b')


	### PLOT BEST FIT
	extension = input("Which file would you want to visualize ? (it should be in ex_data directory) ")

	filename = "/Users/mobby/git/ex_data/" + extension
		
	L_X, L_Y, L_angles, target = extract_data(filename)

	L_pos, L_vec = get_positions(L_angles)
	plt.ion()
	fig = plt.figure(0)
	ax = fig.add_subplot(111, aspect='equal')
	ax.xmin=-2
	ax.xmax=2
	ax.ymin=-2
	ax.ymax=2
	plt.pause(0.001)



	for i in range (1,100):

		plt.cla()
		ax.set_xlim(ax.xmin,ax.xmax)
		ax.set_ylim(ax.ymin,ax.ymax)
		#print("pos")

		pos = L_pos[i]
		[v_1, v_2, v_3] = L_vec[i]

		ax.scatter(pos[0], pos[1])
		ax.plot([0,v_1[0]],[0,v_1[1]])
		ax.plot([v_1[0],v_1[0]+v_2[0]],[v_1[1],v_1[1]+v_2[1]])
		ax.plot([v_1[0]+v_2[0], v_1[0]+v_2[0]+v_3[0]],[v_1[1]+v_2[1],v_1[1]+v_2[1]+v_3[1]])
		plt.show()
		plt.pause(0.0001)

	plt.show()



