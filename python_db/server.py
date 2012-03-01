import socket

class Server:
    def __init__(self,UDP_IP, UDP_PORT):
	self.sock = socket.socket( socket.AF_INET, # Internet
                       socket.SOCK_DGRAM ) # UDP
	self.sock.bind( (UDP_IP,UDP_PORT) )
    
    def receive(self):
	data,addr = self.sock.recvfrom( 4096 ) # buffer size in bytes
	return (data,addr)
 


