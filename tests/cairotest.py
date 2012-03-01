import sys
sys.path.append("/home/the0project/Desktop/ProjectSimulator/cairo_plot")
sys.path.append("/home/the0project/Desktop/ProjectSimulator/python_db")
import CairoPlot
from db_model import * 
import db_connect
import cairo

user = User.objects(email = "email@lol.com").get()
model = Model.objects(driver = user).get()
data =[]
for s in model.speed:
	x=  float (s.value)
	data.append(x)

CairoPlot.dot_line_plot('example.png', data, 2000, 2000, axis=True, grid=True, dots='true')
