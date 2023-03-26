import sys
import asyncio

from PyQt6 import QtCore, QtWidgets

# from asyncqt import QEventLoop, asyncClose
from qasync import QEventLoop, asyncClose

import zmq
from zmq.asyncio import Context, Poller

import numpy as np


class Widget(QtWidgets.QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)

        self.logedit_1 = QtWidgets.QTextEdit(readOnly=True)
        self.logedit_2 = QtWidgets.QTextEdit(readOnly=True)

        lay = QtWidgets.QHBoxLayout(self)
        lay.addWidget(self.logedit_1)
        lay.addWidget(self.logedit_2)

        context = Context()
        self.consumer_receiver = context.socket(zmq.PULL)
        self.consumer_receiver.connect("tcp://127.0.0.1:5557")

        self.poller = Poller()
        self.poller.register(self.consumer_receiver, zmq.POLLIN)

    async def start_consumer(self):
        while True:
            events = await self.poller.poll()
            if self.consumer_receiver in dict(events):
                buff = await self.consumer_receiver.recv()
                data = np.frombuffer(buff, dtype="float32")
                bandwidth = []
                signals = []
                for i in range(0, len(data), 2):
                    signals.append(data[i])
                    bandwidth.append(data[i + 1])

                for sg, bw in zip(signals, bandwidth):
                    self.logedit_1.append(str(sg))
                    self.logedit_2.append(str(bw))

    @asyncClose
    async def closeEvent(self, event):
        self.consumer_receiver.close()


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    loop = QEventLoop(app)
    asyncio.set_event_loop(loop)
    w = Widget()
    w.show()
    try:
        loop.run_until_complete(w.start_consumer())
    except asyncio.CancelledError:
        print("start_consumer is cancelled now")
    finally:
        loop.close()
