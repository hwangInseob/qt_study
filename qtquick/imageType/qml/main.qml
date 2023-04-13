import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import "../image"

Window {
    property bool mbIsPlaying : true
    property bool mbtest:true

    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Image
    {
        x:0
        y:0
        width:100
        height:100
        source:"../image/play.png"

        MouseArea{
            anchors.fill: parent

            onClicked: {
                if(mbIsPlaying == true)
                {
                    parent.source = "../image/pause.png"
                    mbIsPlaying = false
                }
                else
                {
                    parent.source = "../image/play.png"
                    mbIsPlaying = true
                }
            }
        }
    }
}
