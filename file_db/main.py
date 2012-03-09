'''
Created on 18 Feb 2012

@author: The0s
'''

import sys 
sys.path.append("C:\Users\tg108.ee-ms6062\Desktop\project_new\python_db")
from server import *
from rabbitmqToText import *
from file_db import * 

class TransferDB:
    def __init__(self):
        #self.db = SaveDB()
        #self.model = Model()
        self.server = None
        #self.getUser()

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
    name = raw_input("Enter Name: ")
    file = toFile(name)
    start.server = RabbitmqServer(file)