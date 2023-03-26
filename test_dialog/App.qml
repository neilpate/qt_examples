
import QtQuick
import QtQuick.Dialogs
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Window {
    width: 400
    height: 400

    visible: true
    title: "MainFrame"

    // Define default Dialog window
    //
    Dialog {
        id: dialog_exit
        title: "Really Exit ?"

        standardButtons: Dialog.Ok | Dialog.Cancel

        anchors.centerIn: parent

        onAccepted: { 
                console.log("OK clicked")
                Qt.callLater(Qt.quit)
        }
        onRejected: console.log("Cancel clicked")
    }

    // start dialog 
    Component.onCompleted: dialog_exit.open()
}

