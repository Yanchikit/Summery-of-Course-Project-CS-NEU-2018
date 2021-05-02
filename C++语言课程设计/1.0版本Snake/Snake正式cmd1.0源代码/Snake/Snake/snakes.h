#pragma once
#include "all_head.h"
//下面这行应该被注释掉

const int losebase = 1;
extern int(*mapp)[34];
using namespace std;
//添加的额外函数

class Snake
{
private:
	int len;
	list<pos> body;
	pos head;
	int speed;
	direction dir;
	int blood;
	int maxblood;
	int past;
	bool ifnext;//下一步是否有效,0无效,1有效
	pos next;//下一步位置
	int speedpast;
public:
	bool havebean;
	Snake(pos _head, int _blood, int _maxblood, list<pos> &_body, int _speed, int _len = 3, direction _dir = d);
	bool ifmove();//是否移动,移动时修改ifnext并记录下一格
	//以下函数需要在ifmove（）使用后使用
	void correctmove();//修正下一步超出地图的现象，修正返回1，否则返回0
	void move();//将蛇在地图矩阵上进行修改
	bool died(int key = 0);//判断是否死亡，返回1死亡，返回0存活
	//bool eatfood();//判断是否吃到食物，吃到返回1，没吃到返回0
	//void addlenth();//增加长度，在身体链表中增加一个头部
	void eatfood();//吃豆子后改变蛇的数学
	direction change_direction();//从键盘上接受按键，改变方向
	direction getdirection();//返回蛇现在的方向
	void changespeed(int ss = 0);//改变速度，未做完
	bool ifblood();//判断是否撞到可摧毁墙，并扣除血量。如果撞到返回1，否则返回0
	int getblood();//返回血量
	int addblood(int i = 1);//增加血量
	pos gethead();
	pos gettail();
	pos getfirstbody();
	list<pos> getbody();
	pos getnext();
	void changeblood(int bb);//改变血量
	void changemaxblood(int bb);//改变最大血量
};

//class Snake;
istream &operator>>(istream &in, list<pos> &a);
bool keyboardhit(char &c);//如果接受到按键，返回1，否则返回0。将按键的值存在c中，如果接受到的是两位字节，将进行特殊处理
bool operator ==(pos &p1, pos &p2);
void gameover();