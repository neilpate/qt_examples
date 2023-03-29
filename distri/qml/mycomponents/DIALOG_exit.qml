
import QtQuick 
import QtQuick.Controls

Dialog {
    id: dialog_exit
    title: "Really EXIT ?"

    standardButtons: Dialog.Ok | Dialog.Cancel

    onAccepted: { 
            console.log("OK clicked")
            Qt.callLater(Qt.quit)
    }
    onRejected: console.log("Cancel EXIT clicked")
}



