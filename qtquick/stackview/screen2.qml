import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    width:640
    height:480
    Rectangle{
        anchors.fill:parent
        color:"blue"
    }
    Text{
        id:testData
        anchors.horizontalCenter: parent.horizontalCenter
        text:"screen2 testData"
        font.pixelSize: 30
        font.bold: true
    }
    Text{
        id:testText
        anchors.centerIn: parent
        text:"screen2!!!"
        font.pixelSize: 50
        font.bold:true
    }
    Button{
        id:previousButton
        anchors.top:testText.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text:"go previous screen"
        onClicked: {
            stackView.pop()
        }
    }
}
