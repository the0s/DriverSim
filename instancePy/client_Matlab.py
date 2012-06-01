import sys
import socket
from tools import *
 
 
class toMatlab:
    def __init__(self, port, ip):
        self.port= port
        self.ip= ip
        self.tools = Tools()   
        self.sock =   socket.socket( socket.AF_INET, # Internet
                       socket.SOCK_DGRAM ) # UDP   
    #def infile(self):    
    #    x= self.inf.read()
    #    x= x.split('\n')    
    #    print "Previous round opponent: ", x[0]
    #    return x[0]
        #self.inf.seek(0)
        #print self.inf.read()

        
    def _sentModel(self,data):
        data2 = data.split(';')
        check = self.tools._inTrack(data2)        
        MESSAGE = str(check) + ';' + data
        print MESSAGE
        self.sock.sendto( MESSAGE, (self.ip, int(self.port)) )
        
