#!/usr/bin/env python
import pika


class RabbitmqServer:
    def __init__(self,client):    
        self.queue='simdata'
        self.connection = pika.BlockingConnection(pika.ConnectionParameters(
                                host='localhost'))
        self.channel = self.connection.channel()
        self.channel.queue_declare(queue=self.queue)
        self.i=0
        self.client = client
        self.receive()

    def callback(self,ch, method, properties, body):
        self.i+=1
        print " [x] Received %r" % (body,)
        print self.i
        self.sentData(body)

    def receive(self):
            self.channel.basic_consume(self.callback,
                                          queue=self.queue,
                                          no_ack=True)
            print ' [*] Waiting for messages. To exit press CTRL+C'
            self.channel.start_consuming()



    def sentData(self, data):
        self.client._sentModel(data)