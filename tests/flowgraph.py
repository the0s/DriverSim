import numpy
from enthought.	mayavi.mlab import *
import sys
sys.path.append("/home/the0project/Desktop/ProjectSimulator/python_db")
from db_model import * 
import db_connect

def test_flow():
    x, y, z = numpy.mgrid[0:5, 0:5, 0:5]
    r = numpy.sqrt(x**2 + y**2 + z**4)
    u = y*numpy.sin(r)/r
    v = -x*numpy.sin(r)/r
    w = numpy.zeros_like(z)
    obj = flow(u, v, w)
    return obj


def test_quiver3d():
    x, y, z = numpy.mgrid[-2:3, -2:3, -2:3]
    r = numpy.sqrt(x**2 + y**2 + z**4)
    u = y*numpy.sin(r)/(r+0.001)
    v = -x*numpy.sin(r)/(r+0.001)
    w = numpy.zeros_like(z)
    obj = quiver3d(x, y, z, u, v, w, line_width=3, scale_factor=1)
    return obj


def test():
	email_s = raw_input("Enter Email: ")
	user = User.objects(email = email_s).get()
	model = Model.objects(driver = user).get()
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

	w = dataz
	u = datax
	v = datay

    	obj = quiver3d(x, y, z, u, v, w, line_width=3, scale_factor=1)
    	return obj

if __name__=="__main__":
	test_flow()
	test_quiver3d()
	#test()
