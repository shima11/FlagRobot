from twisted.internet.protocol import Protocol, Factory
from twisted.internet import reactor


class RaspberryLight(Protocol):
	def connectionMade(self):
		self.factory.clients.append(self)
		print "clients are ", self.factory.clients

	def connectionLost(self, reason):
		print "connection lost ", self.factory.clients
		self.factory.clients.remove(self)


	def dataReceived(self, data):
			msg = ""
			print "receive date:" + data
			if (data == "P7H"):
				msg = "Pin 7 is now High"
				print "pin7 high"

			elif (data == "P7L"):
				msg = "Pin 7 is now Low"
				print "pin7 Low"
			print msg

	def message(self, message):
			self.transport.write(message + '\n')

factory = Factory()
factory.protocol = RaspberryLight
factory.clients = []

reactor.listenTCP(7777, factory)
print "RaspberryLight server started"
reactor.run()