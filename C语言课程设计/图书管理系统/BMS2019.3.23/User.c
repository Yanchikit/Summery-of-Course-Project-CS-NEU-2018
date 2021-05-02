#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <conio.h>
#include "Chain.h"


void  User()
{
    struct User *SearchUser1(struct User*pHead,char stu[10]);
	int C;                       //C2作为二级菜单判断值
	system("cls");
	printf(">>亲爱的用户，欢迎登陆\n\n");
	printf(">>功能选单\n\n");
	printf("(1)用户中心\n(2)书籍查询\n");
	printf("(3)借还记录查询\n(0)退出程序\n>>");
	scanf("%d", &C);
	getchar();
	while (C != 1 && C != 2 && C != 3 && C != 0)             //错误指令
	{
		system("cls");
		printf(">>亲爱的用户，欢迎登陆\n");
		printf(">>请输入正确的操作序号\n\n");
		printf(">>功能选单\n\n");
        printf("(1)用户中心\n(2)书籍查询\n");
        printf("(3)借还记录查询\n(0)退出程序\n>>");
		scanf("%d", &C);
		getchar();
	}
	if (1 == C)                   //用户中心
	{
		system("cls");
		UserDate2();
	}
	else if (2 == C)                //书籍查询
	{
		system("cls");
		BookSearch(2);
	}
	else if (3 == C)              //书籍借还记录查询
	{
		/*system("cls");
		UserBooksBAR();*/
		system("cls");
		struct User*pHead, *p;
	    pHead = OpenFile1();
	    p = SearchUser1(pHead,loadingstu_id);
		UserBooksBAR1(p);
		Freechain(pHead);

	}

	else if (0 == C)              //退出程序
	{
		system("cls");
		Login();
	}
}                         //用户操作界面


int LongJudge(char *pch,int n)                                     //判断输入是否超出长度
{
    int  l;
    l=strlen(pch);
	if (l>15)
	{
		return 0;                            //   0超出       1 合法
	}
	else
	{

		return 1;
	}
}

int Num(char *pch, int n)                        //判断字节中是否含有字符     0 含有   1 纯数字
{
	int i, m;
	for (i = 0; i < n; i++)
	{
		if (*(pch + i) < '0' || *(pch + i) > '9')
		{
			return 0;
		}
	}
	return 1;
}

int NumJudge(char *pch, int n)
{
	if (Num(pch, n) == 0 /*|| LongJudge(pch, n) == 0 || LongJudge(pch, n - 1) == 1*/)
	{
		return 0;
	}
	else return 1;
}

void PutIn(struct User*pNew)              //输入函数
{
    printf(">>注册界面\n\n");
	printf(">>请输入姓名：");
	gets(pNew->user.name);
	printf(">>请输入学号：");
	gets(pNew->user.stu_id);
	printf(">>请输入专业：");
	gets(pNew->user.major);
	printf(">>请输入身份证号：");
	gets(pNew->user.id);
	printf(">>请输入手机号码：");
	gets(pNew->user.tel);
	printf(">>请输入密码(十五位以内)：");
	gets(pNew->user.password);
	strcpy(pNew->user.per, "user");
	pNew->n = 0;
}

int Judge(struct User*pNew)
{//判断结果显示
	int k = 1;
	system("cls");
	printf(">>注册界面\n\n");
	if (NumJudge(pNew->user.stu_id, 8) == 0)
	{
		k = 0;
		printf(">>请核实学号\n");
		puts(pNew->user.stu_id);
	}
	if (NumJudge(pNew->user.tel, 11) == 0)
	{
		k = 0;
		printf(">>请核实手机号码\n");
		puts(pNew->user.tel);
	}
	if (NumJudge(pNew->user.id, 18) == 0)
	{
		k = 0;
		printf(">>请核实身份证号\n");
		puts(pNew->user.id);
	}
	if (LongJudge(pNew->user.password,15) == 0)
	{
		k = 0;
		printf("请核实密码（不能超过15位）\n");
		puts(pNew->user.password);
	}
	return k;

}                 //判断输入合法

struct User *Creat()                 //建立函数
{
	struct User*pHead = NULL;
	struct User*pNew;
	pNew = (struct User*)malloc(sizeof(struct User));
	PutIn(pNew);
	int k;
	k = Judge(pNew);                   //返回判断值 1合法 0不合法
	if (1 == k)
	{
		pHead = pNew;
		printf(">>注册界面\n\n");
		printf(">>注册成功，请登录\n");
		strcpy(pNew->user.per, "administrator");
		pNew->next = NULL;
	}
	else
	{
		free(pNew);
		pHead = NULL;
	}
	return pHead;                  //返回首地址
}

