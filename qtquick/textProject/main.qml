import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle{
        anchors.fill: parent
        color:"gray"
        opacity: 0.5
    }

    Rectangle{
        width:text1.paintedWidth + text2.paintedWidth
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id: text1
            text:"Step : "
            Rectangle{
                anchors.fill:parent
                color:"transparent"
                border.color:"green"
            }
        }
        Text {
            id: text2
            text: "1"
            anchors.left:text1.right
            anchors.leftMargin:5
            Rectangle{
                anchors.fill:parent
                color:"transparent"
                border.color:"red"
            }
        }
    }

    Rectangle{
        id:rect1
        width:100
        height:100
        anchors.centerIn:parent
        color:"green"
        Text{
            id:res1_text1
            text:"rect1_text1"
            anchors.centerIn: parent
        }
    }
}
