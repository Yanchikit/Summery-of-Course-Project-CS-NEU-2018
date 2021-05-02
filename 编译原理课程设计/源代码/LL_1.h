#pragma once
#include "all.h"
using namespace std;
class PaserLL {
private:
	Lexical lex;
	map<string, int>getnum;
	string getch[200];         //获得对应字符
	vector<vector<string> >proce;
	vector<vector<string> >proce_with_action;
	int table[200][200];      //预测分析表
	int num = 0;
	int numvt = 0;
	vector<int> first[200];
	vector<int> follow[200];
	vector<struct Token> token;	//输入Token序列
public:
	PaserLL();
	PaserLL(Lexical ll);
	void init();
	void init_Gram();
	vector<string> initTer();//终结符集
	vector<string> initN_Ter();//非终结符集
	void ProList();//语法
	void ProList_Action();//语法 含动作
	void add_Production(string str, vector<vector<string> > &proce);
	void First();//求产生式First集
	void Follow();
	void Table();
	void LL1();
	bool Process();
	string GetInitStr(int i);
	string ToUpper(string str);	//转换为大写
	void Action1(string s);
	void Mixed(vector<int> &a, vector<int> b);  //a=a or b   取a,b交集赋值给a
	vector<int> Get(int vn, int & has_0);	//查找标号为vn的首元素
	void PrintGram();	//打印文法
	void PrintGram_With_Action();
	void PrintFirst();	//打印First集
	void PrintFollow();	//打印Follow集
	void PrintTable();	//打印Select表
	void PrintToken();
	void Check();	//检测终结符/非终结符重复定义
};



extern int tk_index;