struct User *Insert(struct User*pHead)    //新增用户
{
	struct User*pNew;
	pNew = (struct User*)malloc(sizeof(struct User));
	PutIn(pNew);
	int k;
	k = Judge(pNew);                   //返回判断值 1合法 0不合法
	if (1 == k)
	{
		pNew->next = pHead;
		pHead = pNew;
		system("cls");
		printf(">>注册成功，请登录\n");
	}
	else
	{
		free(pNew);
	}
	return pHead;
}

void Register()                      //注册函数
{
	struct User*pHead;
	pHead = OpenFile1();
	if (pHead == NULL)
	{
		pHead = Creat();
		while (NULL == pHead)
		{
			printf(">>注册失败\n");
			int t=1;
			printf("1、继续注册\n0、返回主界面\n");
			scanf("%d",&t);
			getchar();
			while(t!=0)
            {
                pHead = Creat();
                printf("1、继续注册\n0、返回主界面\n");
                scanf("%d",&t);
                getchar();
            }
            if(t==0)    {system("cls");Login();}
		}
		SaveFile1(pHead);
		Freechain(pHead);
	}
	else
	{
		struct User*p;
		p = pHead;
		pHead = Insert(p);
		while (p == pHead)
		{
			printf(">>注册失败\n");
			int t=1;
			printf("1、继续注册\n0、返回主界面\n");
			scanf("%d",&t);
			getchar();
			while(t!=0)
            {
                pHead = Insert(p);
                printf("1、继续注册\n0、返回主界面\n");
                scanf("%d",&t);
                getchar();
            }
            if(t==0)    {system("cls");Login();}
		}
		SaveFile1(pHead);
		Freechain(pHead);
	}
}


/////////////////////////////Sign in
void Hide(char *password)
{
	int i;
	for (i = 0; i < 15; i++)
	{
		*(password + i) = getch();
		if (*(password + i) == '\r')
			break;
		else if (*(password + i) == '\b')
		{
			i = i - 2;
			printf("\b");
		}
		else
			printf("*");
	}
	*(password + i) = '\0';
}

void Code(char*stu_id, char*code)                     //登陆输入
{
    printf(">>登陆界面\n\n");
	printf(">>请输入您的账号密码\n\n");
	printf(">>学号:");
	gets(stu_id);
	printf(">>密码:");
	Hide(code);
}

int Confirm(char*stu_id, char*code)            //登陆验证函数
{
	int T;               //判断值   T 1管理员   2、用户   0错误
	T = SearchLogin(stu_id, code);
	//printf("%d", T);
	if (1 == T)
	{
		return 1;
	}
	else if (2 == T)
	{
		return 2;
	}
	else if (0 == T)
	{
		return 9;
	}
}

int SignIn()                                     //登陆函数
{
	char stu_id[8];
	char code[15];
	int Per;                          //权限  1、管理员   2、用户    9、账号密码错误
	Code(stu_id, code);                  //输入账户密码
	Per = Confirm(stu_id, code);
	system("cls");
	return Per;
}

void UserDate2()                //用户中心
{
	printf(">>用户中心：\n\n");
	struct User *pHead, *p;
	p = pHead = OpenFile1();
	while (strcmp(loadingstu_id, p->user.stu_id) != 0)
	{
		p = p->next;
	}
	PrintUserInfo(p);
	int t;
	printf("(1)修改信息\n(0)返回上一级\n>>");
	scanf("%d", &t);
	getchar();
	while (t != 0 && t != 1)
	{
	    printf(">>用户中心：\n\n");
		printf(">>请输入正确指令\n>>");
		scanf("%d", &t);
		getchar();
	}
	if (1 == t) UserEdit();
	else if (0 == t) User();

}

void UserEdit()              //用户信息编辑函数
{
	struct User *pHead, *p;
	p = pHead = OpenFile1();
	while (strcmp(loadingstu_id, p->user.stu_id) != 0)
	{
		p = p->next;
	}
	changestudent(p);
	Freechain(pHead);
	return;
}

void changestudent(struct User*n)            //用户修改信息函数
{
	int a;
	printf(">>修改信息\n\n");
	printf(">>(1)修改手机号\n(2)修改密码\n(3)修改手机号和密码\n(0)返回上一级\n>>");
	scanf("%d", &a);
	if (a == 1)
	{
	    printf(">>原手机号为：");
	    puts(n->user.tel);
		printf(">>修改手机号：");
		gets(n->user.tel);
	}
	else if (a == 2)
	{
	    printf(">>原密码为：");
	    puts(n->user.password);
		printf(">>修改密码：");
		gets(n->user.password);
	}
	else if (a == 3)
	{
	    printf(">>原手机号为：");
	    puts(n->user.tel);
		printf(">>修改手机号：");
		gets(n->user.tel);
		printf(">>原密码为：");
	    puts(n->user.password);
		printf(">>修改密码：");
		gets(n->user.password);
	}
	else if (a == 0)
	{
		User();
	}
	printf(">>按任意键，返回上一级\n");
	getchar();
	User();
}

