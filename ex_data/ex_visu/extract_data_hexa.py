#!/usr/bin/env python
import os.path
import numpy as np 



# Define a filename.
filename0_1 = "/Users/mobby/git/ex_data/ex_archive_hexa0/archive_0.dat" ## basic configuration 100x100 grid for descriptor space + high mutation/cross rates



def extract_data(filename):

	L_actuators = []
	#L_fitness = []
 
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
			L_actuators.append(split_line[4:]) 
			#L_fitness.append(float(split_line[3]))

			#print(split_line[3])

	print(len(L_actuators)," iterations extracted from", filename)
	print(len(L_actuators[0])," number of degrees of freedom for hexapod")

	return(L_actuators)

if __name__ == '__main__':

	L_actuators = extract_data(filename0_1)