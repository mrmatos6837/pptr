// mytcpserver.cpp

#include "mytcpserver.h"

MyTcpServer::MyTcpServer(QObject *parent) :
    QObject(parent)
{
    server = new QTcpServer(this);

    // whenever a user connects, it will emit signal
    connect(server, SIGNAL(newConnection()),
            this, SLOT(newConnection()));

    if(!server->listen(QHostAddress::Any, 9999))
    {
        qDebug() << "Server could not start";
    }
    else
    {
        qDebug() << "Server started!";
    }
}

void MyTcpServer::newConnection()
{
    // need to grab the socket
    QTcpSocket *socket = server->nextPendingConnection();
//    socket->write("hello maaan\r\n");
//    socket->flush();
//    socket->waitForBytesWritten(3000);

    socket->waitForReadyRead(3000);
    QString request = socket->readAll();
    qDebug() << request;
    QStringList tokens = request.split(QRegExp("[ \r\n][ \r\n]*"));
    qDebug() << tokens.at(1);
    if(tokens.at(1)=="/registered"){
            emit signalRegistered();
    }
    if(tokens.at(1)=="/offhook"){
            emit signalOffhook();
    }
    if(tokens.at(1)=="/onhook"){
            emit signalOnhook();
    }
    if(tokens.at(1)=="/incoming"){
            emit signalIncoming();
    }
    if(tokens.at(1)=="/outgoing"){
            emit signalOutgoing();
    }
    if(tokens.at(1)=="/estabilished"){
            emit signalEstabilished();
    }
    if(tokens.at(1)=="/terminated"){
            emit signalTerminated();
    }
    if(tokens.at(1)=="/missed"){
            emit signalMissed();
    }

    socket->close();
}
