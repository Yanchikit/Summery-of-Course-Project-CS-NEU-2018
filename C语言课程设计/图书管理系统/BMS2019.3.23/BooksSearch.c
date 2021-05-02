#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <conio.h>
#include "Chain.h"
void Print(struct BooksInfo *p)                 //打印函数
{
	printf("书籍名称:%s\n", p->name);
	printf("ISBN:%s\t", p->ISBN);
	printf("书籍编号:%s\t", p->BianHao);
	printf("作者:%s\t", p->writer);
	printf("单价:%.2f\t", p->price);
	printf("出版社:%s\t", p->print);
	printf("出版时间:%d年 ", p->PubTime.year);
	printf("%d月\t", p->PubTime.mon);
	//printf("%d日 ", p->PubTime.day);
	printf("类别:%s\t", p->cate);
	if (p->zt == 0)
	{
		printf("未借出\n");
	}
	else
	{
		printf("\t已借出\t ");
		printf("借书人：%s\n", p->BorrowStu_id);
	}
}

int Compare(char ino[], char org[])                               //对比关键字函数   1有   0无
{
	int t, k1, k2;
	k1 = strlen(ino);
	k2 = strlen(org);
	t = 0;
	for (int j = 0; j <= k2 - k1; j++)
	{
		int d;
		d = j;
		for (int h = 0; h < k1; h++, d++)
		{
			if (ino[h] == org[d])
			{
				t = 1;
			}
			else
			{
				t = 0;
				break;
			}
		}
		if (t == 1)
		{
			return 1;
		}
	}
	return 0;
}

void SearchName(int per)                    //按书名检索书籍
{
    system("cls");
	struct  BooksInfo *pHead, *p, *q;
	char BookName[30];
	printf("请输入书籍名：\n");                 //输入关键字
	gets(BookName);
	q = p = pHead = OpenFile2();
	int n = 0;                              //打开书籍库文件
	while (q != NULL)
	{
		int t = 0;
		p = q;
		t = Compare(BookName, p->name);                //比较关键字
		if (1 == t)
		{
			Print(p);                             //输出相关信息
			n++;
		}
		q = p->next;
	}
	if (n == 0)
	{
		printf("无检索结果\n");
	}
	else printf("总共有%d条结果\n", n);
	int k;
	printf("输入0返回上一级\n");
	scanf("%d", &k);
	getchar();
	while (k != 0)
	{
		printf("请输入正确的指令\n");
		scanf("%d", &k);
		getchar();
	}
	BookSearch(per);
}

void SearchBianhao(int per)
{
    system("cls");
	struct  BooksInfo *pHead, *p, *q;
	char BookBianhao[30];
	printf("请输入书籍编号：\n");                 //输入关键字
	gets(BookBianhao);
	pHead = q = p = OpenFile2();                               //打开书籍库文件
	int n = 0;
	while (q != NULL)
	{
		p = q;
		int t = 0;
		//puts(p->BianHao);
		t = Compare(BookBianhao, p->BianHao);                //比较关键字
		if (1 == t)                       //1 存在关键字
		{
			Print(p);
			printf("\n");                            //输出相关信息
			n++;
		}
		q = p->next;
	}
	if (n == 0)
	{
		printf("无检索结果\n");
	}
	else printf("总共有%d条结果\n", n);
	int k;
	printf("输入0返回上一级\n");
	scanf("%d", &k);
	getchar();
	while (k != 0)
	{
		printf("请输入正确的指令\n");
		scanf("%d", &k);
		getchar();
	}
	BookSearch(per);

}

void SearchWriter(int per)
{
    system("cls");
	struct  BooksInfo *pHead, *p, *q;
	char BookWriter[30];
	printf("请输入作者：\n");                 //输入关键字
	gets(BookWriter);
	q = p = pHead = OpenFile2();                               //打开书籍库文件
	int n = 0;
	while (q != NULL)
	{
		int t = 0;
		p = q;
		t = Compare(BookWriter, p->writer);                //比较关键字
		if (1 == t)
		{
			Print(p);                             //输出相关信息
			n++;
		}
		q = p->next;
	}
	if (n == 0)
	{
		printf("无检索结果\n");
	}
	else printf("总共有%d条结果\n", n);
	int k;
	printf("输入0返回上一级\n");
	scanf("%d", &k);
	getchar();
	while (k != 0)
	{
		printf("请输入正确的指令\n");
		scanf("%d", &k);
		getchar();
	}
	BookSearch(per);
}

