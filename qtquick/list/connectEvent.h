#ifndef CONNECTEVENT_H
#define CONNECTEVENT_H

#include <QQuickView>
#include <QObject>
#include <vector>
#include <tempClass.h>

class ConnectEvent : public QObject
{
public:
    Q_OBJECT;

public:
    ConnectEvent();
    ~ConnectEvent();
    Q_INVOKABLE static ConnectEvent* getInstance()
    {
        static ConnectEvent* mInstance;

        if(mInstance == nullptr)
        {
            mInstance = new ConnectEvent;
        }

        return mInstance;
    }
    void cppSignalToQmlSlot();
    void setWindow(QQuickWindow* window);
    void initTestList();
    Q_INVOKABLE void invokableMethod();

    Q_INVOKABLE int getListSize();
    Q_INVOKABLE QString getListTitle(int index);
    Q_INVOKABLE QString getListButtonText(int index);
    Q_INVOKABLE QString getListInforamtion(int index);

private:
    QQuickWindow* mMainView;
    std::vector<tempClass> mTestList;
signals:
    void cppSignalTestData(QVariant var);

public slots:
    void cppSlotStringData(QVariant stringData);
    void cppSlotIntData(QVariant intData);
};
#endif // CONNECTEVENT_H
