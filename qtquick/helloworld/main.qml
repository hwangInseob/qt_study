import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Text {
//        id: name
        text: qsTr("text")
        anchors.centerIn: parent
        font.pixelSize: 40
        color: "blue"
        font.bold: true

        MouseArea{
            anchors.fill: parent
            onClicked: Qt.quit()
        }
    }

}
