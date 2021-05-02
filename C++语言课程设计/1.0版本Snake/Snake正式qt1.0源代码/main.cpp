#include "mainwidget.h"
#include <QApplication>
#include <QProcess>
#include <QPushButton>
#include <QDebug>
#include <QDir>
int main(int argc, char *argv[])
{
    QString path=argv[0];
    qDebug()<<path;
    //QDir::setCurrent(snakeapp.applicationDirPath());//添加这句 立马可以
    QApplication snakeapp(argc, argv);
    MainWidget mainwindow;      //主窗口
    mainwindow.setWindowTitle("贪吃蛇2019.7.22qt版");       //表替
    mainwindow.setFixedSize(400,400);   //设置窗口大小
    mainwindow.show();      //打开窗口

    snakeapp.exec();
    return 733;
}
