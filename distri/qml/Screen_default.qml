import QtQuick
import QtQuick.Controls


/****************************
        USER DEPENDENT
  ***************************/
import "mycomponents"
import "constants"
/****************************/


Rectangle {
    id: screen_default

    width: Constants.width
    height: Constants.height


    property string operatorAuthorizedColor: "red"
    property string operatorAuthorizedText:  "Not Authorized"
    property string operatorNameInputText:   ""
    
    property QtObject backend

    Connections {
        target: backend
        
        function onUpdate_operatorAuthorizedText(msg) {
            operatorAuthorizedText = msg;
        }
        function onUpdate_operatorAuthorizedColor(msg) {
            operatorAuthorizedColor = msg;
        }
         function onUpdate_operatorNameInputText(msg) {
            operatorNameInputText = msg;
        }
    }

    DIALOG_exit {
        id: dialog_exit
        anchors.centerIn: screen_default
    }

    Main_view {
        id: main_view
    }
}    

