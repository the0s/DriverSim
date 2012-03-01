/*
* Author: Theo
* Date: 10/01/2012
 */

#include "PracticalSocket.h" // For UDPSocket and SocketException
#include <iostream>          // For cout and cerr
#include <cstdlib>           // For atoi()
#include "RacerData.h"
#include <sstream>

const int ECHOMAX = 4096;     // Longest string to echo

void screen_out(RDashData echoBuffer){
    cout << "Time " << echoBuffer.time <<endl;
    cout << "Speed " << echoBuffer.vehSpeed * 3.63 <<endl;
    cout << "Gear " << echoBuffer.gearEngaged <<endl;
    cout << "rpm " << echoBuffer.rpm << "  state "<<echoBuffer.engineState<<endl;
    cout << "distance " << echoBuffer.lapDistance <<endl;
    cout << "car " << echoBuffer.carName <<endl;
    cout << "GFORCE lat"<<echoBuffer.gforceLat<< "long"<<echoBuffer.gforceLon<<endl;
    cout << "Pos x "<<echoBuffer.pos.x<< "y "<<echoBuffer.pos.y<< " z "<< echoBuffer.pos.z<<endl;
    cout <<echoBuffer.steering<< "  "<<echoBuffer.throttle<<"  "<<echoBuffer.brakes<<"  "<<echoBuffer.clutch<<"   "<<echoBuffer.handBrakes<<endl;
    cout << "Acc x "<<echoBuffer.acc.x<< "y "<<echoBuffer.acc.y<< " z "<< echoBuffer.acc.z<<endl;
    cout<<"steering "<<echoBuffer.steering<<endl;
    cout<<endl;
}

int main(int argc, char *argv[]) {

  if (argc != 4) {                  // Test for correct number of parameters
    cerr << "Usage: " << argv[0] << " <Game Port> <Destination IP> <Destination Port> \n" 
			<<"Default: "<< argv[0] << " 7010 192.168.1.98 7011"<<endl;
    exit(1);
  }
  int no = 0;
  unsigned short echoServPort = atoi(argv[1]);     
  string destAddr = argv[2];
  unsigned short destPort = atoi(argv[3]); 	


  try {
    UDPSocket sock(echoServPort);                	
    RDashData echoBuffer[ECHOMAX];
    int recvMsgSize;                  // Size of received message
    string sourceAddress;             // Address of datagram source
    unsigned short sourcePort;        // Port of datagram source
    
	for (;;) {  // Run forever
		// Block until receive message from a client
		recvMsgSize = sock.recvFrom(echoBuffer, ECHOMAX, sourceAddress, sourcePort);
		cout << "Received packet from " << sourceAddress << ":" << sourcePort <<endl;

		if ((echoBuffer[0].rpm != 0) && (echoBuffer[0].engineState != 0))
		{  

			screen_out(echoBuffer[0]);
			stringstream ss (stringstream::in | stringstream::out);
			ss<<echoBuffer[0].vehSpeed * 3.63<<";"
				<<echoBuffer[0].brakes<<";"
				<<echoBuffer[0].throttle<<";"
				<<echoBuffer[0].clutch<<";"
				<<echoBuffer[0].gearEngaged<<";"
				<<echoBuffer[0].lapDistance<<";"
				<<echoBuffer[0].time<<";"
				<<echoBuffer[0].pos.x<<";"
				<<echoBuffer[0].pos.y<<";"
				<<echoBuffer[0].pos.z<<";"
				<<echoBuffer[0].acc.x<<";"
				<<echoBuffer[0].acc.y<<";"
				<<echoBuffer[0].acc.z<<";"
				<<echoBuffer[0].steering<<";"
				<<echoBuffer[0].gforceLat<<";"
				<<echoBuffer[0].gforceLon<<";"
				<<echoBuffer[0].handBrakes<<";"
				<<echoBuffer[0].lapTime;
				/*<<";"
				<<echoBuffer[0].carName<<";"
				<<echoBuffer[0].trackName;
				*/
			string message = ss.str();
			cout<<message<<endl;
			char* s = new char[message.size()];
			 
			for (int i=0; i<message.size(); i++){
				s[i] = message[i];
			}					
					sock.sendTo(s, message.size(), destAddr, destPort);	
				cout<<"SEND TO: " << destAddr<<":"<<destPort<<endl;
				cout<<++no<<endl;	
				}
			}
	  } catch (SocketException &e) {
		cerr << e.what() << endl;
		exit(1);
	  }
	return 0;	
}


