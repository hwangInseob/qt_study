#ifndef CONNECTEVENT_H
#define CONNECTEVENT_H

#include <QQuickView>
#include <QObject>

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

    Q_INVOKABLE void invokableMethod();
private:
    QQuickWindow* mMainView;

signals:
    void cppSignalTestData(QVariant var);

public slots:
    void cppSlotStringData(QVariant stringData);
    void cppSlotIntData(QVariant intData);
};
#endif // CONNECTEVENT_H
