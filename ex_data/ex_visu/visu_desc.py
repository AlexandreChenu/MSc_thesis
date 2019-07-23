#!/usr/bin/env python
import os.path
import numpy as np 
import matplotlib.pyplot as plt 
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.colors

filename = "/Users/mobby/git/ex_data/test_no_bias_sample/archive_10000.dat"

def extract_data(filename):

	L_X = []
	L_Y = []
	L_Z = []
	L_fit = []
 
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
			L_X.append([float(split_line[1])]) 
			L_Y.append([float(split_line[2])])
			L_Z.append([float(split_line[3])])
			L_fit.append([float(split_line[4])])

			print("behavior descriptor : ",L_X[-1]," ",L_Y[-1]," ",L_Z[-1])

	print(len(L_X)," timesteps extracted from", filename)

	return(L_X, L_Y, L_Z, L_fit)

if __name__ == '__main__':


	fig = plt.figure()
	ax = fig.add_subplot(111, projection='3d')

	X,Y,Z,fit = extract_data(filename)

	ax.set_xlabel('zone 1')
	ax.set_ylabel('zone 2')
	ax.set_zlabel('zone 3')

	sc = ax.scatter(X,Y,Z,c=np.asarray(fit).reshape(len(fit),), marker = 'x')
	plt.colorbar(sc)

	plt.show()
