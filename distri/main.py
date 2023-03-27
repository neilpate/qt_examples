import os
import sys
from pathlib         import Path
from PySide6.QtCore  import QObject, QUrl, Qt, Signal, Slot
from PySide6.QtGui   import QGuiApplication
from PySide6.QtQuick import QQuickView

# global variables
res  = None

class Backend(QObject):

    update_operatorAuthorizedText  = Signal(str, arguments=['operatorAuthorizedText'])
    update_operatorAuthorizedColor = Signal(str, arguments=['operatorAuthorizedColor'])
    update_operatorNameInputText   = Signal(str, arguments=['operatorNameInputText'])
    
    def update_authorizationStatus(self, txt, clr, status):
        # Pass the text to QML.
        self.update_operatorAuthorizedText.emit(txt)
        self.update_operatorAuthorizedColor.emit(clr)
        print("status :", status)
        if not(status): # clear when not authorized
            print("to update text")
            self.update_operatorNameInputText.emit(" ")


def exitMain(view):
    # Deleting the view before it goes out of scope is required to make sure all child QML instances
    # are destroyed in the correct order.
    del view
    sys.exit(res)

def playAction():
    print("Play button clicked")

def stopAction():
    print("Stop button clicked")

def nameAction(str):
    print("Operator name received: ",  str)
    if checkAuthorization(str) :
        print("Authorized")
        backend.update_authorizationStatus("Authorized", "green", True)
    else:
        print("Not authorized")
        backend.update_authorizationStatus("Not Authorized", "red", False)

# this procedure is to be somewhere else in the system
def checkAuthorization(str):
    if str == "Harold" :
        return True
    else:
        return False
    

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

    # execute stop action
    operator_name = root.findChild(QObject, "operatorNameInput")
    operator_name.accepted.connect(lambda: nameAction(operator_name.getText(0,100)))

    # Define our backend object, which we pass to QML.
    backend = Backend()

    root.setProperty('backend', backend)

    # Initial call to trigger first update. Must be after the setProperty to connect signals.
#    backend.update_text("NO sunshine")
   
    print("Signals connected")

    # startup viewer
    view.show()
    res = app.exec()

