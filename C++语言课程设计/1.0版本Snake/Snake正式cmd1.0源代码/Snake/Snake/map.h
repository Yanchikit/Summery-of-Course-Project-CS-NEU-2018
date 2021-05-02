#pragma once
#ifndef MAP_H
#define MAP_H
#include "all_head.h"
//-----------//
const int mapsize = 34;
const int rate = 15;
//0表示空白，1蛇的身体，2蛇的头部，3豆子，4可摧毁墙，5不可摧毁墙
extern COLORREF snakebody[rate][rate];
extern COLORREF snakehead[rate][rate];
extern COLORREF bean[rate][rate];
extern COLORREF wall_distructible[rate][rate];
extern COLORREF wall_indistrutible[rate][rate];
extern COLORREF black[rate][rate];

class Map {
public:
	int mapp[mapsize][mapsize];
	void show();
};

extern Map map[3];
extern pos p_next, p_head, p_tail;

///////////////////函数////////////////////////
void delay(int t);
void Print_snake(pos p_next, pos p_head);
void Print_snake(pos p_next, pos p_head, pos p_tail);
void Judge(Snake &snake);
void pause();

struct Rank {
	string name;
	int score = 0;
	int time = 0;
};

void SignInRank();
#endif
