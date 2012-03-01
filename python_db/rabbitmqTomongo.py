#!/usr/bin/env python
import pika

class RabbitmqServer:
	def __init__(self,db,model):	
		self.queue='simdata'
		self.connection = pika.BlockingConnection(pika.ConnectionParameters(
        						host='localhost'))
		self.channel = self.connection.channel()
		self.channel.queue_declare(queue=self.queue)
		self.i=0
		self.db = db
		self.model = model
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
		self.db._saveModel(data, self.model)
		
		

