#include "outtest.h"
#include "ui_outtest.h"
#include "all.h"
outtest::outtest(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::outtest)
{
    ui->setupUi(this);
    //connect(ui->esc,QPushButton::clicked,this,&esc);
    txtout.setParent(this);
    QFont ft;
    ft.setPointSize(12);
    txtout.setFont(ft);
    int d = Kruskal(b,a);
    QString output="\n";
    if(ifok)
    {
        for(int i=0;i<5;i++){
            output.append('\n');
        }
        output.append("Total distance: ");
        output.append(QString::fromStdString(std::to_string(d)));
        output.append('\n');
        int num,i;
        num = a.size();
        cout << num << endl;
        const int xx=800,yy=100;
        //name=(QLabel *)malloc(sizeof(QLabel)*(b.size()+1));
        name = new QLabel[b.size()+1];
        for(i = 0;i<b.size();i++){
            b[i].x+=xx;
            b[i].y+=yy;
            (name[i]).setFont(ft);
            (name[i]).setParent(this);
            (name[i]).setGeometry(b[i].x,b[i].y+10,10,20);
            (name[i]).setText(QString::fromStdString(b[i].name).toUtf8());
            (name[i]).show();
        }

        for (i = 0; i < num; i++)
        {
            output.append(QString::fromStdString(b[a[i].u].name));
            output.append('(');
            output.append(QString::fromStdString(std::to_string(b[a[i].u].x-xx)));
            output.append(',');
            output.append(QString::fromStdString(std::to_string(b[a[i].u].y-yy)));
            output.append(')');
            output.append("--");
            output.append(QString::fromStdString(std::to_string(a[i].d)));
            output.append("m -->");
            output.append(QString::fromStdString(b[a[i].v].name));
            output.append('(');
            output.append(QString::fromStdString(std::to_string(b[a[i].v].x-xx)));
            output.append(',');
            output.append(QString::fromStdString(std::to_string(b[a[i].v].y-yy)));
            output.append(')');
            output.append('\n');
            //qDebug()<<output;
        }

        qDebug() << output;
        qDebug()<<"---------------";
        qDebug()<<num;
    }
    else
    {
        output.append("输入有误，请重新输入");
    }
    this->txtout.setText(output.toUtf8());
    txtout.adjustSize();
    txtout.show();
}

outtest::~outtest()
{
    delete ui;
    //free(name);
}
void outtest::esc(){
    delete this;
}
void outtest::paintEvent(QPaintEvent *){
    QPainter painter(this);
    const int xi=1;
    if(ifok)
    {
        painter.setPen(QPen(Qt::red,4));//设置画笔形式
        for(int i=0;i<a.size();i++){
            int &u=a[i].u,&v=a[i].v;
            double &d=a[i].d;
            painter.drawEllipse(b[u].x*xi,b[u].y*xi,5,5);
            painter.drawEllipse(b[v].x*xi,b[v].y*xi,5,5);
            painter.drawLine(b[u].x*xi,b[u].y*xi,b[v].x*xi,b[v].y*xi);
        }
    }
}
