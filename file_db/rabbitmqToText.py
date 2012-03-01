#!/usr/bin/env python
import pika

class RabbitmqServer:
    def __init__(self,fileObject):    
        self.queue='simdata'
        self.connection = pika.BlockingConnection(pika.ConnectionParameters(
                                host='localhost'))
        self.channel = self.connection.channel()
        self.channel.queue_declare(queue=self.queue)
        self.i=0
        self.file = fileObject
        self.receive()

    def callback(self,ch, method, properties, body):
        self.i+=1
        print " [x] Received %r" % (body,)
        print self.i
        self.saveData(body)

    def receive(self):
            self.channel.basic_consume(self.callback,
                                          queue=self.queue,
                                          no_ack=True)
            print ' [*] Waiting for messages. To exit press CTRL+C'
            self.channel.start_consuming()



    def saveData(self, data):
        self.file._saveModel(data)