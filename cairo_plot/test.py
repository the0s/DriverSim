
import pylab
import random
import time


def main():
    pylab.ion()       # Turn on interactive mode.
    pylab.hold(False) # Clear the plot before adding new data.
    x = range(10)
    for i in range(10):
        y = random.sample(xrange(100), 10)
        pylab.plot(x, y)
	pylab.show()
        time.sleep(1)
	pylab.hide()

if __name__ == '__main__':
    main()
'''
from pylab import *

t = arange(0.0, 2.0, 0.01)
s = sin(2*pi*t)
plot(t, s, linewidth=1.0)

xlabel('time (s)')
ylabel('voltage (mV)')
title('About as simple as it gets, folks')
grid(True)
show()
'''
