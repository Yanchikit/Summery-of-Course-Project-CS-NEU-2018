#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <conio.h>
#include "Chain.h"
void  BooksRegister()//图书信息录入函数，返回指向链表头的指针
{
	struct BooksInfo* head;//链表头地址
	struct BooksInfo* p1, *p2;
	head = p1 = p2 = (struct BooksInfo*)malloc(LLL);//开辟动态储存空间
	int t = 1;
	while (t != 0)
	{
		p1 = p2;
		printf("请输入图书名称:");
		gets(p1->name);
		printf("请输入ISBN:");
		gets(p1->ISBN);
		printf("请输入图书编号:");
		gets(p1->BianHao);
		printf("请输入定价:");
		scanf("%f", &p1->price);
		getchar();
		//printf("请输入库存数量:");
		//scanf("%d", &p1->num);
		printf("请输入作者:");
		gets(p1->writer);
		printf("请输入出版社:");
		gets(p1->print);
		printf("请输入出版时间（年.月）:");
		scanf("%d.%d", &p1->PubTime.year, &p1->PubTime.mon);
		getchar();
		printf("请输入书籍分类：");
		gets(p1->cate);
		printf("\n");
		p1->zt = 0;//默认未借出，图书状态值为0
		p2 = (struct BooksInfo*)malloc(LLL);
		p1->next = p2;
		printf("请输入0结束或输入1继续\n");
		scanf("%d", &t);
		getchar();
		system("cls");
	}
	p1->next = NULL;
	free(p2);
	SaveFile2(head);
	Freechain2(head);
	Commander();
};

void BooksInsert(struct BooksInfo *head)//插入新书
{
	struct BooksInfo*p1, *p2;
	//链表头地址

	int t = 1;
	while (t != 0)
	{
		p1 = (struct BooksInfo*)malloc(LLL);
		printf("请输入图书名称:");
		gets(p1->name);
		printf("请输入ISBN:");
		gets(p1->ISBN);
		printf("请输入图书编号:");
		gets(p1->BianHao);
		printf("请输入定价:");
		scanf("%f", &p1->price);
		getchar();
		//printf("请输入库存数量:");
		//scanf("%d", &p1->num);
		printf("请输入作者:");
		gets(p1->writer);
		printf("请输入出版社:");
		gets(p1->print);
		printf("请输入出版时间（年.月）:");
		scanf("%d.%d", &p1->PubTime.year, &p1->PubTime.mon);
		getchar();
		printf("请输入书籍分类：");
		gets(p1->cate);
		p1->zt = 0;//默认未借出，图书状态值为0
		p1->next = head;
		head = p1;
		printf("请输入0结束或输入1继续\n");
		scanf("%d", &t);
		getchar();
	}
	SaveFile2(head);
	Freechain2(head);
	Commander();
};

void BooksEdit(void)
{
	char BookBianhao[30];
	printf("请输入书籍编号：\n");                 //输入关键字
	gets(BookBianhao);
	struct BooksInfo*p1, *head;
	head = OpenFile2();
	p1 = SearchBianhao2(BookBianhao, head);//搜索书籍 返回地址
	int t = 1;
	while (t != 0)
	{
		int a;//菜单所读取选项
		printf("请输入编辑选项：1、书名修改\n");
		printf("\t\t2、书籍ISBN修改\n");
		printf("\t\t3、书籍编号修改\n");
		printf("\t\t4、书籍定价修改\n");
		printf("\t\t5、书籍库存数量修改\n");
		printf("\t\t6、书籍作者修改\n");
		printf("\t\t7、书籍出版社修改\n");
		printf("\t\t8、书籍出版时间修改\n");
		printf("\t\t9、书籍所属分类修改\n");
		printf("\t\t0、返回上一级\n");
		scanf("%d", &a);
		getchar();
		while (a!=0&&a != 1 && a != 2 && a != 3 && a != 4 && a != 5 && a != 6 && a != 7 && a != 8 && a != 9)
		{
			printf("输入错误,请重新输入\n");
			scanf("%d", &a);
		}
		switch (a)
		{
		case 1:printf("请输入新书名："); scanf("%s", p1->name); break;
		case 2:printf("请输入ISBN:"); scanf("%s", p1->ISBN); break;
		case 3:printf("请输入图书编号:"); scanf("%s", &p1->BianHao); break;
		case 4:printf("请输入定价:"); scanf("%f", &p1->price); break;
		case 6:printf("请输入作者:"); scanf("%s", p1->writer); break;
		case 7:printf("请输入出版社:"); scanf("%s", p1->print); break;
		case 8:printf("请输入出版时间（年.月）:"); scanf("%d.%d", &p1->PubTime.year, &p1->PubTime.mon); break;
		case 9:printf("请输入书籍分类:"); scanf("%s", p1->cate); break;
		case 0:Commander();
		}
		printf("1、继续修改\n0、返回上一级\n");
		scanf("%d", &t);
		getchar();
		system("cls");
		while (t != 1 && t != 0)
		{
			printf("输入指令错误，请重新输入\n");
			printf("1、继续修改\n0、返回上一级\n");
			scanf("%d", &t);
			getchar();
		}
	}
	SaveFile2(head);
	Commander();
};

void BooksDelete()
{
	char BookBianhao[30];
	printf("请输入书籍编号：\n");                 //输入关键字
	gets(BookBianhao);
	struct BooksInfo*q, *head, *p, *m;
	m = NULL;
	q = p = head = OpenFile2();
	int n = 0;
	while (q != NULL)
	{
		m = p;
		p = q;
		q = p->next;
		int t = 0;
		t = Compare(BookBianhao, p->BianHao);                //比较关键字
		if (1 == t)
		{
			Print(p);                             //输出相关信息
			n++;
		}
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
			printf("请再次输入图书编号以确定删除(请精确至某一本书籍)：\n");
			char BianHao[30];
			gets(BianHao);
			p = q = m = head;
			int n = 0;
			while (q != NULL)
			{
				m = p;
				p = q;
				q = p->next;
				int t = 0;
				t = Compare(BianHao, p->BianHao);                //比较关键字
				if (1 == t)
				{
					Print(p);                             //输出相关信息
					n++;
				}
			}
			printf("总共有%d条结果\n", n);
			int g;
			printf("0、返回上一级 1、继续\n");
			scanf("%d", &g);
			getchar();
			if (0 == g)	Commander();
			else if (n == 1) break;
		}
		int a;
		printf("查找到图书，请确认是否删除：1、是\n2、返回上一级");
		scanf("%d", &a);
		getchar();
		while (a != 1 && a != 2)
		{
			printf("输入错误，请重新确认是否删除：\n1、是\n2、返回上一级\n");
			scanf("%d", &a);
			getchar();
		}
		if (a == 1)
		{
			if (p == head)
			{
				head = q;
			}
			else
			{
				m->next = q;
			}
			free(p);
			printf("删除书籍成功\n输入任意命令返回\n");
			getchar();
			SaveFile2(head);
			Commander();
		}
		else
		{
			Commander();
		}
	}
}
