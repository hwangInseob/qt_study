import QtQuick 2.0
import QtQml 2.12

QtObject{
    property string platform: Qt.platform.os

    enum MyEnum {
        First = 10,
        Second
    }
}
