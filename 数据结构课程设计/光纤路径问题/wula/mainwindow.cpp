#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "all.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->textEdit->show();
    ui->textEdit->setPlaceholderText("这里是输入框\n"
                                     "请输入教学楼的数目：\n"
                                     "然后依次输入教学楼的名称、横坐标、轴坐标\n");
    this->autoFillBackground();
    palette.setBrush(QPalette::Background,QBrush(QPixmap("shu.jpg")));
    this->setPalette(palette);
    connect(ui->ccin,QPushButton::clicked,this,&txtcin);
    connect(ui->fexit,QPushButton::clicked,this,&std::exit);
    connect(ui->fccin,QPushButton::clicked,this,&fcin);
    connect(ui->frand,QPushButton::clicked,this,&randcin);
}

MainWindow::~MainWindow()
{
    delete ui;
}
//void MainWindow::paintEvent(QPaintEvent *)
//{
//    QPainter painter(this);
//    painter.setPen(QPen(Qt::red,4));//设置画笔形式
//    painter.drawEllipse(10,10,5,5);
//}


void MainWindow::txtcin()
{

    QString txt = ui->textEdit->toPlainText();
    instring=txt.toStdString();
    double d;
    b.clear();
    a.clear();
    ifok = Input(b);
    if(ifok)
    {
        d=Kruskal(b,a);
        Output(b,a,d);
    }
    outtemp();
}

void MainWindow::fcin()
{
    double d;
    b.clear();
    a.clear();
    string path=openfile().toStdString();
    ifok = Inputf(b,path);
    if(ifok)
    {
        d=Kruskal(b,a);
        Output(b,a,d);
    }
    outtemp();
}

void MainWindow::randcin(){
    double d;
    ifok = true;
    b.clear();
    a.clear();
    RandomInput(b);
    d=Kruskal(b,a);
    Output(b,a,d);
    outtemp();
}

QString MainWindow::openfile(){
    QString path;
    qDebug() << "?";
    path=QFileDialog::getOpenFileName(this,"open","./","*.txt");
    //path = QDir::toNativeSeparators(path);
    int y = 0;
    y = path.indexOf(QString("/"));
    qDebug()<<y<<"\\";
    while(y!=-1)
    {
        path.replace(y,1,QString("\\\\"));
        y = path.indexOf(QString("/"));
        qDebug()<<y;
    }
    qDebug() << path;
    return path;
}

void MainWindow::outtemp(){
    t=new outtest;

    t->setFixedSize(1600,1200);
    t->move(200,20);
    t->setWindowTitle("水不到行数的输出");
    t->show();
}
