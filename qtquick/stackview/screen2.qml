import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    width:640
    height:480

    objectName: "screen2"

    Component.onCompleted:
    {
        var previousItem = stackView.get(StackView.index-1)

        console.log("previousItem : " + previousItem)

        if(previousItem.objectName === "mainscreen")
        {
            console.log("previousItem --> mainscreen")
            testData.text = "previous screen is mainscreen"
        }
        else if(previousItem.objectName === "screen1")
        {
            console.log("previousItem === screen1")
            testData.text = "previous screen is screen1"
        }
        else
        {
            console.log("err")
        }
    }

    Component.onDestruction:
    {

    }

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
