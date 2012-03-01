from db_connect import *
from mongoengine import *
from db_model import * 
from tools import *

class SaveDB:
	def __init__(self):
		self.tools = Tools()

	def _saveModel(self,data,model):
		data = data.split(';')
		check = self.tools._inTrack(data)
		model.add_data(data, check)

		
	def _addUser(self, email):
		user = User()
		user.email = email
		user.first_name = raw_input("Enter Firstname: ")		
		user.last_name = raw_input("Enter Surname: ")
		user.gender = raw_input("Enter Gender (m/f): ")
		user.save()
		return user


	
			




    
