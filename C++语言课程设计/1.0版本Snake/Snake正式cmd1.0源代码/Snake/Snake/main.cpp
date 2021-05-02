#include "all_head.h"
using namespace std;



/*int main()
{
	//初始化
	//游戏
		//执行
			//sao
		//暂停
		//时间
		//积分
	//游戏结束
		//重来
		//返回QT
}*/

void mapinit(int a)
{
	if (a == 3)
	{
	for (int i = 0; i < 34; i = i ++)
	{
		for (int j = 0; j < 34; j++)
		{
			map[1].mapp[i][j] = 0;
		}
	}
	for (int i = 0; i < 34; i = i + 33)
	{
		for (int j = 0; j < 34; j++)
		{
			map[1].mapp[i][j] = 5;
		}
	}
	for (int j = 0; j < 34; j = j + 33)
	{
		for (int i = 0; i < 34; i++)
		{
			map[1].mapp[i][j] = 5;
		}
	}
	for (int i = 10; i < 34; i = i + 33)
	{
		for (int j = 5; j <= 20; j++)
		{
			map[1].mapp[i][j] = 4;
		}
	}
	for (int i = 20; i < 34; i = i + 33)
	{
		for (int j = 20; j <= 25; j++)
		{
			map[1].mapp[i][j] = 4;
		}
	}
	}
	else if(a==2)
	{
		for (int i = 0; i < 34; i = i++)
		{
			for (int j = 0; j < 34; j++)
			{
				map[1].mapp[i][j] = 0;
			}
		}
		for (int i = 5; i < 34; i = i + 33)
		{
			for (int j = 0; j < 20; j++)
			{
				map[1].mapp[i][j] = 5;
			}
		}
		for (int i = 3; i < 34; i = i + 33)
		{
			for (int j = 20; j < 34; j++)
			{
				map[1].mapp[i][j] = 5;
			}
		}
		for (int j = 0; j < 34; j = j + 33)
		{
			for (int i = 0; i < 34; i++)
			{
				map[1].mapp[i][j] = 5;
			}
		}
		for (int i = 10; i < 34; i = i + 33)
		{
			for (int j = 5; j <= 20; j++)
			{
				map[1].mapp[i][j] = 4;
			}
		}
		for (int i = 20; i < 34; i = i + 33)
		{
			for (int j = 20; j <= 25; j++)
			{
				map[1].mapp[i][j] = 4;
			}
		}
	}
	else if (a == 1)
	{
		for (int i = 0; i < 34; i = i++)
		{
			for (int j = 0; j < 34; j++)
			{
				map[1].mapp[i][j] = 0;
			}
		}
		for (int i = 0; i < 34; i = i + 33)
		{
			for (int j = 0; j < 34; j++)
			{
				map[1].mapp[i][j] = 5;
			}
		}
		for (int j = 0; j < 34; j = j + 33)
		{
			for (int i = 0; i < 34; i++)
			{
				map[1].mapp[i][j] = 5;
			}
		}
		
	}

}

