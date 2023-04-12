import QtQuick 2.6
import QtQuick.Window 2.2
import QtQml 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    MyItem{
        id:myitem
    }

    Loader{
        id:loader
    }

    MyComponent{
        id:myComponent
    }

    Text {
        id: name
        text: myitem.platform
        font.pixelSize: 20

        anchors.centerIn: parent

        MouseArea{
            anchors.fill: parent

            onClicked:{
                console.log("clicekd!!", MyItem.MyEnum.First)
                loader.sourceComponent = myComponent
            }
        }
    }
}
