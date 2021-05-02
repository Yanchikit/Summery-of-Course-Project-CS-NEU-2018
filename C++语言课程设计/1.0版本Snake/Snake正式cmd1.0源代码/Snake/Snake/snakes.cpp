#pragma once
#include "all_head.h"
using namespace std;
//添加的额外函数
//int mapp[510 / _proportion][510 / _proportion];
int(*mapp)[34];
istream &operator>>(istream &in, list<pos> &a)
{
	if (!a.empty())
	{
		cout << "不是空的！" << endl;
		return in;
	}
	cout << "请输入长度" << endl;
	int n;
	in >> n;
	pos p;
	for (int i = 0; i < n; i++)
	{
		cout << "请输入第" << i << "个" << endl;
		in >> p.x >> p.y;
		a.push_back(p);
	}
	return in;
}
bool keyboardhit(char &c)//如果接受到按键，返回1，否则返回0。将按键的值存在c中，如果接受到的是两位字节，将进行特殊处理
{
	char d;
	if (_kbhit())
	{
		c = _getch();
		if ((c == 0) || (c == 0xE0) || (c == -32))//如果接受到两位字节的按键
		{
			d = _getch();
			if (c == -32)
				switch (d)
				{
				case 72:
					c = 'w';
					break;
				case 80:
					c = 's';
					break;
				case 75:
					c = 'a';
					break;
				case 77:
					c = 'd';
					break;
				default:
					c = 0;
					break;
				}
		}
		//将方向键转化为小写的wasd
		if ((c >= 'A') && (c <= 'Z'))
			c = c - ('A' - 'a');
		return 1;
	}
	else return 0;
}
bool operator ==(pos &p1, pos &p2)
{
	if ((p1.x == p2.x) && (p1.y == p2.y))
		return 1;
	else return 0;
}
/*
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
	bool havebean;
public:
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
	pos gethead();
	pos gettail();
	pos getfirstbody();
	list<pos> getbody();
	pos getnext();
};
*/
Snake::Snake(pos _head, int _blood, int _maxblood, list<pos> &_body, int _speed, int _len/* = 3*/, direction _dir/* = d*/)
{
	head = _head;
	blood = _blood;
	maxblood = _maxblood;
	body = _body;
	speed = _speed;
	len = _len;
	dir = _dir;
	past = 0;
	ifnext = 0;
	havebean = 0;
	speedpast = 0;
}
bool Snake::ifmove()
{
	past++;
	if (past >= speed)
	{
		past = 0;
		ifnext = 1;
		switch (dir)
		{
		case w:
			next.x = head.x;
			next.y = head.y - 1;//向上一格
			break;
		case a:
			next.x = head.x - 1;
			next.y = head.y;//向左一格
			break;
		case s:
			next.x = head.x;
			next.y = head.y + 1;//向下一格
			break;
		case d:
			next.x = head.x + 1;
			next.y = head.y;//向右一格
			break;
		default:
			break;
		}
		(*this).correctmove();
		return 1;
	}
	else return 0;
}
void Snake::correctmove()
{
	next.x = (next.x + (510 / _proportion)) % (510 / _proportion);
	next.y = (next.y + (510 / _proportion)) % (510 / _proportion);
}
void Snake::move()
{
	if (ifnext)
	{
		if (havebean)//吃到豆子~
		{
			mapp[head.x][head.y] = 1;//原来头部位置变成身体
			body.push_front(head);
			head = next;
			mapp[head.x][head.y] = 2;//头部移动
			havebean = 0;
			speedpast++;
			this->changespeed();
		}
		else
		{
			body.push_front(head);
			mapp[body.back().x][body.back().y] = 0;
			body.pop_back();//删除尾部
			mapp[head.x][head.y] = 1;//头部变成身体
			head = next;
			mapp[head.x][head.y] = 2;//头部移动
		}
	}
	ifnext = 0;
}
bool Snake::died(int key/*=0*/)
{
	bool ifdied = 0;
	if (ifnext)
	{
		if (key)//不可摧毁墙
			return 1;
		else if (blood <= 0)//血量低于0
			return 1;
	}
	return 0;
}
/*bool Snake::eatfood()
{
	if (ifnext)
	{
		if (mapp[next.x][next.y] == 3)
		{
			return 1;
		}
	}
	return 0;
}
void Snake::addlenth()
{
	len++;
	body.push_front(head);
}*/
void Snake::eatfood()
{
	havebean = 1;
	len++;
	body.push_front(head);
}
direction Snake::getdirection()
{
	return dir;
}
direction Snake::change_direction()
{
	char c;
	pos p = body.front();
	if (keyboardhit(c))
	{
		switch (c)
		{
		case 'w':
			if (!((head.x == p.x) && ((head.y - 1) == p.y)))
				dir = w;
			break;
		case 'a':
			if (!(((head.x - 1) == p.x) && (head.y == p.y)))
				dir = a;
			break;
		case 's':
			if (!((head.x == p.x) && ((head.y + 1) == p.y)))
				dir = s;
			break;
		case 'd':
			if (!(((head.x + 1) == p.x) && (head.y == p.y)))
				dir = d;
			break;
		case (char)27:
			pause();
			break;
		default:
			break;
		}
	}
	return dir;
}
bool Snake::ifblood()
{
	if (ifnext)
	{
		blood = blood - losebase;
		return 1;
	}
	return 0;
}
int Snake::getblood()
{
	return blood;
}
void Snake::changespeed(int ss/* =0 */)
{
	if (ss == 0)
	{
		if ((speedpast >= 5) && (speed >5))
		{
			speed = speed - 4;
			speedpast = 0;
		}
	}
	else
	{
		speed = ss;
	}
}
pos Snake::gethead()
{
	return head;
}
pos Snake::gettail()
{
	return body.back();
}
pos Snake::getfirstbody()
{
	return body.front();
}
list<pos> Snake::getbody()
{
	return body;
}
pos Snake::getnext()
{
	return next;
}
void gameover()
{
	TCHAR t4[] = _T("Game over");
	outtextxy(510 + 45, 510 - 120, t4);
	SignInRank();
	outtextxy(510 + 45, 510 - 90, _T("1重新开始"));
	outtextxy(510 + 5, 510 - 60, _T("其他键返回开始界面"));
	if (_mygetch() == '1')
	{
		system("start ./exe./Snake.exe");
		exit(0);//关闭游戏重新打开
	}
	else
	{
		system("start ./GreedSnake.exe");//打开游戏开始界面
		exit(0);
	}
}
int Snake::addblood(int i/*=1*/)//增加血量
{
	blood += i;
	if (blood > maxblood)
		blood = maxblood;
	return blood;
}
void Snake::changeblood(int bb)//改变血量
{
	blood = bb;
}
void Snake::changemaxblood(int bb)//改变最大血量
{
	maxblood = bb;
}
