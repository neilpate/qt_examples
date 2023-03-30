import zmq
import time

from constants import *

# Socket to talk to server
zmqContext = zmq.Context()
zmqSocket = zmqContext.socket(zmq.REP)

print("Collecting requests for authentication")
zmqSocket.bind("tcp://{}:{}".format(host, port))

while True:
    # wait for request of client
    inputString = zmqSocket.recv_string() # blocking
    topic, name = inputString.split(" ")

    if name in authorizedPersons:
        response = "Approved"
    else: 
        response = "Rejected"
        
    print("AUTH - Requested Authorization for", name, "is", response)
    
    # send authorization status to client
    zmqSocket.send_string(response)

