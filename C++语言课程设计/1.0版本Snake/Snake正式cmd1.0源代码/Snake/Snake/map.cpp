#include "all_head.h"
using namespace std;

COLORREF snakebody[rate][rate];
COLORREF snakehead[rate][rate];
COLORREF bean[rate][rate];
COLORREF wall_distructible[rate][rate];
COLORREF wall_indistrutible[rate][rate];
COLORREF black[rate][rate];

Map map[3];
int t = 0;
void Map::show()		//void print(COLORREF photo[][_proportion], pos p)//在p点打印图案
{
	clock_t t1,t2;
	
	cleardevice();
	
	BeginBatchDraw();
	
	for (int i = 0; i < 34; i++)
	{
		for (int j = 0; j < 34; j++)
		{
			if (mapp[i][j] == 0)
			{
				continue;
			}
			else if (mapp[i][j] == 1)	
			{
				pos p;
				p.x = i;
				p.y = j;
				print(snakebody, p);
			}
			else if (mapp[i][j] == 2)
			{
				pos p;
				p.x = i;
				p.y = j;
				print(snakehead, p);
			}
			else if (mapp[i][j] == 3)
			{
				pos p;
				p.x = i;
				p.y = j;
				print(bean, p);
			}
			else if (mapp[i][j] == 4)
			{
				pos p;
				p.x = i;
				p.y = j;
				print(wall_distructible, p);
			}
			else if (mapp[i][j] == 5)
			{
				pos p;
				p.x = i;
				p.y = j;
				print(wall_indistrutible, p);
			}	
		}
	}
	t1 = clock();
	EndBatchDraw();
	t2 = clock();
	cout << t2 - t1 << endl;
			
	
}

void delay(int t)
{
	while (t--);
}

pos p_next, p_head, p_tail;


void Print_snake(pos p_next, pos p_head)
{
	//eatbean
	map[1].mapp[p_next.x][p_next.y] = 2;
	map[1].mapp[p_head.x][p_head.y] = 1;
	print(snakehead, p_next);
	print(snakebody, p_head);

}

void Print_snake(pos p_next, pos p_head, pos p_tail)
{
	map[1].mapp[p_next.x][p_next.y] = 2;
	map[1].mapp[p_head.x][p_head.y] = 1;
	map[1].mapp[p_tail.x][p_tail.y] = 0;
	print(snakehead, p_next);
	print(snakebody, p_head);
	print(black, p_tail);
}

void Judge(Snake &snake)
{
	void SignInRank();
	if (map[1].mapp[p_next.x][p_next.y] == 0)
	{
		Print_snake(p_next, p_head, p_tail);
		return;
	}

	else if (map[1].mapp[p_next.x][p_next.y] == 5|| map[1].mapp[p_next.x][p_next.y] ==1)
	{
		gameover();
	}
	else if (map[1].mapp[p_next.x][p_next.y] == 3)
	{
		
		if (beanfood.nature == 1)
		{
			snake.addblood();
			beanfood.nature = 0;
		}
		Print_snake(p_next, p_head);
		beanfood.Create();
		snake.havebean = 1;
		total.addsocre();
		total.print(snake);
		return;
	}
	else if (map[1].mapp[p_next.x][p_next.y] == 4)
	{
		snake.ifblood();
		total.print(snake);
		Print_snake(p_next, p_head, p_tail);
		if (snake.died() == 1)
			gameover();
	}
}

string TCHARTurnString(TCHAR *STR)

{

	int iLen = WideCharToMultiByte(CP_ACP, 0, STR, -1, NULL, 0, NULL, NULL);


	char* chRtn = new char[iLen * sizeof(char)];

	WideCharToMultiByte(CP_ACP, 0, STR, -1, chRtn, iLen, NULL, NULL);

	string str(chRtn);

	return str;

}



void SignInRank()
{
	Rank rankFile[6];
	TCHAR name[16];
	InputBox(name, 16, _T("请输入用户名(英文字符15个以内)"));
	//outtext(name);
	//closegraph();
	string user_name;
	user_name = TCHARTurnString(name);

	rankFile[5].name = user_name;
	rankFile[5].score = total.score;
	rankFile[5].time = total.alltime;

	ifstream infile("./txt/Rank.txt", ios::in);
	char title[6];
	infile >> title;
	//cout << title;
	for (int i = 1; i <= 5; i++)
	{
		int n;
		char No[5];
		char useless[3][10];
		string name;
		int score, time;
		infile >> No >> n >> useless[0] >> name >> useless[1] >> score >> useless[2] >> time;
		//cout << No << n << useless[0] << name << useless[1] << score << useless[2] << time;
		rankFile[n-1].name = name;
		rankFile[n - 1].score = score;
		rankFile[n - 1].time = time;
	}
	infile.close();

	for (int i = 4; i >= 0; i--)
	{
		if (rankFile[i + 1].score < rankFile[i].score)
		{
			break;
		}
		else if (rankFile[i + 1].score == rankFile[i].score)
		{
			if (rankFile[i + 1].time >= rankFile[i].time)
			{
				break;
			}
			else
			{
				swap(rankFile[i + 1], rankFile[i]);
			}
		}
		else
		{
			swap(rankFile[i + 1], rankFile[i]);
		}
	}

	ofstream outfile("./txt/Rank.txt", ios::out);
	outfile << title << endl;
	for (int i = 0; i < 5; i ++)
	{
		outfile << "No " << i + 1 << endl;
		outfile << "Name: " << rankFile[i].name << " Score: " << rankFile[i].score << " Time: " << rankFile[i].time << endl;
	}
	outfile.close();
	


}

