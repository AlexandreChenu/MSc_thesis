#!/usr/bin/env python
import os.path
import numpy as np 
import matplotlib.pyplot as plt 
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.colors


L_rad = np.linspace(0,1,20)
L_angle = np.linspace(0,2*np.pi, 50)


L_X = []
L_Y = []

for i in range (len(L_rad)):
	for j in range(len(L_angle)):
		L_X.append(L_rad[i]*np.cos(L_angle[j]))
		L_Y.append(L_rad[i]*np.sin(L_angle[j]))


L_X1 = np.linspace(-1,1,30)
L_X2 = np.linspace(-1,1,30)

# for i in range(len(L_X1)-1,-1,-1):
# 	for j in range(len(L_X2)-1, -1, -1):
# 		if np.sqrt(L_X1[i]**2+L_X2[j]**2) > 1:
# 			L_X1 = np.delete(L_X1,i)
# 			L_X2 = np.delete(L_X2,j)


fig = plt.figure()

plt.scatter(L_X,L_Y)

fig2 = plt.figure()

plt.scatter(L_X1, L_X2)

plt.show()
