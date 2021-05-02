#include "output.h"
#include "ui_output.h"
#include "km.h"
output::output(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::output)
{
    ui->setupUi(this);

    //temp();
    this->autoFillBackground();
    back1.setBrush(QPalette::Background,QBrush(QPixmap("shu.jpg")));
    this->setPalette(back1);
    QPalette pa;
    pa.setColor(QPalette::WindowText,Qt::black);
    QFont ft("Microsoft YaHei",14,75);
    //ft.setPointSize(14);
    qout=new QLabel;
    qout->setFont(ft);
    qout->setPalette(pa);
    QString qs;
    qout->setParent(this);
    if(!ifok){
        qs+="没有解！\n";
    }
    else {
        qs="Total : ";
        qs+=QString::fromStdString(std::to_string(ans.mincost));
        qs+="\nid  ->  task   cost\n";
        qDebug()<<ans.pn;
        for(int i=1;i<=ans.pn;i++){
            qs+='\n';
            qs+=QString::fromStdString(ans.pname[i]);
            qs+="   ->   ";
            if(ans.matchy[i]==0){
                qs+="无\n";
                continue;
            }
            qs+=QString::fromStdString(ans.tname[ans.matchy[i]]);
            qs+="   ";
            qs+=QString::fromStdString(std::to_string((-ans.matrix[ans.matchy[i]][i])));
        }
    }
    qDebug()<<qs;
    qout->setText(qs.toUtf8());
    qout->show();
    this->show();
}

output::~output()
{
    delete ui;
    delete qout;
}
void temp(){
    for(int i=0;i<ans.pn+1;i++){
        ans.matchy.push_back(i);
    }
    for(int i=0;i<ans.tn+1;i++){
        ans.matchx.push_back(i);
    }
    ans.mincost=3.5;
}
