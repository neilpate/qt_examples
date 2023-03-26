import sys

from PySide6.QtGui  import QGuiApplication
from PySide6.QtQml  import QQmlApplicationEngine, qmlRegisterType
from PySide6.QtCore import QTimer, QObject, Signal
from main_window    import MainWindow

if __name__ == '__main__':
    # Register module
    qmlRegisterType(MainWindow, "Main", 1, 0, "MainWindow")

    # Set application window
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    main= MainWindow()

    # Get context
    engine.rootContext().setContextProperty("main", main)

    # Load QML window
#   engine.load('content/App.qml')
#   engine.load('App.qml')
    engine.load('main.qml')
#   engine.load('DIALOG_exit.qml')

    # Executef
    engine.quit.connect(app.quit)

    sys.exit(app.exec())
