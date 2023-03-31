import os
import sys
from pathlib         import Path
from PySide6.QtCore  import QObject, QUrl, Qt, Signal, Slot
from PySide6.QtGui   import QGuiApplication
from PySide6.QtQuick import QQuickView
import zmq

from constants import *

# --------------------------------------------------------------------------------------
class backendSignals(QObject):

    update_operatorAuthorizedText  = Signal(str, arguments=['operatorAuthorizedText'])
    update_operatorAuthorizedColor = Signal(str, arguments=['operatorAuthorizedColor'])
    update_operatorNameInputText   = Signal(str, arguments=['operatorNameInputText'])
    
    def update_authorizationStatus(self, txt, clr, status):
        # Pass the text to QML.
        self.update_operatorAuthorizedText.emit(txt)
        self.update_operatorAuthorizedColor.emit(clr)
        if not(status): # clear when not authorized
            print("GUI - Set default text in operator input")
            self.update_operatorNameInputText.emit("--")

# --------------------------------------------------------------------------------------
class backendButtons(QObject):

    def __init__(self, root, view):
        self.root = root
        self.view = view
        
       # execute play action
        button_play = self.root.findChild(QObject, "button_play")
        button_play.clicked.connect(lambda: backendButtons.playAction(self.root))

        # execute stop action
        button_stop = self.root.findChild(QObject, "button_stop")
        button_stop.clicked.connect(lambda: backendButtons.stopAction())

        # exit when in Dialog 'OK' is clicked
        self.view.engine().quit.connect(lambda: backendButtons.exitMain(self.view))

    def exitMain(view):
        # Deleting the view before it goes out of scope is required to make sure all child QML instances
        # are destroyed in the correct order.
        del view
        sys.exit(res)

    def playAction(root):
        print("GUI - Play button clicked")
        authorizationApproved = root.property('authorizationApproved')

        if authorizationApproved:
            print("GUI - Play function authorized")
        else:
            print("GUI - Play function NOT authorized")

    def stopAction():
        print("GUI - Stop button clicked")

# --------------------------------------------------------------------------------------

class backendInputText(QObject):

    def __init__(self, root, localBackend):

        # setup as server
        self.zmqContext = zmq.Context()
        self.zmqSocket = self.zmqContext.socket(zmq.REQ)
        self.zmqSocket.connect("tcp://{}:{}".format(host, port))

        # execute name handling action
        operator_name = root.findChild(QObject, "operatorNameInput")
        operator_name.accepted.connect(lambda: backendInputText.nameAction(operator_name.getText(0,100), localBackend, self.zmqSocket, root))
         
    # check authorization and update GUI
    def nameAction(name, backend, socket, root):

        print("GUI - Requesting authorization of operator :", name)

        # Request authorization
        request = "AUTH " + name
        socket.send_string(request)
        # wait for reply
        authorized = socket.recv_string()  # blocking -> need to become more reliable
        print("GUI - Received authorization status :", authorized)

        if authorized == "Approved" :
            print("GUI - Received authorization")
            authorizationApproved = True
            backend.update_authorizationStatus("Authorized", "green", True)
        else:
            print("GUI - NOT received authorization")
            authorizationApproved = False
            backend.update_authorizationStatus("Not Authorized", "red", False)

        root.setProperty('authorizationApproved', authorizationApproved)


