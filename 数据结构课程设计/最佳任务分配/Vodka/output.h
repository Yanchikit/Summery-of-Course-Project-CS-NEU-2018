#ifndef OUTPUT_H
#define OUTPUT_H

#include <QWidget>
#include <QLabel>
#include <QDebug>
namespace Ui {
class output;
}

class output : public QWidget
{
    Q_OBJECT

public:
    explicit output(QWidget *parent = 0);
    ~output();
private:
    Ui::output *ui;
    QLabel *qout;
    QPalette back1;
};
void temp();
#endif // OUTPUT_H
