import os
import sys
from pathlib         import Path
from PySide6.QtCore  import QObject, QUrl, Qt, Signal, Slot
from PySide6.QtGui   import QGuiApplication
from PySide6.QtQuick import QQuickView

# global variables
res  = None

from backend import backendSignals, backendButtons, backendInputText

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    view = QQuickView()
#    qml_file = os.fspath(Path(__file__).resolve().parent / 'qml/main_view.qml')
    qml_file = os.fspath(Path(__file__).resolve().parent / 'qml/Screen_default.qml')
    view.setSource(QUrl.fromLocalFile(qml_file))
    if view.status() == QQuickView.Error:
        print("qml file -not- loaded")
        sys.exit(-1)
    print("qml file loaded")
    
    # remove window borders
#    view.setFlags(Qt.FramelessWindowHint)
    
    # connect to default signals
    root = view.rootObject()
    
    buttons = backendButtons(view= view, root= root)
    print("Buttons connected")

    # Define our backend signal objects, which we pass to QML.
    signals = backendSignals()
    root.setProperty('backend', signals)
    print("Signals connected")

    textInput = backendInputText(root= root, localBackend= signals)
    print("Text inputs connected")

    # startup viewer
    view.show()
    res = app.exec()

