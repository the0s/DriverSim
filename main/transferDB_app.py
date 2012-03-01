import sys 
sys.path.append("/home/the0project/Desktop/ProjectSimulator/python_db")
sys.path.append("C:\Users\The0s\Desktop\Project\python_db")
from db_model import * 
from server import *
from db_save import *
from rabbitmqTomongo import *
   

class TransferDB:
	def __init__(self):
		self.db = SaveDB()
		self.model = Model()
		self.server = None
		self.getUser()

	def getUser(self):  	
		check = raw_input("Played before (y/n): ")
		email_s = raw_input("Enter email: ")
		if check == "y":      	
			user = User.objects(email = email_s).get()
			self.model = Model.objects(driver = user).get()
		elif check == "n":	
			user = self.db._addUser(email_s)
			self.model = Model()
			self.model.driver = user
			self.model.save()


if __name__ == "__main__":
	start = TransferDB()
	start.server = RabbitmqServer(start.db, start.model)
