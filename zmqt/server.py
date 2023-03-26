import random
import time

import zmq

import numpy as np

import logging

logging.basicConfig(level=logging.DEBUG)

context = zmq.Context()
socket = context.socket(zmq.PUSH)
socket.bind("tcp://*:5557")


while True:
    d = []
    start = random.randint(0, 10)
    for i in range(10):
        x = start + i
        d.append(x)
        d.append(x ** 2)
    arr = np.array(d, dtype="float32")
    buf = arr.tobytes()
    logging.debug(buf)
    socket.send(buf)
    time.sleep(0.1)
