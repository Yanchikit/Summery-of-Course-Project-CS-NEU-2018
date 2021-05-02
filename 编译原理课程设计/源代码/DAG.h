#ifndef DAG_H_INCLUDED
#define DAG_H_INCLUDED
#include "all.h"
using namespace std;

struct quat_item{   //四元式
    string w;   //操作符
    string op1; //操作数1
    string op2; //操作数2
    string t;   //结果
};

struct dagNode {    //DAG节点
    int num;        //编号
    int leftChild=-1; //左孩子
    int rightChild=-1; //右孩子
    string opt="";   //操作符
    vector<string> mark;//标记 主标记放在第一个
};

extern vector <quat_item> QUATS;   //存四元式
void showQUATS();    //显示四元式
void optimizeQuats();   //优化函数

#endif // DAG_H_INCLUDED
