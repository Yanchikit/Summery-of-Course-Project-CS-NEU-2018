#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <conio.h>
#include "Chain.h"
#include <windows.h>
void getstime(int *a, int *b, int *c)        //调取时间函数，a为年,b为月,c为日
{
	time_t temp;
	struct tm *t;
	time(&temp);
	t = localtime(&temp);
	*a = t->tm_year + 1900;
	*b = t->tm_mon + 1;
	*c = t->tm_mday;
}

int Login()                     //登陆界面
{
	int C1, Per;                        //C1作为第一个操作判断值1、2、0
	printf(">>登陆界面\n\n");
	printf("(1)登陆\n(2)注册\n(0)退出\n\n");
	printf(">>请输入操作指令\n>>");
	scanf("%d", &C1);                    //输入索要执行的操作
	getchar();
	while (C1 != 1 && C1 != 2 && C1 != 0)
	{
		system("cls");
		printf(">>登陆界面\n\n");
		printf(">>指令错误\n>>请输入正确的操作序号\n");
		printf("(1)登陆\n(2)注册\n(0)退出\n>>");
		scanf("%d", &C1);
		getchar();
	}
	Per = Choice1(C1);
	while (Per == 9)                 //返回值为9  账号密码错误
	{
		system("cls");
		printf(">>登陆界面\n\n");
		printf(">>账户或密码错误\n");
		printf(">>是否进行注册\n\n");
		printf("(1)继续登陆\n(2)注册(0)退出\n>>");
		scanf("%d", &C1);
		getchar();
		Per = Choice1(C1);
	}
	if (Per == 1)                      //Per==1   管理员登陆
	{
		Commander();
	}
	if (Per == 2)          //用户操作界面
	{
		User();
	}
	if (Per=0)
    {
        exit(0);
    }
	return Per;
}

int Choice1(int C)
{
	int Permission;
	if (1 == C)                                //C1==1  登陆
	{
		system("cls");
		Permission = SignIn();
	}
	else if (2 == C)                       //C1==2   注册后登陆
	{
		system("cls");
		Register();
		//Permission == SignIn();
		Login();
	}
	else if (0 == C)                 //C1==0    退出系统
	{
		system("cls");
		exit(0);
	}
	return Permission;
}                    //第一级菜单

int main()
{
    system("color F0");
	Login();                          //进入登陆界面
	return 0;

}                        //主函数
