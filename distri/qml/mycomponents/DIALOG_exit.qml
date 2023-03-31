
import QtQuick 
import QtQuick.Controls

Dialog {
    id: dialog_exit
    title: "Really EXIT ?"

    standardButtons: Dialog.Ok | Dialog.Cancel

    onAccepted: { 
            console.log("GUI - Dialog OK clicked, perform EXIT")
            Qt.callLater(Qt.quit)
    }
    onRejected: console.log("GUI - Dialog EXIT clicked, cancel EXIT")
}



