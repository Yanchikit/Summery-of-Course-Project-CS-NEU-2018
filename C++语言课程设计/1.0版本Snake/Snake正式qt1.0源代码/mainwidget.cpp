#include "mainwidget.h"
#include <QPushButton>
#include <QDebug>
#include <iostream>
#include <QString>
#include <string>
#include <time.h>
#include <windows.h>
#include <QProcess>
#include <QFile>
#include <QCoreApplication>
#include <QFont>
#include <windows.h>
using namespace std;
QString mode_code="0";
//QString map_code="0";
QString skin_code="0";
QString speed_code="0";

MainWidget::MainWidget(QWidget *parent)
    : QWidget(parent)
{
    /*----------------按钮------------------*/
    start.setParent(this);      //设置父类
    about.setParent(this);
    exit.setParent(this);
    rank.setParent(this);

    Mode1.setParent(this);
    Mode2.setParent(this);
    Mode3.setParent(this);
    back1.setParent(this);

    eazy.setParent(this);
    normal.setParent(this);
    hard.setParent(this);
    back2.setParent(this);

    /*Map1.setParent(this);
    Map2.setParent(this);
    Map3.setParent(this);
    back3.setParent(this);*/

    Skin1.setParent(this);
    Skin2.setParent(this);
    Skin3.setParent(this);
    back4.setParent(this);

    startGame.setParent(this);
    back5.setParent(this);

    rankback.setParent(this);
    aboutback.setParent(this);

    Mode1.hide();       //隐藏按钮
    Mode2.hide();
    Mode3.hide();
    back1.hide();

    eazy.hide();
    normal.hide();
    hard.hide();
    back2.hide();

    /*Map1.hide();
    Map2.hide();
    Map3.hide();
    back3.hide();*/

    Skin1.hide();
    Skin2.hide();
    Skin3.hide();
    back4.hide();

    startGame.hide();
    back5.hide();

    rankback.hide();
    aboutback.hide();

    start.setText("开始游戏");      //设置按钮名称
    about.setText("游戏说明");
    exit.setText("退出游戏");
    rank.setText("排行榜");

    Mode1.setText("经典模式");
    Mode2.setText("普通模式");
    Mode3.setText("街机模式");
    back1.setText("返回");

    eazy.setText("简单");
    normal.setText("正常");
    hard.setText("困难");
    back2.setText("返回");

    /*Map1.setText("地图1");
    Map2.setText("地图2");
    Map3.setText("地图3");
    back3.setText("返回");*/

    Skin1.setText("皮肤1");
    Skin2.setText("皮肤2");
    Skin3.setText("皮肤3");
    back4.setText("返回");

    startGame.setText("开始！");
    back5.setText("返回");

    rankback.setText("返回");
    aboutback.setText("返回");

    start.move(150,75);     //定位
    rank.move(150,150);
    about.move(150,225);
    exit.move(150,300);

    Mode1.move(150,75);     //定位
    Mode2.move(150,150);
    Mode3.move(150,225);
    back1.move(150,300);

    eazy.move(150,75);     //定位
    normal.move(150,150);
    hard.move(150,225);
    back2.move(150,300);

    /*Map1.move(150,75);     //定位
    Map2.move(150,150);
    Map3.move(150,225);
    back3.move(150,300);*/

    Skin1.move(150,75);     //定位
    Skin2.move(150,150);
    Skin3.move(150,225);
    back4.move(150,300);

    startGame.move(150,150);     //定位
    back5.move(150,225);

    rankback.move(0,0);     //定位
    aboutback.move(0,0);

    connect(&start,QPushButton::pressed,this,&MainWidget::Choose);
    connect(&rank,QPushButton::pressed,this,&MainWidget::ReadFile_Rank);
    connect(&about,QPushButton::pressed,this,&MainWidget::ReadFile_About);
    connect(&rankback,QPushButton::pressed,this,&MainWidget::RankBack);
    connect(&aboutback,QPushButton::pressed,this,&MainWidget::AboutBack);
    connect(&exit,QPushButton::pressed,this,&MainWidget::close);
    // /选择模式
        connect(&Mode1,QPushButton::pressed,this,&MainWidget::ChooseMode);
        connect(&Mode2,QPushButton::pressed,this,&MainWidget::ChooseMode);
        connect(&Mode3,QPushButton::pressed,this,&MainWidget::ChooseMode);
        connect(&back1,QPushButton::pressed,this,&MainWidget::BacktoMain);
        // /选择难度
            connect(&eazy,QPushButton::pressed,this,&MainWidget::ChooseDifficulty);
            connect(&normal,QPushButton::pressed,this,&MainWidget::ChooseDifficulty);
            connect(&hard,QPushButton::pressed,this,&MainWidget::ChooseDifficulty);
            connect(&back2,QPushButton::pressed,this,&MainWidget::BacktoMode);
            // /选择地图
                //connect(&Map1,QPushButton::pressed,this,&MainWidget::ChooseMap);
                //connect(&Map2,QPushButton::pressed,this,&MainWidget::ChooseMap);
                //connect(&Map3,QPushButton::pressed,this,&MainWidget::ChooseMap);
               //connect(&back3,QPushButton::pressed,this,&MainWidget::);
                // /选择皮肤
                    connect(&Skin1,QPushButton::pressed,this,&MainWidget::ChooseSkin);
                    connect(&Skin2,QPushButton::pressed,this,&MainWidget::ChooseSkin);
                    connect(&Skin3,QPushButton::pressed,this,&MainWidget::ChooseSkin);
                    connect(&back4,QPushButton::pressed,this,&MainWidget::BacktoDifficulty);
                    // /选择开始
                        connect(&startGame,QPushButton::pressed,this,&MainWidget::OpenGame);
                        connect(&back5,QPushButton::pressed,this,&MainWidget::BacktoSkin);



    /*----------------程序------------------*/

    connect(Game_exe,SIGNAL(started()),this,SLOT(Open()));
    connect(Game_exe,SIGNAL(finished(int)),this,SLOT(Finished(int)));
    //connect(&startGame,SIGNAL(pressed()),this,SLOT(start_game()));
}
/*----------------按钮------------------*/
void MainWidget::Choose()
    {
        start.hide();
        rank.hide();
        about.hide();
        exit.hide();
        Mode1.show();
        Mode2.show();
        Mode3.show();
        back1.show();
    }