void lineinit()
{
	for (int i = 0; i <510 ; i++)
	{
		
		putpixel(510, i, WHITE);
		putpixel(511, i, WHITE);

	}
}
void easy(Snake &a, int b)
{
	if (b ==1)
	{
		a.changespeed(20);
		a.changemaxblood(7);
		a.changeblood(7);
	}
	else if(b==2)
	{
		a.changespeed(15);
		a.changemaxblood(4);
		a.changeblood(4);
	}
	else if (b == 3)
	{
		a.changespeed(10);
		a.changemaxblood(4);
		a.changeblood(3);
	}
}
void skininit(int _skin)
{
	if (_skin == 1)
	{
		char path1[] = "./Source/snakebody1.dat";//身体
		char path2[] = "./Source/wall1.dat";
		char path3[] = "./Source/black.dat";
		char path4[] = "./Source/bean1.dat";//豆子
		char path5[] = "./Source/snakehead1.dat";//头
		char path6[] = "./Source/wall2.dat";
		loadphoto(snakebody, path1);
		loadphoto(snakehead, path5);
		loadphoto(bean, path4);
		loadphoto(wall_indistrutible, path2);
		loadphoto(black, path3);
		loadphoto(wall_distructible, path6);
	}
	else if (_skin == 2)
	{
		char path1[] = "./Source/snakehead1.dat";//身体
		char path2[] = "./Source/wall1.dat";
		char path3[] = "./Source/black.dat";
		char path4[] = "./Source/bean1.dat";//豆子
		char path5[] = "./Source/snakebody1.dat";//头
		char path6[] = "./Source/wall2.dat";
		loadphoto(snakebody, path1);
		loadphoto(snakehead, path5);
		loadphoto(bean, path4);
		loadphoto(wall_indistrutible, path2);
		loadphoto(black, path3);
		loadphoto(wall_distructible, path6);
	}
	else if (_skin == 3)
	{
		char path1[] = "./Source/bean1.dat";//身体
		char path2[] = "./Source/wall1.dat";
		char path3[] = "./Source/black.dat";
		char path4[] = "./Source/bean1.dat";//豆子
		char path5[] = "./Source/snakehead1.dat";//头
		char path6[] = "./Source/wall2.dat";
		loadphoto(snakebody, path1);
		loadphoto(snakehead, path5);
		loadphoto(bean, path4);
		loadphoto(wall_indistrutible, path2);
		loadphoto(black, path3);
		loadphoto(wall_distructible, path6);
	}
}
int main()
{
	
	//void Print_snake(pos p_next, pos p_head, pos p_tail);
	/*
	char path1[] = "../Source/snakebody1.dat";
	char path2[] = "../Source/wall1.dat";
	char path3[] = "../Source/black.dat";
	char path4[] = "../Source/bean1.dat";
	char path5[] = "../Source/snakehead1.dat";
	*/
	int _mode, _skin, _speed;
	ifstream _init("./txt/arg.txt");
	_init >> _mode >> _skin >> _speed;
	_init.close();
	srand(time(NULL));
	/*char path1[] = "snakebody1.dat";
	char path2[] = "wall1.dat";
	char path3[] = "black.dat";
	char path4[] = "bean1.dat";
	char path5[] = "snakehead1.dat";
	char path6[] = "wall2.dat";
	loadphoto(snakebody, path1);
	loadphoto(snakehead, path5);
	loadphoto(bean, path4);
	loadphoto(wall_indistrutible, path2);
	loadphoto(black, path3);
	loadphoto(wall_distructible, path6);*/
	int _blood, _maxblood;
	skininit(_skin);
	mapinit(_mode);//地图，1和2选择

	pos snake_head;
	snake_head.x = 17;
	snake_head.y = 17;

	map[1].mapp[17][17] = 2;
	map[1].mapp[17][16] = 1;
	map[1].mapp[17][15] = 1;
	map[1].mapp[17][14] = 1;
	list<pos> snake_body;
	snake_body.push_back({ 17,16 });
	snake_body.push_back({ 17,15 });
	snake_body.push_back({ 17,14 });
	Snake snake1(snake_head, 4, 4, snake_body, 20, 3, s);
	easy(snake1, _speed);//难度，1，2，3选择，3最难，吃五个豆子加速，最高难度最快加到2
	initgraph(660, 510);
	map[1].show();
	///_getch();
	lineinit();
	total.init(snake1);
	mapp = map[1].mapp;
	clock_t t1, t2;
	t1 = clock();
	beanfood.Create();
	while (1)
	{
		t2 = clock();
		if (((t2 - t1) >= 20))//20是刷新间隔
		{
			t1 = t2;
			if (total.iftime())
				total.print(snake1);
			snake1.change_direction();
			if (snake1.ifmove())
			{
				p_next = snake1.getnext();
				p_head = snake1.gethead();
				p_tail = snake1.gettail();
				Judge(snake1);
			}			
			snake1.move();
			
		}
	}
}