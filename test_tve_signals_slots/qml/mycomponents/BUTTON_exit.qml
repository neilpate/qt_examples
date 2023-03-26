
import QtQuick 
import QtQuick.Controls

Button {
    id: control
    height: 50
    
    leftPadding: 4
    rightPadding: 4
    
    // Setup button text, changing when clicked (or not)
    //
    text: "EXIT"
    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "white" : "blue"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    // setup button size and background color
    //
    background: buttonBackground
    Rectangle {
        id: buttonBackground
        color: "white" // "#00000000"
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        radius: 10
        border.color: "blue" // "#047eff"
        MouseArea {
            id: buttonMouseArea
            anchors.fill: parent
        }
    }

    // Invert background color when clicked (or not)
    //
    states: [
        State {
            name: "normal"
            when: !control.down

            PropertyChanges {
                target: buttonBackground
                color: "white"       // "#00000000"
                border.color: "blue" // "#047eff"
            }
        },
        State {
            name: "down"
            when: control.down
            
            PropertyChanges {
                target: buttonBackground
                color: "blue"         // "#047eff"
                border.color: "white" // "#00000000"
            }
        }
    ]
    
    //DIALOG_exit {
    //    id: dialog_exit
    // }

}

