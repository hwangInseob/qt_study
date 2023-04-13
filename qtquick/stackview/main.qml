import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    StackView{
        id:stackView
        anchors.fill: parent
        initialItem: Item {
            Rectangle{
                anchors.fill:parent
                color:"red"
            }
            Text{
                id:testData
                anchors.horizontalCenter: parent.horizontalCenter
                text:"main screen testData"
                font.pixelSize: 30
                font.bold:true
            }

            Text{
                id:testText
                anchors.centerIn: parent
                text:"main screen"
                font.pixelSize: 50
                font.bold: true
            }

            Button{
                anchors.top:testText.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text:"go next screen"
                onClicked:{
                    stackView.push(Qt.resolvedUrl("qrc:/screen1.qml"))
                }
            }
        }
    }

}
