import sys 
sys.path.append("/home/the0project/Desktop/ProjectSimulator/python_db")
sys.path.append("C:\Users\The0s\Desktop\Project Files\Project\workspace\DriverSim\python_db")
from db_model import * 
from server import *
from UDPtoRabbitmq import *

if __name__ == "__main__":
	UDP_IP = "192.168.1.98"
	UDP_PORT= 7011
	

	if (len(sys.argv) != 3):
		print "Usage: ",sys.argv[0]," <Client IP> <Client Port> "
		print "Default: ",sys.argv[0]," 192.168.1.98 7011"
		raise SystemExit
	
	UDP_IP = sys.argv[1]
	UDP_PORT = int(sys.argv[2])
	
	sock = Server(UDP_IP, UDP_PORT)
		
	i = 1
	client = RabbitmqClient()
	while True:
		try:
			#data structure = (Speed;brakes;gas;clutch;gear;distance;time)
			data, addr = sock.receive()
			if i == 1 :
				print "Received Message From: ", addr[0],":",addr[1]
			print i
			i+=1
			#print data
			#print len(data)
			client.send(data)
 		except (KeyboardInterrupt, SystemExit):
        		raise SystemExit
		
		

