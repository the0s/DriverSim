server: c_server.o PracticalSocket.o 
	g++ -o cserver c_Server.o PracticalSocket.o

c_server.o: c_Server.cpp RacerData.h
	g++ -c c_Server.cpp

PracticalSocket.o: PracticalSocket.cpp PracticalSocket.h
	g++ -c PracticalSocket.cpp

clean:
	rm test *.o
