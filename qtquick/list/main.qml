import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import ConnectEvent 1.0

Window {
    property bool mbImageClicked:true
    property int mCount:0
    property int mListClickIndex:0
    property bool mbIsEditMode:false

    property variant arrDeleteItem:[]

    visible: true
    width: 800
    height: 600
    title: qsTr("Hello World")

//    ConnectEvent{
//        id:connectEvent
//    }

    Component.onCompleted: {
//        listView.model.append({"list_text":"test_text","list_button_text":"test button"})
//        listView.model.append({"list_text":"test_text","list_button_text":"test button"})
//        listView.model.append({"list_text":"test_text","list_button_text":"test button"})
//        listView.model.append({"list_text":"test_text","list_button_text":"test button"})
//        listView.model.append({"list_text":"test_text","list_button_text":"test button"})
//        listView.model.append({"list_text":"test_text","list_button_text":"test button"})

        for(var i = 0 ; i < ConnectEvent.getListSize();i++)
        {
            listView.model.append({"list_text":ConnectEvent.getListTitle(i),
                                      "list_button_text":ConnectEvent.getListButtonText(i),
                                      "checkedValue":false
                                  })
        }

        console.log(ConnectEvent.MONDAY)
        console.log(ConnectEvent.SUNDAY)
        console.log(ConnectEvent.SATURDAY)
    }

    function testFunc(str, i)
    {
        console.log("str : " + str + " / i : " + i)
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

            CheckBox{
                id:checkboxDeleteItem
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.verticalCenter: parent.verticalCenter
                visible: mbIsEditMode ? true : false
                z:1

                onCheckedChanged: {
                    checkedValue = checked
                    console.log("index " + index + " : checked")
                }

                onVisibleChanged: {
                    checked = false
                }
            }

            Text {
                id: listView_text
                anchors.left: mbIsEditMode ? checkboxDeleteItem.right : parent.left
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
                z: 1

                onClicked: {
                    ConnectEvent.deleteListItem(index)
                    listView.model.remove(index)
                }
            }
            Rectangle{
                id:line
                width:parent.width
                anchors.bottom:parent.bottom
                height:1
                color:"black"
            }
            MouseArea{
                id:listMouseArea
                anchors.fill:parent
                onClicked: {
                    mListClickIndex = index
                    stackView.push(Qt.resolvedUrl("qrc:/listInfo.qml"))
                }
            }
        }
    }

    StackView{
        id:stackView
        anchors.fill: parent

        initialItem: Item {
            Rectangle{
                id:topbar
                width:parent.width
                height:80
                color:"white"
                z:100
                Button{
                    id:editButton
                    width:80
                    height:40
                    anchors.right: parent.right
                    anchors.rightMargin: 30
                    anchors.top:parent.top
                    anchors.topMargin: 20

                    text:"edit"

                    onClicked: {
                        if(mbIsEditMode)
                        {
                            text="edit"
                            mbIsEditMode = false
                        }
                        else
                        {
                            text="cancle"
                            mbIsEditMode = true
                        }
                    }
                }

                Button{
                    id:deleteButton
                    width:80
                    height:40
                    anchors.right: editButton.left
                    anchors.rightMargin: 10
                    anchors.top:parent.top
                    anchors.topMargin: 20
                    visible: mbIsEditMode
                    text:"delete"

                    onClicked: {
                        for(var i = listView.count-1 ; i >= 0 ; i--)
                        {
                            var isChecked = listView.model.get(i).checkedValue
                            if(isChecked)
                            {
                                listView.model.remove(i)
                                arrDeleteItem.push(i)
                                console.log("checked Index : " + i)
                            }
                        }

                        ConnectEvent.deleteListItemList(arrDeleteItem)
                        var a = []
                        arrDeleteItem = a
                        editButton.text="edit"
                        mbIsEditMode = false
                    }
                }

                Button{
                    width:80
                    height:40
                    anchors.right: deleteButton.left
                    anchors.rightMargin: 10
                    anchors.top:parent.top
                    anchors.topMargin: 20
                    text:"func"

                    onClicked: {
                        ConnectEvent.invokableMethod()
                    }
                }
            }

            ListView{
                id:listView
                width: parent.width
                height: parent.height - 100
                anchors.top: topbar.bottom
        //        model:model
        //        delegate:Delegate
                model:ListModel{}
                delegate:secondContactDelegate
                highlight:Rectangle{
                    color:"lightsteelblue"
                    radius:5
                }
                focus:true

                //------------------------------
                //-         scrollbar          -
                //------------------------------
//                ScrollBar.vertical: ScrollBar{
//                    width:20
//                    policy:ScrollBar.AlwaysOn
//                    contentItem: Rectangle{
//                        radius: 100
//                        color:"red"
//                    }
//                }
                Flickable{
                    id:flickable
                    x:780
                    y:0
                    width:20
                    height:500
                    Rectangle{
                        id: scrollBarImage
                        y: {
                            var yValue = listView.visibleArea.yPosition * flickable.height //Flickable 의 전체 높이에서 yposition만큼의 비율을 곱해준다.(이미지의 y좌표는 스크롤이 높이만큼만 스크롤이 가능하기 때문에 Flickable 의 높이만큼)
                            if(yValue <= parent.y)
                            {
                                yValue = parent.y
                            }
                            else if(yValue >= (parent.height - height))
                            {
                                yValue = parent.height - height
                            }

                            return yValue
                        }
                        color:"red"
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 100
                        width : 10
//                        height:flickable.height - (flickable.height * (1 - listView.visibleArea.heightRatio))//스크롤바의 최대 높이는 flickable의 높이 입니다. 그렇기 때문에 flickable의 높이에서 높이 비율만큼 빼줍니다.
                        height:flickable.height * listView.visibleArea.heightRatio
                        property bool isClicked : false

                        onYChanged: {
                            if(isClicked)
                            {
                                listView.contentY = (scrollBarImage.y / flickable.height) * listView.contentHeight
                            }

                            console.log("listView.visibleArea.yPosition:" + listView.visibleArea.yPosition)
                            console.log("listView.visibleArea.heightRatio:" + listView.visibleArea.heightRatio)
                            console.log("scrollBarImage.y" + y)
                      }

                        MouseArea{
                            anchors.fill: parent

                            onPressed: {
                                console.log("scrollBarImage mouseArea PRESSED")
                                scrollBarImage.isClicked = true


                                console.log("(1) : " + (flickable.height - (flickable.height * (1 - listView.visibleArea.heightRatio))))
                                console.log("(2) : " + (flickable.height * listView.visibleArea.heightRatio))
                            }
                            onReleased: {
                                console.log("scrollBarImage mouseArea RELEASED")
                                scrollBarImage.isClicked = false
                            }

                            drag.target: scrollBarImage
                            drag.minimumY:flickable.y
                            drag.maximumY:flickable.height - scrollBarImage.height
                        }
                    }
                }
            }
        }
    }
}
