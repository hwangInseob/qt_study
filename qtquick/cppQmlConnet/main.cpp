#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "connectEvent.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    ConnectEvent* event = new ConnectEvent();
    QObject *root = engine.rootObjects()[0];
    event->setWindow(qobject_cast<QQuickWindow*>(root));

    if(engine.rootObjects().isEmpty())
    {
        return -1;
    }

    return app.exec();
}
