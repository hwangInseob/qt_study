#include "connectEvent.h"

ConnectEvent::ConnectEvent()
{
    qDebug() << "ConnectEvent Constructor";
    initTestList();
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

QQuickWindow* ConnectEvent::getWindow()
{
    return mMainView;
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

void ConnectEvent::invokableMethod()
{
    qDebug() << "invoked CPP method";
    QObject* rootObject = qobject_cast<QObject*>(getWindow());
    QMetaObject::invokeMethod(rootObject,"testFunc",Q_ARG(QVariant,"test String"), Q_ARG(QVariant,10));

}

int ConnectEvent::getListSize()
{
    int listSize = 0;
    listSize = mTestList.size();
    return listSize;
}

QString ConnectEvent::getListTitle(int index)
{
    QString listTitle("");
    listTitle = mTestList.at(index).getTitle();
    return listTitle;
}

QString ConnectEvent::getListButtonText(int index)
{
    QString buttonText("");
    buttonText = mTestList.at(index).getButtonText();
    return buttonText;
}

QString ConnectEvent::getListInforamtion(int index)
{
    QString information("");
    information = mTestList.at(index).getInformation();
    return information;
}

void ConnectEvent::deleteListItem(int index)
{
    std::vector<tempClass>::iterator it;
    it = mTestList.begin();
    it = it + index;
    mTestList.erase(it);
    qDebug() << Q_FUNC_INFO << "end";
}

void ConnectEvent::deleteListItemList(QList<int> index)
{
    qDebug() << Q_FUNC_INFO << "called";
    for(int i = 0 ; i < index.count() ; i++ )
    {
        deleteListItem(index.at(i));
    }
}

void ConnectEvent::initTestList()
{
    tempClass tmp;
    for(int i = 0 ; i < 10; i++)
    {
        tmp.setTitle("TestTitle" + QString::number(i));
        tmp.setButtonText("buttenText" + QString::number(i));
        tmp.setInformation("Test Information" + QString::number(i));
        mTestList.push_back(tmp);
    }
}


