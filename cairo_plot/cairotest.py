import CairoPlot
import cairo

data = [1,3,3,2,4,5,6,7,12,7,3,1,2,3,4,6,7,8]

CairoPlot.dot_line_plot('example.png', data, 700, 700, axis=True, grid=True, dots='true')
