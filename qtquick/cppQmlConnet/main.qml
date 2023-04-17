import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import ConnectEvent 1.0
import "."

Window {
    property bool mbImageClicekd:true
    property int mCount:0

    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ConnectEvt
    {
        id:connectEvent
    }

    function qmlSlotTestData(data){
        console.log("qmlSlotTestData data:" + data)
    }

    signal qmlSignalStringData(var str)
    signal qmlSignalIntData(var i)

    StackView
    {
        id:stackView
        anchors.fill:parent

        initialItem: Item
        {
            objectName:"mainscreen"
            Rectangle
            {
                anchors.fill: parent
                color:"red"
            }
            Text
            {
                id: testData
                anchors.horizontalCenter: parent.horizontalCenter
                text:"main screen testData"
                font.pixelSize: 50
                font.bold: true
            }

            Text
            {
                id:testText
                anchors.centerIn: parent
                text:"main screen"
                font.pixelSize: 50
                font.bold: true
            }

            Button
            {
                id:nextButton
                anchors.top: testText.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text:"go screen1"
                onClicked:
                {
                    console.log("push screen1")
                    stackView.push(Qt.resolvedUrl("qrc:/screen1.qml"))
                }
            }
            Button
            {
                id:previousButton
                anchors.top:testText.bottom
                anchors.left: nextButton.right
                anchors.leftMargin: 30
                text:"go screen2"
                onClicked:
                {
                    stackView.push(Qt.resolvedUrl("qrc:/screen2.qml"))
                }
            }
            Button
            {
                id:stringEmitButton
                anchors.top:previousButton.bottom
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                text:"string signal emit"
                onClicked:
                {
                    qmlSignalStringData("string data signal")
                }
            }
            Button
            {
                id:intEmitButton
                anchors.top:previousButton.bottom
                anchors.topMargin: 30
                anchors.left: stringEmitButton.right
                anchors.leftMargin: 30
                text:"int signal emit"
                onClicked:
                {
                    qmlSignalIntData(11)
                }
            }

            Button
            {
                id:invokeButton
                anchors.top:stringEmitButton.bottom
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                text:"invoke cpp method"
                onClicked:
                {
                    connectEvent.getInstance().invokableMethod();
                }
            }
        }
    }


}
