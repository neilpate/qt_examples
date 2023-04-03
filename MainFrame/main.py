import sys

from pathlib                  import Path

from PySide6.QtGui            import Qt, QGuiApplication
from PySide6.QtQml            import QQmlApplicationEngine, qmlRegisterType
from PySide6.QtCore           import QTimer, QObject, Signal, QUrl
from PySide6.QtQuickControls2 import QQuickStyle

from main_window              import MainWindow


def main():

    # Retreive full path
    appdir = Path(__file__).parent
    qml = str(appdir.joinpath('content/App.qml'))

    # Set application style
    app = QGuiApplication(sys.argv)
#    app.setAttribute(Qt.AA_EnableHighDpiScaling)  # depreciated
#    QQuickStyle.setFallbackStyle("Basic")
#    QQuickStyle.setStyle("Universal")
    
    # Setup engine
    engine = QQmlApplicationEngine(parent=app)
    importPath = str(appdir.joinpath('imports/MainFrame'))
    engine.addImportPath(importPath)
    print("\nAdding import path : ",importPath)
    print("\nFull import path : ",engine.importPathList())

    # Register python module for inclusion to Qt
    qmlRegisterType(MainWindow, "mainWindow", 1, 0, "MainWindow")

    # Load QML
    url = QUrl.fromLocalFile(qml)
    print("\nLoading qml : ", qml)
    engine.load(url)

    if not engine.rootObjects():
        print("\n")
        sys.exit(1)
    else:
        print("\nLoaded")

    # connect to Window 'Quit' signal and quit accordingly
    engine.quit.connect(app.quit)

    # Execute
    print("\nStart execution\n")
    sys.exit(app.exec())


if __name__ == '__main__':
    main()

