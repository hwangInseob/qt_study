import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    width:640
    height:480

    Component.onCompleted:
    {

    }

    Component.onDestruction:
    {

    }

    Rectangle{
        anchors.fill:parent
        color:"green"
    }
    Text{
        id:testData
        anchors.horizontalCenter: parent.horizontalCenter
        text:"screen1 testData"
        font.pixelSize: 30
        font.bold: true
    }
    Text{
        id:testText
        anchors.centerIn: parent
        text:"screen1!!!"
        font.pixelSize:50
        font.bold: true
    }
    Button{
        id:nextButton
        anchors.top:testText.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text:"go next screen"
        onClicked:{
            stackView.push(Qt.resolvedUrl("qrc:/screen2.qml"))
        }
    }
    Button{
        id:previousButton
        anchors.top:testText.bottom
        anchors.right:nextButton.left
        anchors.rightMargin: 30
        text:"go previous screen"
        onClicked: {
            stackView.pop()
        }
    }
}