void MainWidget::ChooseMode()       //判断选择的模式
    {
        int str1,str2,str3;
        str1=Mode1.isDown();
        str2=Mode2.isDown();
        str3=Mode3.isDown();
        qDebug()<<"Mode:"<<str1<<str2<<str3;
        if(str1==1)
            mode_code="1";
        else if(str2==1)
            mode_code="2";
        else if(str3==1)
            mode_code="3";
        qDebug()<<mode_code;
        eazy.show();
        normal.show();
        hard.show();
        back2.show();
        Mode1.hide();
        Mode2.hide();
        Mode3.hide();
        back1.hide();
    }
void MainWidget::ChooseDifficulty()        //判断选择的难度
    {
        int str1,str2,str3;
        str1=eazy.isDown();
        str2=normal.isDown();
        str3=hard.isDown();
        qDebug()<<"Dif:"<<str1<<str2<<str3;
        if(str1==1)
            speed_code="1";
        else if(str2==1)
            speed_code="2";
        else if(str3==1)
            speed_code="3";
        qDebug()<<speed_code;
        eazy.hide();
        normal.hide();
        hard.hide();
        back2.hide();
        Skin1.show();
        Skin2.show();
        Skin3.show();
        back4.show();
        /*Map1.show();
        Map2.show();
        Map3.show();
        back3.show();*/
    }
/*void MainWidget::ChooseMap()        //判断选择的地图
{
    int str1,str2,str3;
    str1=Map1.isDown();
    str2=Map2.isDown();
    str3=Map3.isDown();
    qDebug()<<"Map:"<<str1<<str2<<str3;
    if(str1==1)
        map_code="1";
    else if(str2==1)
        map_code="2";
    else if(str3==1)
        map_code="3";
    qDebug()<<map_code;
    Map1.hide();
    Map2.hide();
    Map3.hide();
    back3.hide();
    Skin1.show();
    Skin2.show();
    Skin3.show();
    back4.show();
}*/
void MainWidget::ChooseSkin()        //判断选择的皮肤
{
    int str1,str2,str3;
    str1=Skin1.isDown();
    str2=Skin2.isDown();
    str3=Skin3.isDown();
    qDebug()<<"Skin:"<<str1<<str2<<str3;
    if(str1==1)
        skin_code="1";
    else if(str2==1)
        skin_code="2";
    else if(str3==1)
        skin_code="3";
    qDebug()<<skin_code;
    Skin1.hide();
    Skin2.hide();
    Skin3.hide();
    back4.hide();
    startGame.show();
    back5.show();
}

