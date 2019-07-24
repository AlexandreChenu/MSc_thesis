#!/usr/bin/env python
import os.path
import numpy as np 
import matplotlib.pyplot as plt 
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.colors

filename_in = "/Users/mobby/git/ex_data/samples_in.txt"
filename_out = "/Users/mobby/git/ex_data/test_300_samples_no_bias/samples_out.txt"

def extract_data_io(filename_in, filename_out):

	L_X = []
	L_Y = []

	L_fit = []
 
	if not os.path.isfile(filename_in):
		print ("File in does not exist.")
		return

	else:
	# Open the file as f.
	# The function readlines() reads the file.
		with open(filename_in) as f:
			content = f.read().splitlines()
	 
	# Show the file contents line by line.
	# We added the comma to print single newlines and not double newlines.
	# This is because the lines contain the newline character '\n'.

		for line in content:

			split_line = line.split()
			L_X.append([float(split_line[0])]) 
			L_Y.append([float(split_line[1])])

			print("input point : ",L_X[-1]," ",L_Y[-1])

	print(len(L_X),"timesteps extracted from", filename_in)

	if not os.path.isfile(filename_out):
		print ("File out does not exist.")
		return

	else:
	# Open the file as f.
	# The function readlines() reads the file.
		with open(filename_out) as f:
			content = f.read().splitlines()
	 
	# Show the file contents line by line.
	# We added the comma to print single newlines and not double newlines.
	# This is because the lines contain the newline character '\n'.

		for line in content:

			split_line = line.split()
			L_fit.append([float(split_line[0])]) 

			print("fitness : ",L_fit)

	print(len(L_fit), "timesteps extracted from", filename_in)


	return(L_X, L_Y, L_fit)

if __name__ == '__main__':


	fig = plt.figure()
	# ax = fig.add_subplot(111, projection='3d')

	X,Y,fit = extract_data_io(filename_in, filename_out)

	plt.xlabel('x')
	plt.ylabel('y')
	# plt.zlabel('fitness')

	# plt.scatter(X,Y,c=np.asarray(fit).reshape(len(fit),), marker = 'x') ##TODO : check it is well written 
	plt.scatter(X,Y,c=fit)
	plt.colorbar()

	plt.show()
