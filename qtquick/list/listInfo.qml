import QtQuick 2.0
import QtQuick.Controls 2.0
import ConnectEvent 1.0

Item {
    // [0] listInfo Size Setting
    width:800
    height:600
    // ![0]

    // [1] CPP connectEvent Class Instance Create
    ConnectEvent {
        id:connectEvent
    }
    // ![1}

    Component.onCompleted: {
        testText.text = connectEvent.getListInforamtion(mListClickIndex)
    }

    Component.onDestruction: {

    }

    Rectangle{
        id: rectangle
        anchors.fill: parent
        color: "green"
    }

    Text {
        id: testText
        anchors.centerIn: parent
        text:"screen1"
        font.pixelSize: 50
        font.bold: true
    }

    Button {
        id:previousButton
        anchors.top:testText.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text:"go previous screen"

        onClicked: {
            console.log("pop screen1")
            stackView.pop();
        }
    }
}
