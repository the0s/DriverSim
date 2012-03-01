import threading
from k import *
from t import *
import sys

def exit():
	c= raw_input("c")
	if c == 'c':
		sys.exit()

a=ks()
b=ts()

p = threading.Thread(target=a.k)
q = threading.Thread(target=b.t)
#rr = threading.Thread(target=exit())
#rr.start()
p.start()
q.start()

