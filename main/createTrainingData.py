import sys 
sys.path.append("/home/the0project/Desktop/ProjectSimulator/python_db")
sys.path.append("C:\Users\The0s\Desktop\Project\python_db")
from db_model import * 
from db_connect import *

class CreateData:
    def __init__(self):
	self.user = None
	self.model = None
	self.data = None
	self.checkUser()
	self.block_size= None


    def checkUser(self):
	try:
		email_s = raw_input("Enter email: ")     	
		self.user = User.objects(email = email_s).get()
		self.model = Model.objects(driver = self.user).get()
 	except (KeyboardInterrupt, SystemExit):
        	raise	
	except :
		print "ERROR: Either User or Model Does not exist"
		self.checkUser()	

    def create_model(self): 
	self.data = TrainingData()
	self.data.driver = self.user
	self.data.save()
	

    def find_model(self):
	try:	
		self.data = TrainingData(driver = self.user)
 	except (KeyboardInterrupt, SystemExit):
        	raise
	except:
		print "Data for that user does not exist, creating one..."
		self.create()
		
    def add(self, block):
	self.data.add(block)	
    '''
    def digging(self):
	i,j = 0;
	d1,d2 = Data()
	for t in xrange(0,int(len(self.model.speed) / self.block_size)):
		if i == 0 :
			d1 = Data()
		if j == 0:
			d2 = Data()
		
		d1.add_value(t)
		
		d2.add_value(t)

		print self.model.speed[t].time
		i+=1
		j+=0
    '''

    def getSize(self):
	try:
		length = float(raw_input("Block size in seconds: "))
		length *= 1000
		time1 = self.model.speed[10].time
		time2 = self.model.speed[19].time
		actual_length = (time2-time1)/10.0
		if actual_length > length:
			print "Size is too small for data"
			self.getSize()
		else:
			self.block_size = int(length/actual_length)
			print "This will have ", self.block_size, " values per block"
			if raw_input("Is that OK? (y/n) :") == "n":
				self.getSize()
 	except (KeyboardInterrupt, SystemExit):
        	raise
	except:
		print "Try a number please"
		self.getSize()

if __name__ == "__main__":
	start = CreateData()
	start.getSize()	
	#start.find_model()
	#start.digging()

