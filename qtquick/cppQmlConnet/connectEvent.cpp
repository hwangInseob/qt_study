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
    QObject::connect(mMainView, SIGNAL(qmlSignalStringData(QVariant)), this, SLOT(cppSlotStringData(QVariant)));
    QObject::connect(mMainView, SIGNAL(qmlSignalIntData(QVariant)), this, SLOT(cppSlotIntData(QVariant)));

    emit cppSignalTestData(3);
    emit cppSignalTestData(4);
    emit cppSignalTestData(5);
    emit cppSignalTestData(6);
}

///
/// Signals
///
void ConnectEvent::setWindow(QQuickWindow *window)
{
    mMainView = window;

    cppSignalToQmlSlot();
}

///
/// \brief ConnectEvent::cppSlotStringData
/// \param stringData
/// \return void
///
void ConnectEvent::cppSlotStringData(QVariant stringData)
{
    QString tmp = stringData.toString();
    qDebug() << Q_FUNC_INFO << tmp;
}

void ConnectEvent::cppSlotIntData(QVariant intData)
{
    int tmp = intData.toInt();
    qDebug() << Q_FUNC_INFO << tmp;
}
