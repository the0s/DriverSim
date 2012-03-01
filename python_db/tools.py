from mongoengine import *

class Tools: #Only for simulator
    def __init__(self):
	self.speed = 0
	self.distance_previous = 0
	self.distace = 0

    def _inTrack(self, data):
	self.speed = data[0]
	self.distance = data[5]
	if self.distance == self.distance_previous:
		return 1
	else: 
		self.distance_previous = self.distance
		return 0
	
	

