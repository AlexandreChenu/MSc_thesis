#!/usr/bin/env python
import os.path
import numpy as np 
import matplotlib.pyplot as plt 
import matplotlib.colors

#filename = "/Users/mobby/git/ex_data/logfile_test_1000.txt"


def extract_data(filename):

	L_X = []
	L_Y = []
 
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
			L_X.append([float(split_line[0])]) 
			L_Y.append([float(split_line[1])])
			print("pos : ",L_X[-1]," ",L_Y[-1])
			

	print(len(L_X)," samples extracted", filename)

	return(L_X, L_Y)


if __name__ == '__main__':

	extension = input("Which file would you want to visualize ? (it should be in ex_data directory) ")

	filename = "/Users/mobby/git/ex_data/" + extension
			
	L_X, L_Y= extract_data(filename)

	plt.figure()

	for i in range(0,16):
		plt.scatter(L_X[i],L_Y[i], c='r')

	for i in range(16,32):
		plt.scatter(L_X[i],L_Y[i], c='b')

	for i in range(32,48):
		plt.scatter(L_X[i],L_Y[i], c='y')

	for i in range(48,64):
		plt.scatter(L_X[i],L_Y[i], c='g')

	plt.Circle((0,0),0.25)
	plt.Circle((0,0),0.50)
	plt.Circle((0,0),0.75)
	plt.Circle((0,0),1)

	plt.show()




