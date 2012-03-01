import datetime
from mongoengine import *


class User(Document):
	meta={"collection" : "Users",
	      "indexes":[
			"email"
			]}

	email = EmailField(required = True, unique = True)
	first_name = StringField(required = True)
	last_name = StringField(required = True)
	gender = StringField(required = False, default = "u")


class Car(Document):
	name = StringField(required = True, unique = True)

class Track(Document):
	name = StringField(required = True, unique = True)


class Sensor(EmbeddedDocument):
	time = IntField(required= False) #tRUE

class FloatSensor(Sensor):
	value = DecimalField(required = True, default=0.0) #TZE TOUTO

	def add(self, time, value):
		self.time = time
		self.value = value
		return self
		

class IntegerSensor(Sensor):
	value = IntField(required = True, default = 0)
	def add(self, time, value):
		self.time = time
		self.value = value
		return self


class BooleanSensor(Sensor):
	value = BooleanField(required = True, default = 0) #SASTO GMT SHISTON
	def add(self, time, value):
		self.time = time
		self.value = value
		return self


class Position3DSensor(Sensor):
	x = DecimalField(required = True, default=0.0)
	y = DecimalField(required = True, default=0.0)
	z = DecimalField(required = True, default=0.0)
	def add(self, time, x,y,z):
		self.time = time
		self.x = x
		self.y = y
		self.z = z
		return self


class Model(Document): 
	meta={"collection" : "Models",
	      "indexes":[
			"driver"
			]}
	driver = ReferenceField(User)
	track = ReferenceField(Track)
	car = ReferenceField(Car)
	created = DateTimeField(required = True, default = datetime.datetime.utcnow)
	steering = ListField(EmbeddedDocumentField(FloatSensor), default = list)
	gas = ListField(EmbeddedDocumentField(FloatSensor), default = list)
	brake = ListField(EmbeddedDocumentField(FloatSensor), default = list)
	clutch = ListField(EmbeddedDocumentField(FloatSensor), default = list)
	gear = ListField(EmbeddedDocumentField(IntegerSensor), default = list)
	speed = ListField(EmbeddedDocumentField(FloatSensor), default = list)
	intrack = ListField(EmbeddedDocumentField(IntegerSensor), default = list)
	distance = ListField(EmbeddedDocumentField(FloatSensor), default = list)
	position = ListField(EmbeddedDocumentField(Position3DSensor),default = list)
	acceleration = ListField(EmbeddedDocumentField(Position3DSensor),default = list)
	
	def add_data(self,data,in_track): #Speed,brakes,gas,clutch,gear,distance,time, x, y ,z
		time = data[6]
		self.speed.append(FloatSensor().add(time, data[0]))
		self.brake.append(FloatSensor().add(time, data[1]))
		self.gas.append(FloatSensor().add(time, data[2]))
		self.clutch.append(FloatSensor().add(time, data[3]))
		self.gear.append(IntegerSensor().add(time, data[4]))
		self.intrack.append(IntegerSensor().add(time, in_track))	
		self.distance.append(FloatSensor().add(time, data[5]))
		self.position.append(Position3DSensor().add(time,data[7],data[8],data[9]))
		self.acceleration.append(Position3DSensor().add(time,data[10],data[11],data[12]))
		
		self.steering.append(FloatSensor().add(time, data[13]))
		self.save()
		
		
	
	'''
	def add_data(self,data,in_track): #Speed,brakes,gas,clutch,gear,distance,time, x, y ,z, x-acc, y-acc,z-acc,steering
		speed = FloatSensor()
		brake = FloatSensor()
		steering = FloatSensor()
		gas = FloatSensor()
		clutch = FloatSensor()
		gear = IntegerSensor()
		intrack = IntegerSensor()#tzetouto
		distance = FloatSensor()
		position = Position3DSensor() #tzetouto
		acc3d = Position3DSensor() #tzetouto

		time = data[6]

		speed.value = data[0]
		speed.time = time
		self.speed.append(speed)
		
		brake.value = data[1]
		brake.time = time
		self.brake.append(brake)

		gas.value = data[2]
		gas.time = time
		self.gas.append(gas)

		clutch.value = data[3]
		clutch.time = time
		self.clutch.append(clutch)

		gear.value = data[4]
		gear.time = time
		self.gear.append(gear)

		intrack.value = in_track
		intrack.time = time
		self.intrack.append(intrack)	
		
		distance.value= data[5]
		distance.time = time
		self.distance.append(distance)

		position.time = time
		position.x = data[7]
		position.y = data[8]
		position.z = data[9]
		self.position.append(position)

		acc3d.time = time
		acc3d.x = data[10]
		acc3d.y = data[11]
		acc3d.z = data[12]
		self.acceleration.append(acc3d)

		steering.value = data[13]
		steering.time = time
		self.steering.append(steering)

		self.save()
	'''



	
class Data(EmbeddedDocument):
	created = DateTimeField(required = True, default = datetime.datetime.utcnow)
	steering = ListField(DecimalField, default = list)
	gas = ListField(DecimalField, default = list)
	brake = ListField(DecimalField, default = list)
	clutch = ListField(DecimalField, default = list)
	gear = ListField(IntField, default = list)
	speed = ListField(DecimalField, default = list)

	intrack = ListField(IntField, default = list)
	distance = ListField(IntField, default = list)
	position = ListField(EmbeddedDocumentField(Position3DSensor),default = list)
	acceleration = ListField(EmbeddedDocumentField(Position3DSensor),default = list)

	'''
	def add(self, data):
		self.steering = data.steering
		self.gas = data.gas
		self.brake = data.brake
		self.clutch = data.clutch
		self.gear = data.gear
		self.speed = data.speed

		self.intrack = data.intrack	
		self.distance = data.distance
		self.position = data.position
		self.acceleration = data.acceleration
		return self
	'''	

				
class TrainingData(Document):
	meta={"collection" : "TrainingModel",
	      "indexes":[
			"driver"
			]}
	driver = ReferenceField(User, unique = True)
	data = ListField(EmbeddedDocumentField(Data), default = list)	

	def add(self, block):
		self.data.append(block)
		self.data.save()
	



