#ifndef CHAIN_H
#define CHAIN_H

struct time
{
	int year;
	int mon;
	int day;
};
struct BooksInfo
{
	char name[30];//书名
	char ISBN[23];//图书的十位isbn编号
	char BianHao[30];//图书馆内编号，每本书都有一个，即使是一样的书
	float price;//定价
	char writer[30];//作者
	//int num;//库存剩余数量
	char print[30];//出版社名
	struct time PubTime;//出版时间
	char cate[30];//图书分类
	int zt;//图书是否借出，默认为0未借出
	char BorrowStu_id[10];
	struct BooksInfo*next;
};
struct inform        //用户信息
{
	char name[20];   //姓名
	char tel[13];    //手机号        11位
	char stu_id[10];   //学生账号           8位
	char id[20];     //身份号              18位
	char major[10];  //专业
	char per[15];    //访问权限           1 管理员   2 普通用户
	char password[17];   //密码                十五位
};

struct Book          //借取书籍信息
{
	char Bookname[30];
	char Bian_Hao[30];
	struct time borrowtime;
	struct time returntime;
};
struct User
{
	struct inform user;            //用户
	//struct time Time;
	int n;                         //借书数
	struct Book book[10];
	struct node*next;             //下一节点
};

char loadingstu_id[10];
char loadingper[15];

#define LLL sizeof(struct BooksInfo)

#endif

