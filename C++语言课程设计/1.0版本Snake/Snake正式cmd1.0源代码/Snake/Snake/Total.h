#pragma once
#include "all_head.h"
using namespace std;
void printnum(int x, int y, int &n);
class Total
{
private:
	int number;
	
	int starttime;//开始时间
	int endtime;//结束时间
	int kinanatime;//上一次暂停时间，开始游戏时赋值为游戏开始时间
	int alltime;//游戏时间
	int blood;//血量
	int op;//操作步数
	int past;//判断是否需要进秒
public:
	int score;//得分
	void addsocre(int _score = 5, int _nature = 0);//增加分数
	void print(Snake &snake);//显示
	void init(Snake &snake);//初始化
	bool iftime();
	friend void pause();
	friend void SignInRank();
	friend direction Snake::change_direction();
};
extern Total total;
void pause();