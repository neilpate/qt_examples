import sys
import threading

from PyQt6 import QtCore, QtWidgets
import zmq
import numpy as np


class ZMQReceiver(QtCore.QObject):
    dataChanged = QtCore.pyqtSignal(bytes)

    def start(self):
        threading.Thread(target=self._execute, daemon=True).start()

    def _execute(self):
        context = zmq.Context()
        consumer_receiver = context.socket(zmq.PULL)
        consumer_receiver.connect("tcp://127.0.0.1:5557")
        while True:
            buff = consumer_receiver.recv()
            self.dataChanged.emit(buff)


class Widget(QtWidgets.QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)

        self.logedit_1 = QtWidgets.QTextEdit(readOnly=True)
        self.logedit_2 = QtWidgets.QTextEdit(readOnly=True)

        lay = QtWidgets.QHBoxLayout(self)
        lay.addWidget(self.logedit_1)
        lay.addWidget(self.logedit_2)

        zmq_receiver = ZMQReceiver(self)
        zmq_receiver.dataChanged.connect(self.on_data_changed)
        zmq_receiver.start()

    @QtCore.pyqtSlot(bytes)
    def on_data_changed(self, buff):
        data = np.frombuffer(buff, dtype="float32")
        bandwidth = []
        signals = []
        for i in range(0, len(data), 2):
            signals.append(data[i])
            bandwidth.append(data[i + 1])

        for sg, bw in zip(signals, bandwidth):
            self.logedit_1.append(str(sg))
            self.logedit_2.append(str(bw))


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    w = Widget()
    w.show()
    sys.exit(app.exec())
