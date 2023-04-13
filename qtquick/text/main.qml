import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.0



Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    Label{
        x:50
        y:20
        height:20
        font.pixelSize: 20
        text:"WrodWrap Mode"

        Rectangle{
            anchors.fill: parent
            border.color: "red"
            color:"transparent"
        }
    }
    Text{
        x:50
        y:50
        width:300
        height:100
        text:qsTr("Hello World Hello World Hello World Hello World")
        font.pixelSize:30
//        elide: Text.ElideRight          // display "..." over text
//        wrapMode: Text.WrapAnywhere     //line change any character
        wrapMode: Text.WordWrap         //line change on word



        Rectangle{
            anchors{
                fill: parent
            }
            border.color: "green"
            color:"transparent"
        }
    }


    Label{
        x:360
        y:20
        height:20
        font.pixelSize: 20
        text:"WrapAnywhere Mode"

        Rectangle{
            anchors.fill: parent
            border.color: "red"
            color:"transparent"
        }
    }
    Text{
        x:360
        y:50
        width:300
        height:100
        text:qsTr("Hello World Hello World Hello World Hello World")
        font.pixelSize:30
//        elide: Text.ElideRight          // display "..." over text
        wrapMode: Text.WrapAnywhere     //line change any character
//        wrapMode: Text.WordWrap         //line change on word



        Rectangle{
            anchors{
                fill: parent
            }
            border.color: "green"
            color:"transparent"
        }
    }

//    Button{
//        x:360
//        y:50
//        width:100
//        height:100
//    }
}
