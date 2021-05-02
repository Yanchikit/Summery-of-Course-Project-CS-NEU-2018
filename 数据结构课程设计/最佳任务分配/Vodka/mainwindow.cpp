#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "km.h"
#include "input.h"
MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    this->autoFillBackground();
    palette.setBrush(QPalette::Background,QBrush(QPixmap("shu.jpg")));
    this->setPalette(palette);

    ui->setupUi(this);
    ui->txt->setPlaceholderText("这里是输入框\n"
                                "请输入人数、任务的数目：\n"
                                "然后依次输入每一个人对每一项任务完成的花费\n"
                                "-1为不可完成\n"
                                "最后输入每一个人的名字、以及每一项任务的名称");
    connect(ui->in,QPushButton::clicked,this,&txtin);
    connect(ui->fcin,QPushButton::clicked,this,&fcin);
    connect(ui->pushButton,QPushButton::clicked,this,&std::exit);
}

MainWindow::~MainWindow()
{
    delete ui;
}
void MainWindow::txtin(){
    QString qtxt = ui->txt->toPlainText();
    string txt;
    txt=qtxt.toStdString();
    cout<<txt<<endl;
    ifok=txtinput(txt);
    if(ifok==true)
    {
        ifok=ans.xyl();
        ans._km();
    }
    ofput();
}
void MainWindow::fcin(){
    string path=openfile().toStdString();
    ifok=finput(path);
    if(ifok==true)
    {
        ifok=ans.xyl();
        ans._km();
    }
    ofput();
}
QString MainWindow::openfile(){
    QString path;
    //qDebug() << "?";
    path=QFileDialog::getOpenFileName(this,"open","./","*.txt");
    //path = QDir::toNativeSeparators(path);
    int y = 0;
    y = path.indexOf(QString("/"));
    //qDebug()<<y<<"\\";
    while(y!=-1)
    {
        path.replace(y,1,QString("\\\\"));
        y = path.indexOf(QString("/"));
        qDebug()<<y;
    }
    qDebug() << path;
    return path;
}
void MainWindow::ofput(){
    oput=new output;
    oput->setWindowTitle("依然水不到行的输出");
    oput->show();
}
