#include "all_head.h"
using namespace std;

Bean beanfood;

int Random()
{
	int r;
	//srand((int)time(0));
	r = rand() % 34;
	return r;
}

void Bean::Print()
{
	print(bean, BEAN);
}

void Bean::Create()
{
	if (total.score % 25 == 0 && total.score != 0)
	{
		nature = 1;
	}
	BEAN.x = Random();
	BEAN.y = Random();
	if (map[1].mapp[BEAN.x][BEAN.y] == 0)
	{
		map[1].mapp[BEAN.x][BEAN.y] = 3;
		Print();
	}
	else
	{
		Create();
	}
}

