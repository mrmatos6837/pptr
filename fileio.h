#ifndef FILEIO_H
#define FILEIO_H

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QDesktopServices>
#include <QUrl>
#include <QDir>

class FileIO : public QObject
{

    Q_OBJECT

public:
    FileIO();
    Q_INVOKABLE void appendToEnd(QString text, QString filePath);
    Q_INVOKABLE void overwriteLine(int position,QString text, QString filePath);
    Q_INVOKABLE QString readLines(int position, QString filePath);
    Q_INVOKABLE void openUrlFile(QString path);
    ~FileIO();

signals:
    void readCompleted(QVariant data);

public slots:

private:

};

#endif // FILEIO_H
