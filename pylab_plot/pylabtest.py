import sys
sys.path.append("/home/the0project/Desktop/ProjectSimulator/python_db")
from db_model import * 
import db_connect
import math
import pylab

import matplotlib as mpl
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.pyplot as plt2
#x_list = pylab.arange(0.0, 5.0, 0.01)

pylab.figure(1)

email_s = raw_input("Enter Email: ")
user = User.objects(email = email_s).get()
model = Model.objects(driver = user).get()

data =[]
for s in model.speed:
	x=  float (s.value)
	data.append(x)

pylab.subplot(331)
y_speed = data
pylab.xlabel("time")
pylab.ylabel("speed")
pylab.plot(y_speed, 'b')

data =[]
for s in model.brake:
	x=  float (s.value)
	data.append(x)
pylab.subplot(332)
y_brake = data
pylab.xlabel("time")
pylab.ylabel("brake")
pylab.plot(y_brake, 'b')


data =[]
for s in model.gas:
	x=  float (s.value)
	data.append(x)
pylab.subplot(333)
y_gas = data
pylab.xlabel("time")
pylab.ylabel("gas")
pylab.plot(y_gas, 'b')


data =[]
for s in model.gear:
	x=  float (s.value)
	data.append(x)
pylab.subplot(334)
y_gear = data
pylab.xlabel("time")
pylab.ylabel("gear")
pylab.plot(y_gear, 'b')

data =[]
for s in model.distance:
	x=  float (s.value)
	data.append(x)
pylab.subplot(335)
y_gear = data
pylab.xlabel("time")
pylab.ylabel("distance")
pylab.plot(y_gear, 'b')

data =[]
for s in model.intrack:
	x=  float (s.value)
	data.append(x)
pylab.subplot(336)
y_gear = data
pylab.xlabel("time")
pylab.ylabel("intrack")
pylab.plot(y_gear, 'b')

data =[]
for s in model.steering:
	x=  float (s.value)
	data.append(x)
pylab.subplot(337)
y_gear = data
pylab.xlabel("time")
pylab.ylabel("steering")
pylab.plot(y_gear, 'b')





mpl.rcParams['legend.fontsize'] = 10

fig = plt.figure()
plt.subplot(121)
ax = Axes3D(fig) 

datax =[]
datay = []
dataz = []
for s in model.position:
	x=  float (s.x)
	y = float (s.y)
	z = float (s.z)
	datax.append(x)
	datay.append(y)
	dataz.append(z)

z = dataz
x = datax
y = datay

ax.plot(x, y, z, label='distance')
ax.legend()

plt.show()


'''

mpl.rcParams['legend.fontsize'] = 10

fig1 = plt2.figure()
ax1 = Axes3D(fig1) 

datax =[]
datay = []
dataz = []
for s in model.acceleration:
	x=  float (s.x)
	y = float (s.y)
	z = float (s.z)
	datax.append(x)
	datay.append(y)
	dataz.append(z)

z = dataz
x = datax
y = datay

ax1.plot(x, y, z, label='acceleration')
ax1.legend()

plt2.show()

'''	
pylab.show()
