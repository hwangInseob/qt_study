#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "connectEvent.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    ConnectEvent* event = ConnectEvent::getInstance();
    qmlRegisterSingletonType<ConnectEvent>("ConnectEvent",1,0,"ConnectEvent",&ConnectEvent::qmlInstance);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    event->setWindow(qobject_cast<QQuickWindow*>(engine.rootObjects()[0]));

    return app.exec();
}
