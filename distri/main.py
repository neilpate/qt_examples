import os
import sys
from pathlib         import Path
from PySide6.QtCore  import QObject, QUrl, Qt, Signal, Slot
from PySide6.QtGui   import QGuiApplication
from PySide6.QtQuick import QQuickView

from constants import *

from backend import backendSignals, backendButtons, backendInputText

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    view = QQuickView()
    qml_file = os.fspath(Path(__file__).resolve().parent / 'qml/Screen_default.qml')
    view.setSource(QUrl.fromLocalFile(qml_file))
    if view.status() == QQuickView.Error:
        print("MAIN - qml file NOT loaded")
        sys.exit(-1)
    print("MAIN - qml file loaded")
    
    # remove window borders
#    view.setFlags(Qt.FramelessWindowHint)
    
    # connect to default signals
    root = view.rootObject()
    
    buttons = backendButtons(view= view, root= root)
    print("MAIN - Buttons have Python connect")

    # Define our backend signal objects, which we pass to QML.
    signals = backendSignals()
    root.setProperty('backend', signals)
    print("MAIN - Signals have Python connect")

    textInput = backendInputText(root= root, localBackend= signals)
    print("MAIN - Text inputs have Python connect")

    # startup viewer
    view.show()
    res = app.exec()

