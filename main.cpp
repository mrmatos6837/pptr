#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlContext>

#include "mytcpserver.h"

int main(int argc, char *argv[])
{
    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QObject *topLevel = engine.rootObjects().value(0);
    QQuickWindow *window = qobject_cast<QQuickWindow *>(topLevel);

    MyTcpServer server;

    QObject::connect(&server, SIGNAL(signalRegistered()), window, SLOT(slotRegistered()));
    QObject::connect(&server, SIGNAL(signalOffhook()), window, SLOT(slotOffhook()));
    QObject::connect(&server, SIGNAL(signalOnhook()), window, SLOT(slotOnhook()));
    QObject::connect(&server, SIGNAL(signalIncoming()), window, SLOT(slotIncoming()));
    QObject::connect(&server, SIGNAL(signalOutgoing()), window, SLOT(slotOutgoing()));
    QObject::connect(&server, SIGNAL(signalEstabilished()), window, SLOT(slotEstabilished()));
    QObject::connect(&server, SIGNAL(signalTerminated()), window, SLOT(slotTerminated()));
    QObject::connect(&server, SIGNAL(signalMissed()), window, SLOT(slotMissed()));

    return app.exec();
}
