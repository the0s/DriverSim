from db_model import * 
from server import *
from db_save import *
import sys

if __name__ == "__main__":
	UDP_IP = "192.168.1.98"
	UDP_PORT= 7011
	sock = Server(UDP_IP, UDP_PORT)
	
	if (len(sys.argv) > 2):
		UDP_IP = argv[1]
		UDP_PORT = argv[2]

      	
	check = raw_input("Played before (y/n): ")
	email_s = raw_input("Enter email: ")
	if check == "y":      	
		user = User.objects(email = email_s).get()
		model = Model.objects(driver = user).get()
	elif check == "n":	
		user = SaveDB()._addUser(email_s)
		model = Model()
		model.driver = user
		model.save()
	
	saveDB = SaveDB()
	i = 1
	while True:
		#data structure = (Speed;brakes;gas;clutch;gear;distance;time)
		data, addr = sock.receive()
		if i == 1 :
			print "Received Message From: ", addr[0],":",addr[1]
		print i
		i+=1
		print data
		print len(data)
		#data = data.split(';')
		saveDB._saveModel(data, model)


