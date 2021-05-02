#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <conio.h>
#include "Chain.h"

//char loadingstu_id[10];
//char loadingper[15];

int SearchLogin(char*stu_id, char*code)
{
	struct User*pHead;
	struct User*p,*q;
	pHead = OpenFile1();
	q=p = pHead;
	int t = 1;
	printf("%d", t);
	while (q != NULL)
	{
		int x;
		p=q;
		x = strcmp(stu_id, p->user.stu_id);
		if (x == 0)
		{
			t = 1;
			break;
		}
		else
		{
			q = p->next;
			t = 0;
		}

	}
	printf("%d", t);
	if (t == 0)
	{
		printf(">>账号不存在\n");
		return t;
		Freechain(pHead);
	}
	if (strcmp(code, p->user.password) != 0)
	{
		printf(">>密码错误\n");
		t = 0;
		return t;
		Freechain(pHead);
	}
	strcpy(loadingstu_id, p->user.stu_id);
	strcpy(loadingper, p->user.per);
	if (p->user.per[0] == 'a') t = 1;
	else t = 2;
	Freechain(pHead);
	return t;



}

void Commander()
{
	int C;                       //C2作为二级菜单判断值
	system("cls");
	printf(">>管理员，欢迎登陆\n\n");
	printf("功能选单\n\n");
	printf("(1)书籍搜索\n(2)新书录入\n(3)书籍信息修改\n");
	printf("(4)删除书籍信息\n(5)办理借还服务\n(6)用户信息查询修改\n");
	printf("(0)退出程序\n>>");
	scanf("%d", &C);
	getchar();
	while (C != 1 && C != 2 && C != 3 && C != 4 && C != 5 && C != 6 && C != 0)             //错误指令
	{
		system("cls");
		printf(">>管理员，欢迎登陆\n\n");
		printf(">>请输入正确的操作序号\n\n");
		printf("功能选单\n\n");
        printf("(1)书籍搜索\n(2)新书录入\n(3)书籍信息修改\n");
        printf("(4)删除书籍信息\n(5)办理借还服务\n(6)用户信息查询修改\n");
        printf("(0)退出程序\n>>");
		scanf("%d", &C);
		getchar();
	}
	if (1 == C)               //书籍查询
	{
		system("cls");
		BookSearch(1);
	}
	else if (2 == C)                   //书籍录入
	{
		system("cls");
		struct BooksInfo *pHead;
		pHead = OpenFile2();
		if (NULL == pHead) BooksRegister();
		else BooksInsert(pHead);
	}
	else if (3 == C)                //书籍编辑
	{
		system("cls");
		BooksEdit();
	}
	else if (4 == C)              //书籍删除
	{
		system("cls");
		BooksDelete();
	}
	else if (5 == C)
	{
		system("cls");          //办理借还
		BorrowAndReturn();
	}
	else if (6 == C)              //用户信息
	{
		system("cls");
		UserDate1();
	}
	else if (0 == C)              //返回上一级
	{
		system("cls");
		Login();
	}
}                         //管理员操作界面

void UserDate1()                 //管理员信息
{
	printf(">>管理员信息：\n\n");
	struct User *pHead, *p, *m;
	p = pHead = OpenFile1();
	printf(">>当前登陆id：");
	puts(loadingstu_id);
	printf("\n");                             //打开文件创建链表
	while (strcmp(loadingstu_id, p->user.stu_id) != 0)
	{
		p = p->next;
	}
	//printf("Find");
	PrintUserInfo(p);                     //打印当前用户信息
	int t = 9;
	while (t != 99999)
	{
		printf("(1)修改当前管理员信息\n(2)查询其他用户信息\n(3)修改其他用户信息\n(0)返回上一级\n>>");               //管理员操作
		scanf("%d", &t);
		getchar();
		system("cls");
		while (t != 0 && t != 1 && t != 2 && t != 3)
		{
			printf(">>请输入正确的指令\n\n");
			printf("(1)修改当前管理员信息\n(2)查询其他用户信息\n(3)修改其他用户信息\n(0)返回上一级\n>>");
			scanf("%d", &t);
			getchar();
		}
		if (0 == t) Commander();
		else if (1 == t) Administratorchanges(p, pHead);
		else if (2 == t) { m = SearchUser(pHead); PrintUserInfo(m); }
		else if (3 == t) { m = SearchUser(pHead); Administratorchanges(m, pHead); }
		Freechain(pHead);
		printf(">>输入0返回上一级\n>>");
		scanf("%d", &t);
		getchar();
		system("cls");
	}

}

