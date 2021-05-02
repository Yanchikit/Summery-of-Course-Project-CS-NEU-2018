#ifndef MAINWINDOW_H
#define MAINWINDOW_H
#include <QMainWindow>
#include <QPushButton>
#include <QPainter>
#include <QDebug>
#include <QString>
#include <QFileDialog>
#include <string>
#include "outtest.h"
#include <QPalette>
#include <QPixmap>
namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    void txtcin();
    void fcin();
    QString openfile();
    void outtemp();
    void randcin();
//protected:
//    void paintEvent(QPaintEvent *);

private:
    Ui::MainWindow *ui;
    outtest *t=NULL;
    QPalette palette;
};

#endif // MAINWINDOW_H
