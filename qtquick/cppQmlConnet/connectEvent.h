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

    void cppSignalToQmlSlot();
    void setWindow(QQuickWindow* window);

private:
    QQuickWindow* mMainView;

signals:
    void cppSignalTestData(QVariant var);

public slots:
    void cppSlotStringData(QVariant stringData);
    void cppSlotIntData(QVariant intData);
};

#endif // CONNECTEVENT_H
