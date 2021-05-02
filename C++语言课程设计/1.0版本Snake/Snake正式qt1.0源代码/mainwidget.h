#ifndef MAINWIDGET_H
#define MAINWIDGET_H

#include <QWidget>
#include <QPushButton>
#include <QProcess>
#include <QString>
#include <QLabel>
#include <QFont>



class MainWidget : public QWidget
{
    Q_OBJECT

public:
    MainWidget(QWidget *parent = 0);
    ~MainWidget();
    /*----------------函数------------------*/
    void Choose();
    void ChooseMode();
    void ChooseDifficulty();
    //void ChooseMap();
    void ChooseSkin();
    void StartGame();
    void OpenRank();
    void OpenAbout();

    void BacktoMain();
    void BacktoMode();
    void BacktoDifficulty();
    //void BacktoMap();
    void BacktoSkin();
    void GameBack();
    void RankBack();
    void AboutBack();
    void WriteFile_Arg(QString arg);
    void ReadFile_About();
    void ReadFile_Rank();
    /*----------------程序------------------*/
    void OpenGame();
public slots:
    /*----------------槽函数----------------*/
    //void start_game();
    void Open();
    void Finished(int);

private:
    /*----------------按钮------------------*/
    //界面1---主界面
    QPushButton start;
    QPushButton about;
    QPushButton rank;
    QPushButton exit;
    //界面2---选择模式
    QPushButton Mode1,Mode2,Mode3,back1;
    //界面3---选择难度
    QPushButton eazy,normal,hard,back2;
    //界面4---选择地图
    //QPushButton Map1,Map2,Map3,back3;
    //界面5---选择皮肤
    QPushButton Skin1,Skin2,Skin3,back4;
    //界面6---开始！
    QPushButton startGame,back5;
    //界面7---排行榜
    QPushButton rankback;
    //界面8---游戏说明
    QPushButton aboutback;
    /*----------------程序------------------*/
    QProcess *Game_exe=new QProcess(this);
    /*----------------文本------------------*/
    QLabel about_txt;
    QLabel rank_txt;


};

#endif // MAINWIDGET_H
