from twisted.internet.protocol import Protocol, Factory
from twisted.internet import reactor
import RPi.GPIO as GPIO
import wiringpi2 as wiringpi
import time

wiringpi.wiringPiSetupGpio()
wiringpi.pinMode(18, wiringpi.GPIO.PWM_OUTPUT)
wiringpi.pwmSetMode(wiringpi.GPIO.PWM_MODE_MS)
wiringpi.pwmSetClock(400)
wiringpi.pwmSetRange(1024)

# 速度の調整
duty = 3
unduty = -3
set_time=0.01


class RaspberryLight(Protocol):
	def connectionMade(self):
		self.factory.clients.append(self)

	def connectionLost(self, reason):
		self.factory.clients.remove(self)


	def dataReceived(self, data):
			if (data == "start"):
				print "start"
				# 回転角の調整
				for deg in range(0,171,duty):
					wiringpi.pwmWrite(18, deg/2+910)
					time.sleep(set_time)
				for deg in range(170,-1,unduty):
					wiringpi.pwmWrite(18, deg/2+910)
					time.sleep(set_time)

	def message(self, message):
			self.transport.write(message + '\n')



factory = Factory()
factory.protocol = RaspberryLight
factory.clients = []

reactor.listenTCP(7777, factory)
reactor.run()