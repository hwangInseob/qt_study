import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

Window {
    property bool mbImageClicekd:true
    property int mCount:0

    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    function qmlSlotTestData(data){
        console.log("qmlSlotTestData data:" + data)
    }

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
                anchors.top:testText.bottom
                anchors.left: nextButton.right
                anchors.leftMargin: 30
                text:"go screen2"
                onClicked:
                {
                    "push screen2"
                    stackView.push(Qt.resolvedUrl("qrc:/screen2.qml"))
                }
            }
        }
    }


}
