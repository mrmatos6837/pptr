#ifndef MYTCPSERVER_H
#define MYTCPSERVER_H


#include <QObject>
#include <QTcpSocket>
#include <QTcpServer>
#include <QDebug>

class MyTcpServer : public QObject
{
    Q_OBJECT
public:
    explicit MyTcpServer(QObject *parent = nullptr);

signals:
    void signalRegistered();
    void signalOffhook();
    void signalOnhook();
    void signalIncoming();
    void signalOutgoing();
    void signalEstabilished();
    void signalTerminated();
    void signalMissed();

public slots:
    void newConnection();

private:
    QTcpServer *server;
    void requestHandler(char request);
};


#endif // MYTCPSERVER_H
