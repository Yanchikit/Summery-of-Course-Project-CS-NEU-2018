#ifndef OUTTEST_H
#define OUTTEST_H

#include <QWidget>
#include <QPainter>
#include <QDebug>
#include <QLabel>
namespace Ui {
class outtest;
}

class outtest : public QWidget
{
    Q_OBJECT

public:
    explicit outtest(QWidget *parent = 0);
    ~outtest();
    void esc();
protected:
    void paintEvent(QPaintEvent *);
private:
    Ui::outtest *ui;
    QLabel txtout;
    QLabel *name;
};

#endif // OUTTEST_H
