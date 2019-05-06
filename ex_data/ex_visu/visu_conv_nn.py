#!/usr/bin/env python
import os.path
import matplotlib.pyplot as plt 
import numpy as np


filename0 = "/Users/mobby/git/ex_data/2019-05-03_14_46_56_470/bestfit.dat"
filename1 = "/Users/mobby/git/ex_data/2019-05-03_14_51_59_489/bestfit.dat"
filename2 = "/Users/mobby/git/ex_data/2019-05-03_15_14_25_532/bestfit.dat"

def extract_data(filename):

	L_gen = []
	L_fit = []
 
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
			L_gen.append([int(split_line[0])]) 
			L_fit.append(float(split_line[2]))

	print(len(L_gen)," iterations extracted from", filename)

	return(L_gen, L_fit)

if "__main__" == __name__:

	X0, Y0 = extract_data(filename0)
	X1, Y1 = extract_data(filename1)
	X2, Y2 = extract_data(filename2)


	plt.plot(X0,Y0,c='r',label='500 iterations')
	plt.plot(X1,Y1,c='b',label='1000 iterations')
	plt.plot(X2,Y2,c='y',label='2000 iterations and higher mutation rate')

	plt.legend()
	
	plt.show()




