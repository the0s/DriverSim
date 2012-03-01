#!/usr/bin/env python
import pika

class RabbitmqClient:
	def __init__(self):
		self.queue='simdata'
		self.connection = pika.BlockingConnection(pika.ConnectionParameters(
        						host='localhost'))
		self.channel = self.connection.channel()
		self.channel.queue_declare(queue=self.queue)

	def send(self, data):
		self.channel.basic_publish(exchange='',
                      			routing_key=self.queue,
                      			body=data)	

	def close(self):	
		self.connection.close()
