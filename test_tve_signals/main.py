import os
import sys
from pathlib         import Path
from PySide6.QtCore  import QObject, QUrl, Qt, Signal, Slot
from PySide6.QtGui   import QGuiApplication
from PySide6.QtQuick import QQuickView

# global variables
res  = None

class Backend(QObject):

    updated = Signal(str, arguments=['harold'])

    def update_text(self,str):
        # Pass the text to QML.
        self.updated.emit(str)


def exitMain(view):
    # Deleting the view before it goes out of scope is required to make sure all child QML instances
    # are destroyed in the correct order.
    del view
    sys.exit(res)

def playAction():
    print("Play button clicked")

def stopAction():
    print("Stop button clicked")

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    view = QQuickView()
    qml_file = os.fspath(Path(__file__).resolve().parent / 'qml/main_view.qml')
    view.setSource(QUrl.fromLocalFile(qml_file))
    if view.status() == QQuickView.Error:
        sys.exit(-1)
    print("qml file loaded")
    
    # remove window borders
#    view.setFlags(Qt.FramelessWindowHint)
    
    # connect to default signals
    root = view.rootObject()
    
    # exit when in Dialog 'OK' is clicked
    view.engine().quit.connect(lambda: exitMain(view))

    # execute play action
    button_play = root.findChild(QObject, "button_play")
    button_play.clicked.connect(lambda: playAction())

    # execute stop action
    button_stop = root.findChild(QObject, "button_stop")
    button_stop.clicked.connect(lambda: stopAction())

    # Define our backend object, which we pass to QML.
    backend = Backend()

    root.setProperty('backend', backend)

    # Initial call to trigger first update. Must be after the setProperty to connect signals.
    backend.update_text("NO sunshine")
   
#    root.setProperty('harold', "hello")
    
    print("Signals connected")

    # startup viewer
    view.show()
    res = app.exec()

