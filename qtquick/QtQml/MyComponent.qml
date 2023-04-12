import QtQuick 2.0
import QtQml 2.12

Component{
    id: mycomponent

    Timer{
        id: timer

        running: true
        interval: 2000

        onTriggered: {
            console.log("quit!!")

            Qt.quit()
        }
    }
}