void Administratorchanges(struct User*d, struct User*pHead)        //管理员权限修改用户信息（前面要输入用户账号）
{

	int t = 1;

	while (t != 0)
	{
	    printf(">>修改信息\n\n");
		printf(">>请输入修改信息\n\n(1)姓名\n(2)手机号\n(3)学号\n(4)身份证号\n(5)专业\n(6)权限\n(7)密码\n>>");
		scanf("%d", &t);
		getchar();
		if (1 == t)
		{
			printf(">>原姓名：%s\n", d->user.name);
			printf(">>修改姓名为：");
			gets(d->user.name);
		}
		else if (2 == t)
		{
			printf(">>原手机号： %s\n", d->user.tel);
			printf(">>修改手机号为：");
			gets(d->user.tel);
		}
		else if (3 == t)
		{
			printf(">>原学号：  %s\n\n", d->user.stu_id);
			printf(">>修改学号为：  ");
			gets(d->user.stu_id);
		}
		else if (4 == t)
		{
			printf(">>原身份证号码： %s\n\n", d->user.id);
			printf(">>修改身份证号码为： ");
			gets(d->user.id);
		}
		else if (5 == t)
		{
			printf(">>原专业:   %s\n\n", d->user.major);
			printf(">>修改专业为:   ");
			gets(d->user.major);
		}
		else if (6 == t)
		{
			printf(">>现有访问权限：%s\n", d->user.per);
			printf(">>修改访问权限为：");
			gets(d->user.per);
		}
		else if (7 == t)
		{
			printf(">>原密码:   %s\n", d->user.password);
			printf(">>修改密码为：");
			gets(d->user.password);
		}

		printf("\n>>输入0结束，返回上一级\n>>输入任意非0数字继续修改\n>>");
		scanf("%d", &t);
		getchar();
		system("CLS");

	}
	SaveFile1(pHead);
	printf(">>目前记录中已借图书共%d本\n", d->n);
	UserDate1();
}

void BorrowAndReturn()             //管理员办理借还服务
{
	int t;
	printf(">>借还服务\n\n");
	printf("(1)用户借还信息查询\n(2)借还办理\n(0)返回上一级\n>>");
	scanf("%d", &t);
	getchar();
	while (t != 1 && t != 2 && t != 0)
	{
		printf("请输入正确的指令\n");
		printf("1、用户借还信息查询\n2、借还办理\n0、返回上一级\n");
		scanf("%d", &t);
		getchar();
	}
	if (1 == t) AdBookBAR();
	else if (2 == t) BAR1();
	else if (0 == t) Commander();
}

void AdBookBAR()      //用户图书借还记录
{
	struct User*pHead, *p;
	pHead = OpenFile1();
	p = SearchUser(pHead);
	int l;
	l = p->n;
	if (0 == l)
		printf("无任何借阅记录\n");
	int i;
	for (i = 0; i < l; i++)
	{
		printf("书名:");
		puts(p->book[i].Bookname);
		printf("    ");
		printf("编号:");
		puts(p->book[i].Bian_Hao);
		printf("    ");
		printf("借取时间:%d-%d-%d    ", p->book[i].borrowtime.year, p->book[i].borrowtime.mon, p->book[i].borrowtime.day);
		printf("截止时间:%d-%d-%d\n", p->book[i].returntime.year, p->book[i].returntime.mon, p->book[i].returntime.day);

	}
	Freechain(pHead);
	int t;
	printf("输入0返回上一级\n");
	scanf("%d", &t);
	getchar();
	while (t != 0)
	{
		printf("请输入正确指令\n");
		printf("输入0返回上一级\n");
		scanf("%d", &t);
		getchar();
	}
	BorrowAndReturn();
}

