#include "connectEvent.h"

ConnectEvent::ConnectEvent()
{

}

ConnectEvent::~ConnectEvent()
{

}

void ConnectEvent::cppSignalToQmlSlot()
{
    QObject::connect(this, SIGNAL(cppSignalTestData(QVariant)), mMainView, SLOT(qmlSlotTestData(QVariant)));

    emit cppSignalTestData(3);
    emit cppSignalTestData(4);
    emit cppSignalTestData(5);
    emit cppSignalTestData(6);
}

void ConnectEvent::setWindow(QQuickWindow *window)
{
    mMainView = window;

    cppSignalToQmlSlot();
}
