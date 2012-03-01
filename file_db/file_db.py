import sys
from tools import *

class toFile:
	def __init__(self, filename):
		self.out= open(filename + '.txt', 'a')
		self.tools = Tools()		
	#def infile(self):	
	#	x= self.inf.read()
	#	x= x.split('\n')	
	#	print "Previous round opponent: ", x[0]
	#	return x[0]
		#self.inf.seek(0)
		#print self.inf.read()

	def outfile(self, text):	
		self.out.write(text)	

	def close(self):
		self.out.close()
		
	def _saveModel(self,data):
		data = data.split(';')
		check = self.tools._inTrack(data)
		self.outfile(str(check))
		self.outfile(" ")
		for d in data:
			self.outfile(d)
			self.outfile(" ")
		self.outfile('\n')
			