void BAR1()           //借还函数
{
	int t;
	printf("1、借书\n2、还书\n0、返回上一级\n");
	scanf("%d", &t);
	getchar();
	while (t != 1 && t != 2 && t != 0)
	{
		printf("请输入正确的指令\n");
		printf("1、借书\n2、还书\n0、返回上一级\n");
		scanf("%d", &t);
		getchar();
	}
	if (1 == t)  Borrow();
	else if (2 == t) ReturnBook();
	else if (0 == t) Commander();
	Commander();

}

int Check(struct User*p)
{
	int Rule(int a, int b, int c);
	int n = 0;
	if (p->n == 0) return 1;
	for (int i = 0; i < (p->n); i++)
	{
		int t = 1;
		t = Rule(p->book[i].returntime.year, p->book[i].returntime.mon, p->book[i].returntime.day);                    //判断归还时间是否超时，1为没有超时，0为超时
		if (0 == t) n++;
		p->next;
	}
	if (n == 0) return 1;
	else return 0;

}

void Borrow()           //借书
{
	char studentid[10];
	char bianhao[30];
	struct User *pHead, *p;
	pHead = OpenFile1();
	p = SearchUser(pHead);
	//printf("FindUser!");
	int t = 1;
	t = Check(p);                       //检查是否存有未还书籍  1 无  0有
	//printf("%d",t);
	if (t == 0)
	{
		printf("你仍存有借出超时未还书籍，请先及时归还，并缴纳罚金\n按任意键返回上一级\n");
		getchar();
		BAR1();
	}
	if (p->n == 10)
	{
		printf("您已借阅10本书籍，请先归还！\n");
		printf("输入任意命令返回上一级");
		getchar();
		BAR1();
	}
	printf("图书编号:");
	gets(bianhao);
	BookBORROWED(p, bianhao);
	SaveFile1(pHead);
	Freechain(pHead);
	BAR1();
}

struct BooksInfo *SearchBianhao1(char BookBianhao[30], struct BooksInfo*pHead)
{
	int Compare(char ino[], char org[]);
	struct  BooksInfo *q, *p, *use;
	int n = 0;
	use=NULL;
	q = p = pHead;
	while (q != NULL)
	{
		p = q;
		int t = 0;
		//puts(p->BianHao);
		t = Compare(BookBianhao, p->BianHao);                //比较关键字
		//printf("t=%d",t);
		if (1 == t)
		{
			Print(p);                             //输出相关信息
			n++;
			use = p;
		}
		q = p->next;
	}
	printf("总共有%d条结果\n", n);
	//while (n != 1)
	//{
	if (n != 1)
	{
		printf("请再次输入图书编号以确定操作(请精确至某一本书籍)：\n");
		char BianHao[30];
		gets(BianHao);
		q = p = pHead;
		n = 0;
		while (q != NULL)
		{
			p = q;
			int t = 0;
			t = Compare(BianHao, p->BianHao);                //比较关键字
			if (1 == t)
			{
				Print(p);
				printf("查找精确书籍成功\n");                            //输出相关信息
				use=p;
				return use;
			}
			q = p->next;
		}
	}
	else return use;


	//}

	//return p;       //返回图书地址 借书



}

void PrintfBook(struct BooksInfo*p)      //打印图书信息
{
	printf("书名:");
	puts(p->name);
	printf("          ");
	printf("作者:");
	puts(p->writer);
	printf("\n");
	printf("ISDN:");
	printf("%ld   ", p->ISBN);
	printf("     ");
	printf("编号:");
	puts(p->BianHao);
	printf("出版时间:%d-%d-%d\n", p->PubTime.year, p->PubTime.mon, p->PubTime.day);
	printf("出版社名:");
	puts(p->print);
	printf("         ");
	printf("图书分类:");
	puts(p->cate);
	printf("\n");
}
int pdate[12] = { 31,28,31,30,31,30,31,31,30,31,30,31 };       //平年的月份
int rdate[12] = { 31,29,31,30,31,30,31,31,30,31,30,31 };       //闰年的月份

