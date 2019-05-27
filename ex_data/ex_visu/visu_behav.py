#!/usr/bin/env python
import os.path
import numpy as np 
import matplotlib.pyplot as plt 
import matplotlib.colors

#filename = "/Users/mobby/git/ex_data/logfile_test_1000.txt"


def extract_data(filename):

	L_X = []
	L_Y = []
	L_angles = []
 
	if not os.path.isfile(filename):
		print ("File does not exist.")
		return

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
			#L_angles.append([float(split_line[-7]), float(split_line[-6]), float(split_line[-5])])
			#L_fitness.append(float(split_line[3]))
			print("pos : ",L_X[-1]," ",L_Y[-1])
			
		target = [float(split_line[-2]), float(split_line[-1])]

	print(len(L_X)," timesteps extracted from", filename)

	return(L_X, L_Y, target)


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

	# for i in range(0,2500,500):

	# 	filename = "/Users/mobby/git/ex_data/test_model/log_model_" + str(i) + ".txt"
			
	# 	L_X, L_Y, target = extract_data(filename)

	# 	plt.figure()
			
	# 	print("Target :", target)
	# 	plt.scatter(L_X[0],L_Y[0],c='black')
	# 	plt.scatter(L_X[1:-1],L_Y[1:-1],c='r')
	# 	plt.scatter(L_X[-1],L_Y[-1],c='g')
	# 	plt.scatter(target[0],target[1],c='b')

	extension = input("Which file would you want to visualize ? (it should be in ex_data directory) ")

	filename = "/Users/mobby/git/ex_data/" + extension
			
	L_X, L_Y, target = extract_data(filename)

	plt.figure()
		
	print("Target :", target)
	plt.scatter(L_X[0],L_Y[0],c='black')
	plt.scatter(L_X[1:-1],L_Y[1:-1],c='r')
	plt.scatter(L_X[-1],L_Y[-1],c='g')
	plt.scatter(target[0],target[1],c='b')

	plt.show()




