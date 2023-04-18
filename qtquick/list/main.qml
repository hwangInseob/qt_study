import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import ConnectEvent 1.0

Window {
    property bool mbImageClicked:true
    property int mCount:0

    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ListModel{
        id:model
        ListElement{
            name:"Bill Smith"
            number:"111 1111"
        }
        ListElement{
            name:"John Brown"
            number:"222 2222"
        }
        ListElement{
            name:"Sam Wise"
            number:"333 3333"
        }
    }

    Component{
        id:contactDelegate
        Item{
            id:contactItem
            width:300
            height:100

            property string borderColor : "white"

            Column{

                Text{text:'<b>name:</b>' + name}
                Text{text:'<b>number:</b>' + number}
            }

            MouseArea{
                anchors.fill:contactItem
                hoverEnabled: true
                onHoveredChanged:
                {
                    if(containsMouse)
                    {
                        parent.borderColor = "lightsteelblue"
                    }
                    else
                    {
                        parent.borderColor = "white"
                    }
                }
            }

            Rectangle{
                anchors.fill:parent
                border.color: parent.borderColor
                color:"transparent"
            }
        }
    }

    ListView{
        id:listView
        anchors.fill:parent
        model:model
        delegate:contactDelegate
        highlight:Rectangle{
            color:"lightsteelblue"
            radius:5
        }
        focus:true
    }
}
