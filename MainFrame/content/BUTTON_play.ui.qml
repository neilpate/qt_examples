

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: control

    implicitWidth: Math.max(
                       buttonBackground ? buttonBackground.implicitWidth : 0,
                       textItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(
                        buttonBackground ? buttonBackground.implicitHeight : 0,
                        textItem.implicitHeight + topPadding + bottomPadding)
    leftPadding: 4
    rightPadding: 4

    text: "My Button"

    background: buttonBackground
    Image {
        id: image
        anchors.fill: parent
        source: "../../../../Pictures/button_play.jpeg"
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        id: buttonBackground
        color: "#00000000"
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        radius: 2
        border.color: "#047eff"
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
    D{i:0;uuid:"6984d3bf167d4acd8471fb9d4c5e3077"}D{i:2;uuid:"0f1b71c88082618baae0e4534195e63b"}
D{i:1;uuid:"dc7f348190f20463220dbabb87424176"}D{i:4;uuid:"0ce8eaf322398e8eaa8adb0e7b67dbef"}
D{i:3;uuid:"8fee27a1e36907cb309414c932998df7"}
}
##^##*/