void PrintUserInfo(struct User*p)                  //打印用户信息
{
	printf(">>姓名:%s\n", p->user.name);
	printf(">>学号:%s\n", p->user.stu_id);
	printf(">>身份证号:%s\n", p->user.id);
	printf(">>电话:%s\n", p->user.tel);
	printf(">>专业:%s\n", p->user.major);
	printf(">>密码:%s\n", p->user.password);
	printf(">>借阅:%d本书\n\n", p->n);
	for (int j = 0; j < p->n; j++)
	{
		printf(">>借阅书籍名称:%s\n", p->book[j].Bookname);
		printf(">>书籍编号:%s\n", p->book[j].Bian_Hao);
		printf(">>借阅时间:%d年%d月%d日\n", p->book[j].borrowtime.year, p->book[j].borrowtime.mon, p->book[j].borrowtime.day);
		printf(">>截止时间:%d年%d月%d日\n", p->book[j].returntime.year, p->book[j].returntime.mon, p->book[j].returntime.day);
	}
}

struct User *SearchUser(struct User*pHead)                      //通过学号查询并返回地址
{
	char stu[8];
	struct User*p, *q;
	p = pHead;
	printf(">>学号查询\n\n");
	printf(">>请输入用户学号：\n>>");
	gets(stu);
	//puts(stu);
	int t = 0;
	while (NULL != p || t != 1)
	{
		q = p;
		t = Compare(stu, p->user.stu_id);
		if (t == 1) break;
		p = q->next;
		if (p == NULL) break;
	}
	while (t == 0)
	{
	    printf(">>学号查询\n\n");
		printf(">>请输入正确的学号：\n>>");
		gets(stu);
		while (NULL != p || t != 1)
		{
			q = p;
			t = Compare(stu, p->user.stu_id);
			if (t == 1) break;
			p = q->next;
			if (p == NULL) break;
		}
	}
	return q;
}

void UserBooksBAR()      //用户图书借还记录
{
    printf(">>借阅记录\n\n");
	struct User*pHead, *p;
	pHead = OpenFile1();
	p = SearchUser(pHead);
	int l;
	l = p->n;
	if (0 == l)
		printf(">>无任何借阅记录\n");
	int i;
	for (i = 0; i < l; i++)
	{
		printf(">>书名:");
		puts(p->book[i].Bookname);
		printf(">>编号:");
		puts(p->book[i].Bian_Hao);
		printf(">>借取时间:%d-%d-%d\n", p->book[i].borrowtime.year, p->book[i].borrowtime.mon, p->book[i].borrowtime.day);
		printf(">>截止时间:%d-%d-%d\n\n", p->book[i].returntime.year, p->book[i].returntime.mon, p->book[i].returntime.day);
	}
	Freechain(pHead);
	int t;
	printf(">>输入0返回上一级\n>>");
	scanf("%d", &t);
	getchar();
	while (t != 0)
	{
		printf(">>请输入正确指令\n\n");
		printf(">>输入0返回上一级\n>>");
		scanf("%d", &t);
		getchar();
	}
	User();
}

void UserBooksBAR1(struct User*p)      //用户图书借还记录
{
    printf(">>借阅记录\n\n");
	int l;
	l = p->n;
	if (0 == l)
		printf(">>无任何借阅记录\n");
	int i;
	for (i = 0; i < l; i++)
	{
		printf(">>书名:");
		puts(p->book[i].Bookname);
		printf(">>编号:");
		puts(p->book[i].Bian_Hao);
		printf(">>借取时间:%d-%d-%d\n", p->book[i].borrowtime.year, p->book[i].borrowtime.mon, p->book[i].borrowtime.day);
		printf(">>截止时间:%d-%d-%d\n\n", p->book[i].returntime.year, p->book[i].returntime.mon, p->book[i].returntime.day);
	}
	int t;
	printf(">>输入0返回上一级\n>>");
	scanf("%d", &t);
	getchar();
	while (t != 0)
	{
		printf(">>请输入正确指令\n\n");
		printf(">>输入0返回上一级\n>>");
		scanf("%d", &t);
		getchar();
	}
	User();
}

struct User *SearchUser1(struct User*pHead,char stu[10])                      //通过学号查询并返回地址
{

	struct User*p, *q;
	p = pHead;
	//puts(stu);
	int t = 0;
	while (NULL != p || t != 1)
	{
		q = p;
		t = Compare(stu, p->user.stu_id);
		if (t == 1) break;
		p = q->next;
		if (p == NULL) break;
	}
	return q;
}



