#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QPushButton>
#include <QTextEdit>
#include <QString>
#include <QDebug>
#include <QFileDialog>
#include <QPixmap>
#include <QPalette>
#include "output.h"
namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    void txtin();
    void fcin();
    QString openfile();
    void ofput();

private:
    Ui::MainWindow *ui;
    output *oput=NULL;
    QPalette palette;
};

#endif // MAINWINDOW_H
