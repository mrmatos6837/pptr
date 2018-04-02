#include "fileio.h"


FileIO::FileIO()
{

}

void FileIO::appendToEnd(QString text, QString filePath){

    QFile file(filePath);

    if(file.open(QIODevice::ReadWrite | QIODevice::Append)){
        QTextStream stream(&file);
        stream << text << endl;
    }
    qDebug() << "log updated";

}

void FileIO::overwriteLine(int position, QString text, QString filePath){

    QFile file(filePath);

    if(file.open(QIODevice::ReadOnly)){
        QString data = file.readAll();
        QStringList parsedData = data.split(QRegExp("[ \r\n][ \r\n]*"));
        file.close();   //close to reset to initial position
        file.open(QIODevice::WriteOnly); //open to reset
        QTextStream stream(&file);
        int i=0;
        while(i<parsedData.length() && parsedData.at(i)!=""){
            if(i==position){
                stream << text << endl;
            }
            else{
                stream << parsedData.at(i) << endl;
            }
            i++;
        }
    }
    qDebug() << "settings updated";
}

QString FileIO::readLines(int position, QString filePath){
    QFile file(filePath);
    QString data;
    if(file.open(QIODevice::ReadWrite)){
         data = file.readAll();
    }
    QStringList parsedData = data.split(QRegExp("[ \r\n][ \r\n]*"));
//    qDebug() << data;
//    qDebug() << parsedData;
//    qDebug() << parsedData.at(position);
    QString returnData = parsedData.at(position);
    return returnData;
}

void FileIO::openUrlFile(QString path){
    qDebug() << "Open help page on path"<< path << ":" << QDesktopServices::openUrl(QUrl(path, QUrl::TolerantMode));
//    QDesktopServices::openUrl(QUrl(path, QUrl::TolerantMode));
}

FileIO::~FileIO()
{

}


