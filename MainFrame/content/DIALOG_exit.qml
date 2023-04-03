
import QtQuick
import QtQuick.Dialogs
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Item{
    Dialog {
        id: dialog_exit
        title: "Really Exit ?"
        standardButtons: Dialog.Ok | Dialog.Cancel

        onAccept:   console.log(    "OK clicked")
        onRejected: console.log("Cancel clicked")
    }
}
