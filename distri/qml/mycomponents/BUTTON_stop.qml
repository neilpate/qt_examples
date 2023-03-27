//pragma Singleton

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Button {
    id: control

    //implicitWidth: Math.max(
                       //buttonBackground ? buttonBackground.implicitWidth : 0,
                       //textItem.implicitWidth + leftPadding + rightPadding)
    //implicitHeight: Math.max(
                        //buttonBackground ? buttonBackground.implicitHeight : 0,
                        //textItem.implicitHeight + topPadding + bottomPadding)
    leftPadding: 4
    rightPadding: 4

    text: "My Button"
    icon.color: "#ffffff"

    background: buttonBackground
    Rectangle {
        id: buttonBackground
        color: "#00000000"
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        radius: 2
        border.color: "#047eff"
    }

    Image {
        id: image
        x: 0
        y: 0
        anchors.fill: parent
        source: "/home/harold/Pictures/button_stop.png"
        fillMode: Image.PreserveAspectCrop
    }

    states: [
        State {
            name: "normal"
            when: !control.down

            PropertyChanges {
                target: buttonBackground
                color: "#00000000"
                border.color: "#047eff"
            }
        },
        State {
            name: "down"
            when: control.down

            PropertyChanges {
                target: buttonBackground
                color: "#047eff"
                border.color: "#00000000"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"f4bb477aaf5e0e59fcb1ae6368310288"}D{i:2;uuid:"14d6c8047eafc8644788416d58453246"}
D{i:1;uuid:"7150dc9869abde1d62612041dd3c7a34"}D{i:4;uuid:"55190bfeed857df72a68dd06c742b9e5"}
D{i:3;uuid:"ab4980cfee9b4f17e8c63bba9145e0cb"}
}
##^##*/
