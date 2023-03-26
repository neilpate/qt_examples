from PySide6.QtGui  import QGuiApplication
from PySide6.QtQml  import QQmlApplicationEngine
from PySide6.QtCore import QTimer, QObject, Signal

class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

#    text_result = Signal(str, arguments=['test_slot'])
#
#    @Slot(str)
#    def test_slot(self, string):
#        print(string)
#        self.textResult.eit(string)
