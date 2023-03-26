// ***************************
//       USER DEPENDENT
// ***************************
import "mycomponents"
import "constants"
// ***************************



/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.4
import QtQuick.Controls 6.4

Rectangle {
    id: mainFrameTVE

    width: Constants.width
    height: Constants.height

// ---- new code -------------------------------- start
    
    property string   harold: "Harold"
    property QtObject backend

    Connections {
        target: backend
        
        function onUpdated(msg) {
            harold = msg;
        }
    }

    color: Constants.backgroundColor

    DIALOG_exit {
        id: dialog_exit
    }
    
// ---- new code -------------------------------- end
    Rectangle {
        id: leftColumn
        width: 250
        height: 900
        color: "#ffffff"
        border.color: "#527075"
        border.width: 2
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 2
        anchors.leftMargin: 2

        Rectangle {
            id: leftColumnHeader
            width: 250
            height: 50
            color: "#ffffff"
            border.color: "#527075"
            border.width: 2
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: leftColumnHeaderText
                color: "#2abcea"
// ---- new code -------------------------------- start
                //text: qsTr("TVE PLATFORM")
                text: mainFrameTVE.harold
// ---- new code -------------------------------- end
                anchors.fill: parent
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
        }

        Rectangle {
            id: leftColumnDUTinfo
            x: 0
            y: 48
            width: 250
            height: 140
            color: "#ffffff"
            border.color: "#527075"
            border.width: 2

            Text {
                id: leftColumnfDUTinfoText
                y: 5
                width: 250
                color: "#2abcea"
// ---- new code -------------------------------- start
                //text: qsTr("DUT info")
                text: mainFrameTVE.harold
// ---- new code -------------------------------- end
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }

            Text {
                id: dutInfoSnText
                x: 29
                y: 39
                color: "#527075"
                text: qsTr("SN")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
            }

            Rectangle {
                id: dutInfoSnRect
                x: 62
                y: 38
                width: 180
                height: 20
                color: "#ffffff"
                border.color: "#527075"

                Text {
                    id: dutInfoSN
                    color: "#527075"
                    text: qsTr("-")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 5
                }
            }

            Text {
                id: dutInfoRefText
                x: 23
                y: 68
                color: "#527075"
                text: qsTr("Ref")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
            }

            Rectangle {
                id: dutInfoRefRect
                x: 62
                y: 67
                width: 180
                height: 20
                color: "#ffffff"
                border.color: "#527075"

                Text {
                    id: dutInfoRef
                    color: "#527075"
                    text: qsTr("-")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 5
                }
            }

            Text {
                id: dutInfoBatchText
                x: 8
                y: 97
                color: "#527075"
                text: qsTr("Batch")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
            }

            Rectangle {
                id: dutInfoBatchRect
                x: 62
                y: 96
                width: 180
                height: 20
                color: "#ffffff"
                border.color: "#527075"

                Text {
                    id: dutInfoBatch
                    x: 0
                    y: -29
                    color: "#527075"
                    text: qsTr("-")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 5
                }
            }
        }

        Rectangle {
            id: leftColumnProcess
            x: 0
            y: 184
            width: 250
            height: 720
            color: "#ffffff"
            border.color: "#527075"
            border.width: 2
            Text {
                id: leftColumnProcessText
                y: 5
                width: 250
                color: "#2abcea"
                text: qsTr("Process")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
        }
    }

    Rectangle {
        id: bottomRow
        y: 900
        height: 175
        color: "#ffffff"
        border.color: "#527075"
        border.width: 2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 2
        anchors.leftMargin: 2
        anchors.bottomMargin: 2

        Rectangle {
            id: bottomRowRightColumn
            x: 1270
            y: 0
            width: 640
            height: 175
            color: "#ffffff"
            border.color: "#527075"
            border.width: 2
            anchors.right: parent.right
            anchors.rightMargin: 0

            Text {
                id: bottomRowRightColumnHeaderText
                width: 640
                height: 50
                color: "#2abcea"
                text: qsTr("ATE Info")
                anchors.top: parent.top
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 0
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
            }

            Text {
                id: siteText
                x: 80
                y: 54
                color: "#527075"
                text: qsTr("Site :")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
            }

            Rectangle {
                id: siteNameRect
                x: 121
                y: 53
                width: 180
                height: 20
                color: "#ffffff"
                border.color: "#527075"
                Text {
                    id: siteName
                    color: "#527075"
                    text: qsTr("-")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 5
                }
            }

            Text {
                id: ateNameText
                x: 80
                y: 80
                color: "#527075"
                text: qsTr("ATE :")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
            }

            Rectangle {
                id: ateNameRect
                x: 121
                y: 78
                width: 180
                height: 20
                color: "#ffffff"
                border.color: "#527075"
                Text {
                    id: ateName
                    color: "#527075"
                    text: qsTr("-")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 5
                }
            }

            Text {
                id: ateTcpText
                x: 79
                y: 104
                color: "#527075"
                text: qsTr("TCP :")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
            }

            Rectangle {
                id: tcpNumRect
                x: 121
                y: 103
                width: 180
                height: 20
                color: "#ffffff"
                border.color: "#527075"
                Text {
                    id: tcpNum
                    color: "#527075"
                    text: qsTr("-")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 5
                }
            }

            Text {
                id: ateAdapterNameText
                x: 48
                y: 129
                color: "#527075"
                text: qsTr("Adapter :")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
            }

            Rectangle {
                id: adapterNameRect
                x: 121
                y: 128
                width: 180
                height: 20
                color: "#ffffff"
                border.color: "#527075"
                Text {
                    id: adapterName
                    color: "#527075"
                    text: qsTr("-")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 5
                }
            }

            Text {
                id: ateTestPcText
                x: 364
                y: 54
                color: "#527075"
                text: qsTr("Test PC :")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
            }

            Rectangle {
                id: testPcNameRect
                x: 431
                y: 53
                width: 180
                height: 20
                color: "#ffffff"
                border.color: "#527075"
                Text {
                    id: testPcName
                    color: "#527075"
                    text: qsTr("-")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 5
                }
            }

            Text {
                id: ateSerialNumberText
                x: 359
                y: 79
                color: "#527075"
                text: qsTr("Adapter :")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
            }

            Rectangle {
                id: ateSerialNumRect
                x: 431
                y: 78
                width: 180
                height: 20
                color: "#ffffff"
                border.color: "#527075"
                Text {
                    id: ateSerialNum
                    color: "#527075"
                    text: qsTr("-")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 5
                }
            }

            Text {
                id: ateSwRevText
                x: 364
                y: 104
                color: "#527075"
                text: qsTr("SW Rev :")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
            }

            Rectangle {
                id: ateSwRevRect
                x: 431
                y: 103
                width: 180
                height: 20
                color: "#ffffff"
                border.color: "#527075"
                Text {
                    id: ateSwRev
                    color: "#527075"
                    text: qsTr("-")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 5
                }
            }

            Text {
                id: ateAdapterSnText
                x: 335
                y: 129
                color: "#527075"
                text: qsTr("Adapter SN :")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
            }

            Rectangle {
                id: ateAdapterSerialNumberRect
                x: 431
                y: 128
                width: 180
                height: 20
                color: "#ffffff"
                border.color: "#527075"
                Text {
                    id: adapterSerialNumber
                    color: "#527075"
                    text: qsTr("-")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 5
                }
            }


        }

        Rectangle {
            id: bottomRowMidColumn
            y: 0
            width: 640
            height: 175
            color: "#ffffff"
            border.color: "#527075"
            border.width: 2
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: philipsLogo
                y: 18
                width: 262
                height: 56
                source: qsTr(Constants.pictureDir) + qsTr("logo_philips.jpg")
                anchors.horizontalCenter: parent.horizontalCenter
                sourceSize.height: 300
                sourceSize.width: 300
                fillMode: Image.PreserveAspectCrop
            }

            Text {
                id: operatorText
                y: 100
                color: "#527075"
                text: qsTr("Operator :")
                anchors.left: parent.left
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
                anchors.leftMargin: 20
            }

            Rectangle {
                id: operatorNameRect
                x: 100
                y: 100
                width: 180
                height: 20
                color: "#ffffff"
                border.color: "#527075"
                Text {
                    id: operatorName
                    color: "#527075"
                    text: qsTr("-")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 5
                }
            }
        }

        Rectangle {
            id: bottomRowLeftColumn
            x: 2
            y: 903
            width: 640
            height: 175
            color: "#ffffff"
            border.color: "#527075"
            border.width: 2
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.leftMargin: 0

            Text {
                id: bottomRowleftColumnHeaderText
                x: 1276
                y: 0
                width: 640
                height: 40
                color: "#2abcea"
                text: qsTr("Buttons")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
            }

            BUTTON_play {
                id: button_play
                objectName: "button_play"
                x: 431
                y: 60
                width: 65
                height: 65
                hoverEnabled: false
                checkable: true
                display: AbstractButton.IconOnly
                icon.color: "#000000"
            }


            BUTTON_stop {
                id: button_stop
                objectName: "button_stop"
                x: 283
                y: 54
                width: 75
                height: 75
                hoverEnabled: false
                checkable: true
                display: AbstractButton.IconOnly
            }

          BUTTON_exit {
                id: button_exit
// ---- new code -------------------------------- start
                objectName: "button_exit"
// ---- new code -------------------------------- end
                x: 162
                y: 67
                width: 50
                height: 50
                hoverEnabled: false
                checkable: true
                display: AbstractButton.IconOnly
                onClicked: dialog_exit.open()
             }
        }
    }

    Rectangle {
        id: appFrame
        x: 251
        y: 4
        width: 1665
        height: 900
        color: "#f3f8f9"
        radius: 20
        border.color: "#527075"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 2
        anchors.rightMargin: 2

        Loader {
            id: loader
            anchors.fill: parent
            source: "../../../../Pictures/button_play.jpeg"
            active: false
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"3b1c999d122b1229bc53b3996614d28a"}D{i:3;uuid:"99f7f40a318315605d3e7fa634a039a2"}
D{i:2;uuid:"d7c6b58d20ebb2909bb9752b28a39305"}D{i:5;uuid:"7af065ff7fadf1f4b33ec73a7232d8e7"}
D{i:6;uuid:"5d33fc7e4dd4e36b67800ff1a2f85d10"}D{i:8;uuid:"7730eda419c5ac98c42e491e258a82e8"}
D{i:7;uuid:"ef2ee9cbdce4feaf976a5d68fc2b0b59"}D{i:9;uuid:"99906764f73fc7a15cbf1d2476dd2bb7"}
D{i:11;uuid:"758d6585bc5c7d885a663f7025e401ca"}D{i:10;uuid:"32ada050a8a615f5d6a63ac5a5307b8b"}
D{i:12;uuid:"bf8779404d1a5cf9710d728408aa7a50"}D{i:14;uuid:"575bf2922a4cb91694fa55a6165b615c"}
D{i:13;uuid:"d68860eccbc6db2caed92eaa328dc591"}D{i:4;uuid:"0cc0d1d45ac948e0cd724953d4620644"}
D{i:16;uuid:"be6221f20e8b926206704829ef6d190e"}D{i:15;uuid:"6495770517d3cad7417d9b1365fdad54"}
D{i:1;uuid:"6e7e4f2b48a552995c46a29c38303c31"}D{i:19;uuid:"ae008c507e9c861735e7253e9e9cb060"}
D{i:20;uuid:"e35d88d7879a893258f6e229c815fc5f"}D{i:22;uuid:"c7e895d3fbbc964bed614b3ac3061e21"}
D{i:21;uuid:"e8f6d843f186c5d2cbd60be4b264ad63"}D{i:23;uuid:"caafb06a82dcad5e11e92fc3bc27a0bd"}
D{i:25;uuid:"c76e35fcfd2167eb766fd80bd0ddf1e2"}D{i:24;uuid:"719abe43c87f4a763f19207a98e47b62"}
D{i:26;uuid:"cb3b838d28d8ef777597e1555e5c8bed"}D{i:28;uuid:"aa2cda01de7303f1a805e66f60e96dbe"}
D{i:27;uuid:"2b76d4c6613c4529916f7c545a4d487d"}D{i:29;uuid:"cc77c38d5d9563c18626451d41bedc21"}
D{i:31;uuid:"127600df5932124a96dece71d0616fcc"}D{i:30;uuid:"e99494b465a84be44e5f3580cac3aeeb"}
D{i:32;uuid:"e63b132ccd99bd10ed3b817068a63b23"}D{i:34;uuid:"a63e4dcd608ca0a7112df74046483c2f"}
D{i:33;uuid:"8a688e114ec947453225a60387faf1bf"}D{i:35;uuid:"086a9ef6d877fc47b9d19f642d9f36ba"}
D{i:37;uuid:"f85ebb0538919f6cfaf615334574e36f"}D{i:36;uuid:"ba45819250ec82ddd279a29681027e7b"}
D{i:38;uuid:"bdb9ae8dd8565b716e5eca086b442705"}D{i:40;uuid:"bc86fe5912e22f3ea0577ba84f2106da"}
D{i:39;uuid:"e7f5e6b4ec84148498bb0c8a2cf60f25"}D{i:41;uuid:"d12a8eee7593941c1c4c540b15ab146e"}
D{i:43;uuid:"b829d599c0eff673fae5555d1d9f1042"}D{i:42;uuid:"1c13332115dd8ac26309aa0dcd0c196d"}
D{i:18;uuid:"c0c1eab1231f67049c90611b265947c0"}D{i:45;uuid:"9cf113e0ee828c2cad2b3190c05790cd"}
D{i:46;uuid:"0a3aa44422077dc27dbfc57bee79309d"}D{i:48;uuid:"7374cdfff526e61fa98e3fcd74ef2960"}
D{i:47;uuid:"d9d3fe756b7cc5e45149e3a5db47d3a9"}D{i:44;uuid:"d0aa11ef503143f1e943fe51d766a13d"}
D{i:50;uuid:"78d78df51aba39f34c25554518b2f3c4"}D{i:51;uuid:"6f4004e589e1f484ee51190cd8644c7e"}
D{i:52;uuid:"0b523fe0b428785dbdcd50881867e58c"}D{i:53;uuid:"54485d67ce715f92648ca15553f912b3"}
D{i:49;uuid:"717319035d7c3ead2d98941fdb05db81"}D{i:17;uuid:"258f381f91cf9888e4da42e681a18e70"}
D{i:55;uuid:"6cd060209f8eb9be05427c6ed15db658"}D{i:54;uuid:"46076865ea37204e295bb296aeb34628"}
}
##^##*/
