#!/usr/bin/env python
import os.path
import numpy as np 
import matplotlib.pyplot as plt 
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.colors


# Define a filename.
filename0_1 = "/Users/mobby/git/exp_direct_target_encode/archive_10000_2.dat" 


def extract_data(filename):

	L_X = []
	L_Y = []
	L_zone1 = []
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
			L_zone1.append([float(split_line[1])])
			L_X.append([float(split_line[4])])
			L_Y.append([float(split_line[5])])
			L_fitness.append(float(split_line[6]))

	print(len(L_X)," iterations extracted from", filename)

	return(L_X, L_Y, L_zone1, L_fitness)

def clean_data(L_X, L_Y, L_zone1, L_fitness):

	for i in range(len(L_X)-1,-1,-1):

		if L_fitness[i] <= 0 :

			L_X.pop(i)
			L_Y.pop(i)
			L_zone1.pop(i)
			L_fitness.pop(i)

	print(len(L_X)," controllers have been kept")

	return(L_X, L_Y, L_zone1, L_fitness)





if __name__ == '__main__':

	L_X, L_Y, L_zone1, L_fitness = extract_data(filename0_1)

	fig = plt.figure()

	ax = fig.add_subplot(111, projection='3d')

	plt.xlim(-1.2,1.2)
	plt.ylim(-1.2,1.2)

	sc = ax.scatter(L_X, L_Y, L_zone1, c=np.asarray(L_fitness).reshape(len(L_fitness),))
	plt.colorbar(sc)


	L_X, L_Y, L_zone1, L_fitness = clean_data(L_X, L_Y, L_zone1, L_fitness)

	fig1 = plt.figure()

	ax1 = fig1.add_subplot(111, projection='3d')

	sc1 = ax1.scatter(L_X, L_Y, L_zone1, c=np.asarray(L_fitness).reshape(len(L_fitness),))
	plt.colorbar(sc1)

	plt.show()