//void MainWidget::StartGame(){}
//void MainWidget::OpenAbout(){}
void MainWidget::OpenRank(){}
void MainWidget::BacktoMain()       //返回按钮
{
    start.show();
    rank.show();
    about.show();
    exit.show();
    Mode1.hide();
    Mode2.hide();
    Mode3.hide();
    back1.hide();
}
void MainWidget::BacktoMode()
{
    eazy.hide();
    normal.hide();
    hard.hide();
    back2.hide();
    Mode1.show();
    Mode2.show();
    Mode3.show();
    back1.show();
}
void MainWidget::BacktoDifficulty()
{
    eazy.show();
    normal.show();
    hard.show();
    back2.show();
    /*Map1.hide();
    Map2.hide();
    Map3.hide();
    back3.hide();*/
    Skin1.hide();
    Skin2.hide();
    Skin3.hide();
    back4.hide();
}
/*void MainWidget::BacktoMap()
{
    Map1.show();
    Map2.show();
    Map3.show();
    back3.show();
    Skin1.hide();
    Skin2.hide();
    Skin3.hide();
    back4.hide();
}*/
void MainWidget::BacktoSkin()
{
    Skin1.show();
    Skin2.show();
    Skin3.show();
    back4.show();
    startGame.hide();
    back5.hide();
}
//void MainWidget::GameBack(){}
void MainWidget::AboutBack()
{
    start.show();
    rank.show();
    about.show();
    exit.show();
    aboutback.hide();
    about_txt.hide();
}
void MainWidget::RankBack()
{
    start.show();
    rank.show();
    about.show();
    exit.show();
    rankback.hide();
    rank_txt.hide();
}
/*----------------程序------------------*/
void MainWidget::ReadFile_About()       //文件打开
{
        QFont font_about;
        font_about.setPointSize(13);
        about_txt.setParent(this);
        start.hide();
        about.hide();
        exit.hide();
        rank.hide();
        about_txt.move(0,28);
        about_txt.setFont(font_about);

        QFile file("./txt/About.txt");
        file.open(QIODevice::ReadOnly | QIODevice::Text);
        QByteArray t = file.readAll();
        QString txt;
        txt=QString(t);
        this->about_txt.setText(txt.toUtf8());
        about_txt.show();
        file.close();
        aboutback.show();
}

void MainWidget::ReadFile_Rank()
{
    QFont font_rank;
    font_rank.setPointSize(15);
    rank_txt.setParent(this);
    start.hide();
    about.hide();
    exit.hide();
    rank.hide();
    rank_txt.move(0,28);
    rank_txt.setFont(font_rank);

    QFile file("./txt/Rank.txt");
    file.open(QIODevice::ReadOnly | QIODevice::Text);
    QByteArray t = file.readAll();
    QString txt;
    txt=QString(t);
    this->rank_txt.setText(txt.toUtf8());
    rank_txt.show();
    file.close();
    rankback.show();
}

void MainWidget::WriteFile_Arg(QString arg)
{
        QFile file("./txt/arg.txt");
        file.open(QIODevice::WriteOnly | QIODevice::Text);
        file.write(arg.toUtf8());
        file.close();
}

void MainWidget::OpenGame()
{
    QString argg;
    argg=mode_code+"\n"+skin_code+"\n"+speed_code;
    this->WriteFile_Arg(argg);
    time_t _temp=clock();
    while(clock()-_temp<1000);
    Game_exe->startDetached("./exe/Snake.exe");
    Game_exe->waitForFinished(500);
    close();


    qDebug()<<Game_exe->exitCode();
//    int t=time(NULL);
//    while((time(NULL)-10)<=t);
    qDebug()<<"game should be opened";
}

void MainWidget::Open()         //槽函数信号函数
{
    qDebug()<<"game has been opened!!!";
}
void MainWidget::Finished(int exitcode)
{
    qDebug()<<exitcode;
    if(exitcode==1319)
    {
        qDebug()<<"game has been closed!!!"<<endl<<exitcode;
        this->show();
    }
}

MainWidget::~MainWidget()
{
}
