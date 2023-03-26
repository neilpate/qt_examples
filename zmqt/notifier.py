import sys

#from PyQt6 import QtCore, QtWidgets
from PySide6 import QtCore, QtWidgets
import zmq
import numpy as np


class Widget(QtWidgets.QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)

        self.logedit_1 = QtWidgets.QTextEdit(readOnly=True)
        self.logedit_2 = QtWidgets.QTextEdit(readOnly=True)

        lay = QtWidgets.QHBoxLayout(self)
        lay.addWidget(self.logedit_1)
        lay.addWidget(self.logedit_2)

        context = zmq.Context()
        self.consumer_receiver = context.socket(zmq.PULL)
        self.consumer_receiver.connect("tcp://127.0.0.1:5557")

#        pp = QtCore.QSocketNotifier.Read
        self.read_notifier = QtCore.QSocketNotifier(
            self.consumer_receiver.getsockopt(zmq.FD), QtCore.QSocketNotifier.Read, self
        )
        self.read_notifier.activated.connect(self.on_read_msg)

#    @QtCore.pyqtSlot()
    @QtCore.Slot()
    def on_read_msg(self):
        self.read_notifier.setEnabled(False)
        if self.consumer_receiver.getsockopt(zmq.EVENTS) & zmq.POLLIN:
            while self.consumer_receiver.getsockopt(zmq.EVENTS) & zmq.POLLIN:
                buff = self.consumer_receiver.recv()
                data = np.frombuffer(buff, dtype="float32")
                bandwidth = []
                signals = []
                for i in range(0, len(data), 2):
                    signals.append(data[i])
                    bandwidth.append(data[i + 1])

                for sg, bw in zip(signals, bandwidth):
                    self.logedit_1.append(str(sg))
                    self.logedit_2.append(str(bw))

        self.read_notifier.setEnabled(True)


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    w = Widget()
    w.show()
    sys.exit(app.exec())