int runnian(int n)       //判断闰年函数，0为平年，1为闰年
{
	int run;
	if (n % 100 == 0)
	{
		if (n % 400 == 0)
			run = 1;
		else run = 0;
	}
	else {
		if (n % 4 == 0)
			run = 1;
		else run = 0;
	}
	return run;
}

void returntime(int a, int b, int c, int *d, int *e, int *f)          //计算60天后的年月日,a,b,c为借取的年月日,d,e,f为归还时间的年月日
{
	int run;
	c = c + 61;
	run = runnian(a);
	if (run == 0)         //该年为平年
	{
		c = c - pdate[b - 1];
		if (c > pdate[b])
		{
			c = c - pdate[b];
			if (c > pdate[b + 1])
			{
				c = c - pdate[b + 1];
				b = b + 3;
			}
			else b = b + 2;
		}
		else b = b + 1;
	}
	else {                       //该年为闰年
		c = c - rdate[b - 1];
		if (c > rdate[b])
		{
			c = c - rdate[b];
			if (c > rdate[b + 1])
			{
				c = c - rdate[b + 1];
				b = b + 3;
			}
			else b = b + 2;
		}
		else b = b + 1;
	}
	if (b > 12)
	{
		a = a + 1;
		b = b - 12;
	}
	*d = a;
	*e = b;
	*f = c;
}

void BookBORROWED(struct User*p, char bianhao[30])        //用户借取图书存入文件,n为借取图书编号
{
	struct BooksInfo*tushu, *pHead1;
	pHead1 = OpenFile2();
	tushu = SearchBianhao1(bianhao, pHead1);//根据编号，查询图书的位置指针   注意
	printf("zt=%d", tushu->zt);
	if (tushu->zt == 0)       //如果图书未借出，继续下一步
	{
		system("CLS");
		printf("请确定图书信息");     //  确定图书信息
		PrintfBook(tushu);
		printf("如果借取请输入0,如果返回上一级请输入1\n");
		int i;
		scanf("%d", &i);
		getchar();
		while (i != 1 && i != 0)
		{
			printf("请输入正确的指令,请重新输入\n");
			printf("如果借取请输入0,如果返回上一级请输入1\n");
			scanf("%d", &i);
			getchar();
		}
		if (i == 0)             //借取图书后，将图书信息与学生信息绑定
		{

			tushu->zt = 1;
			strcpy(tushu->BorrowStu_id, p->user.stu_id);           //将图书借取人存入
			strcpy(p->book[p->n].Bookname, tushu->name);         //将书籍名存入用户名下
			strcpy(p->book[p->n].Bian_Hao, tushu->BianHao);       ////将书籍编号存入用户名下
			int *ye, *mo, *da;                         //获取借取时间
			ye = &(p->book[p->n].borrowtime.year);
			mo = &(p->book[p->n].borrowtime.mon);
			da = &(p->book[p->n].borrowtime.day);
			getstime(ye, mo, da);
			ye = &(p->book[p->n].returntime.year);       //计算应归还时间
			mo = &(p->book[p->n].returntime.mon);
			da = &(p->book[p->n].returntime.day);
			returntime(p->book[p->n].borrowtime.year, p->book[p->n].borrowtime.mon, p->book[p->n].borrowtime.day, ye, mo, da);
			(p->n)++;
		}

	}
	else printf("图书已借出，请查询其他图书\n");
	printf("借取成功！按任意键返回上一界面");
	getchar();
	SaveFile2(pHead1);
	Freechain2(pHead1);
}

int Rule(int a, int b, int c)          //判断归还时间是否超时，1为没有超时，0为超时
{
	int yea, mon, day;
	time_t temp;
	struct tm *t;
	time(&temp);
	t = localtime(&temp);
	yea = t->tm_year + 1900;
	mon = t->tm_mon + 1;
	day = t->tm_mday;
	if (a < yea)
		return 0;
	else if (b < mon)
		return 0;
	else if (c < day)
		return 0;
	else return 1;
}

