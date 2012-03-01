#!/usr/bin/env python
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters(
        host='localhost'))
channel = connection.channel()

channel.queue_declare(queue='hello')
i=0
while(True):
	channel.basic_publish(exchange='',
                      routing_key='hello',
                      body='Hello World!'+str(i))
	i+=1


print " [x] Sent 'Hello World!'"
connection.close()

