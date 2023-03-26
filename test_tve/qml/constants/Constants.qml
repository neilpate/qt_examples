pragma Singleton
import QtQuick 6.4

QtObject {
    readonly property int width: 1920
    readonly property int height: 1080

    readonly property color backgroundColor: '#c2c2c2'
    //readonly property color backgroundColor: "black"
    
    readonly property string pictureDir: "/home/harold/Pictures/" // full path, ending with '/'

}