void SearchPress(int per)
{
    system("cls");
	struct  BooksInfo *pHead, *p, *q;
	char BookPress[30];
	printf("请输入出版社名称：\n");                 //输入关键字
	gets(BookPress);
	q = p = pHead = OpenFile2();                               //打开书籍库文件
	int n = 0;
	while (q != NULL)
	{
		int t = 0;
		p = q;
		t = Compare(BookPress, p->print);                //比较关键字
		if (1 == t)
		{
			Print(p);                             //输出相关信息
			n++;
		}
		q = p->next;
	}
	if (n == 0)
	{
		printf("无检索结果\n");
	}
	else printf("总共有%d条结果\n", n);
	int k;
	printf("输入0返回上一级\n");
	scanf("%d", &k);
	getchar();
	while (k != 0)
	{
		printf("请输入正确的指令\n");
		scanf("%d", &k);
		getchar();
	}
	BookSearch(per);
}

void SearchClass(int per)
{
    system("cls");
	struct  BooksInfo *pHead, *p, *q;
	char BookClass[30];
	printf("请输入出版社名称：\n");                 //输入关键字
	gets(BookClass);
	p = q = pHead = OpenFile2();				 //打开书籍库文件
	int n;
	n = 0;
	while (q != NULL)
	{
		int t = 0;
		p = q;
		t = Compare(BookClass, p->cate);                //比较关键字
		if (1 == t)
		{
			Print(p);                             //输出相关信息
			n++;
		}
		q = p->next;
	}

	if (n == 0)
	{
		printf("无检索结果\n");
	}
	else printf("总共有%d条结果\n", n);
	int k;
	printf("输入0返回上一级\n");
	scanf("%d", &k);
	getchar();
	while (k != 0)
	{
		printf("请输入正确的指令\n");
		scanf("%d", &k);
		getchar();
	}
	BookSearch(per);
}

void BookSearch(int per)
{
	int T3;
	printf("请输入检索类别\n");
	printf("1、书籍名称\n2、书籍编号\n3、作者\n4、出版社\n5、图书类别\n0、返回上一级\n");
	scanf("%d", &T3);
	getchar();
	while (T3 < 0 || T3>5)
	{
		printf("请输入正确的命令\n");
		printf("1、书籍名称\n2、书籍编号\n3、作者\n4、出版社\n5、图书类别\n0、返回上一级\n");
		scanf("%d", &T3);
		getchar();
	}
	switch (T3)
	{
	case 1: SearchName(per); break;
	case 2: SearchBianhao(per); break;
	case 3: SearchWriter(per); break;
	case 4: SearchPress(per); break;
	case 5: SearchClass(per); break;
	case 0: {if (per == 2)User(); else Commander(); break; }
	}
}

struct BooksInfo *SearchBianhao2(char BookBianhao[], struct  BooksInfo *pHead)
{
	struct BooksInfo*p, *q;
	q = p = pHead;                               //打开书籍库文件
	int n = 0;
	while (q != NULL)
	{
		p = q;
		int t = 0;
		t = Compare(BookBianhao, p->BianHao);                //比较关键字
		if (1 == t)
		{
			Print(p);                             //输出相关信息
			n++;
		}
		q = p->next;
	}
	printf("总共有%d条结果\n", n);
	int k;
	printf("输入0返回上一级 输入1继续操作\n");
	scanf("%d", &k);
	getchar();
	while (k != 0 && k != 1)
	{
		printf("请输入正确的指令\n");
		printf("输入0返回上一级 输入1继续操作\n");
		scanf("%d", &k);
		getchar();
	}
	if (k == 0)
	{
		Commander();
	}
	else if (k == 1)
	{
		while (n != 1)
		{
			printf("请再次输入图书编号以确定修改(请精确至某一本书籍)：\n");
			char BianHao[30];
			gets(BianHao);
			system("cls");
			p = q = pHead;
			int n = 0;
			while (q != NULL)
			{
				p = q;
				int t = 0;
				t = Compare(BianHao, p->BianHao);                //比较关键字
				if (1 == t)
				{
					Print(p);                             //输出相关信息
					n++;
				}
				q = p->next;
			}
			printf("总共有%d条结果\n", n);
			if (n == 1) return p;
			int g;
			printf("0、返回上一级 1、继续\n");
			scanf("%d", &g);
			getchar();
			if (0 == g)	Commander();
		}
		return p;       //返回图书地址

	}

}
