import socket
import pickle
UDP_IP="192.168.1.98"
UDP_PORT=7011
MESSAGE="Testing Database"
print "UDP target IP:", UDP_IP
print "UDP target port:", UDP_PORT
print "message:", MESSAGE
 

sock = socket.socket( socket.AF_INET, # Internet
                       socket.SOCK_DGRAM ) # UDP
#sock.sendto( pickle.dumps(MESSAGE), (UDP_IP, UDP_PORT) )
#float speed, float brake, float gas, float clutch, int gear, int distance, int time, float x, float y, float z, float ax, float ay, float az, float steering
for x in range(10,2000):
	MESSAGE = str(x+10.5)+";"+str(x/10.3)+";"+str(x-1/10.2)+";"+str(x-2/10.2)+";"+str(x)+";"+str(x+1)+";"+str(x)+";"+str(x+5.2)+";"+str(x+6.2)+";"+str(x+7.1)+";"+str(x+8.3)+";"+str(x+9.4)+";"+str(x+10.4)+";"+str(x+9.4)
	print MESSAGE
	sock.sendto( MESSAGE, (UDP_IP, UDP_PORT) )
