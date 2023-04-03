
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
        //color: "#00000000"
        color: "white"
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        radius: 10
        //border.color: "#047eff"
        border.color: "blue"
    }

    // Invert background color when clicked (or not)
    //
    states: [
        State {
            name: "normal"
            when: !control.down

            PropertyChanges {
                target: buttonBackground
                //color: "#00000000"
                //border.color: "#047eff"
                color: "white"
                border.color: "blue"
            }
        },
        State {
            name: "down"
            when: control.down

            PropertyChanges {
                target: buttonBackground
                //color: "#047eff"
                //border.color: "#00000000"
                color: "blue"
                border.color: "white"
            }
        }
    ]
}