void ReturnBook()     //管理员归还图书
{
	char xuehao[10], bianhao[30];
	int i = 0, chao;
	printf("请输入查询用户学号:");
	gets(xuehao);
	struct User*p, *head;   //搜索用户学号,p为用户的指针
	head = OpenFile1();
	p = head;
	while (strcmp(p->user.stu_id, xuehao) != 0)
	{
		p = p->next;
	}
	if (p->n == 0)
	{
		printf("暂无借阅记录,按回车返回上一级\n");
		getchar();
		BAR1();
	}
	else
	{
		for (int i = 0; i < (p->n); i++)
		{
			printf("借阅书籍:");
			puts(p->book[i].Bookname);
			printf("书籍编号:");
			puts(p->book[i].Bian_Hao);
			printf("\n");
			printf("借阅时间:");
			printf("%d年%d月%d日    ", p->book[i].borrowtime.year, p->book[i].borrowtime.mon, p->book[i].borrowtime.day);
			printf("应归还时间:");
			printf("%d年%d月%d日\n", p->book[i].returntime.year, p->book[i].returntime.mon, p->book[i].returntime.day);
		}
	}
	printf("请输入归还图书编号:");
	i=0;
	gets(bianhao);
	struct BooksInfo*tushu, *pHead;           //根据编号，查询图书的位置指针   注意
	pHead = OpenFile2();
	tushu = SearchBianhao1(bianhao, pHead);
	int k=p->n;
	while (Compare(p->book[i].Bian_Hao, tushu->BianHao) != 1)
	{
	    i++;
		int bian[30];
		if ((i == k) && Compare(p->book[i-1].Bian_Hao, tushu->BianHao) != 1)
		{
			printf("用户并未借取该书籍，请重新输入书籍编号\n");
			int bian[30];
			gets(bian);
			tushu=SearchBianhao1(bian,pHead);
			i=0;
		}

	}
	/*
	while(strcmp(p->book[i].Bian_Hao,bianhao)!=0)
	{
		int bian[30];
		i++;
		if(i==(p->n)&&strcmp(p->book[i-1].Bian_Hao,bianhao)!=0)
		{
			printf("未查找到书籍，请重新输入书籍编号\n");
			gets(bian);
			i=0;
		}

	}      */          //如果书籍编号输入错误或者用户没有借取这本书，如何显示？？？？？？？？
	chao = Rule(p->book[i].returntime.year, p->book[i].returntime.mon, p->book[i].returntime.day);
	if (chao == 0) printf("未按期归还书籍，请及时缴纳罚金\n");
	tushu->BorrowStu_id[0] = '\0';             //将所有书籍和学生信息清零
	p->book[i].Bookname[0] = '\0';
	p->book[i].Bian_Hao[0] = '\0';
	tushu->zt = 0;
	if (i < p->n - 1)            //归还图书不是用户已借取图书的最后一本，将归还图书信息以后的以此前进
	{
		for (; i < p->n - 1; i++)
		{
			strcpy(p->book[i].Bookname, p->book[i + 1].Bookname);
			strcpy(p->book[i].Bian_Hao, p->book[i + 1].Bian_Hao);
			p->book[i].borrowtime.year = p->book[i + 1].borrowtime.year;
			p->book[i].borrowtime.mon = p->book[i + 1].borrowtime.mon;
			p->book[i].borrowtime.day = p->book[i + 1].borrowtime.day;
			p->book[i].returntime.year = p->book[i + 1].returntime.year;
			p->book[i].returntime.mon = p->book[i + 1].returntime.mon;
			p->book[i].returntime.day = p->book[i + 1].returntime.day;
		}
	}
	p->book[p->n - 1].Bookname[0] = '\0';        //将用户信息中借取图书的信息最后一条更改
	p->book[p->n - 1].Bian_Hao[0] = '\0';
	p->n = p->n - 1;
	printf("还书成功，按任意键返回上一级\n");
	SaveFile1(head);
	SaveFile2(pHead);
	Freechain(head);
	Freechain2(pHead);
	BAR1();

}

