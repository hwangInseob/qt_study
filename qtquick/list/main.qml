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

    ConnectEvent{
        id:connectEvent
    }

    Component.onCompleted: {
//        listView.model.append({"list_text":"test_text","list_button_text":"test button"})
//        listView.model.append({"list_text":"test_text","list_button_text":"test button"})
//        listView.model.append({"list_text":"test_text","list_button_text":"test button"})
//        listView.model.append({"list_text":"test_text","list_button_text":"test button"})
//        listView.model.append({"list_text":"test_text","list_button_text":"test button"})
//        listView.model.append({"list_text":"test_text","list_button_text":"test button"})

        for(var i = 0 ; i < connectEvent.getListSize();i++)
        {
            listView.model.append({"list_text":connectEvent.getListTitle(i),
                                      "list_button_text":connectEvent.getListButtonText(i)
                                  })
        }
    }

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

    Component{
        id:secondContactDelegate
        Item{
            width:800
            height:100
            Text {
                id: listView_text
                anchors.left:parent.left
                anchors.leftMargin: 50
                anchors.verticalCenter: parent.verticalCenter
                text:list_text
            }
            Button
            {
                id:listView_Button
                width:100
                height:40
                anchors.rightMargin: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.right:parent.right
                text:list_button_text
            }
            Rectangle{
                id:line
                width:parent.width
                anchors.bottom:parent.bottom
                height:1
                color:"black"
            }
        }
    }

    ListView{
        id:listView
        anchors.fill:parent
//        model:model
//        delegate:Delegate
        model:ListModel{}
        delegate:secondContactDelegate
        highlight:Rectangle{
            color:"lightsteelblue"
            radius:5
        }
        focus:true
    }
}
