#ifndef LEX_H_INCLUDED
#define LEX_H_INCLUDED
#pragma once
#include "all.h"
using namespace std;
char* TurnChar(string a);
struct Token {	//Token结构
	string Word;	//表名
	int Key;
};
class Lexical {
private:
	char *f_path;	//文件地址
	string article;		//内容
	int len = 0;	//内容长度
	char ch = ' ';
	string word; //保存扫描的单词
	int index = -1;	//当前光标位置
	int state = 0;	//当前自动机状态
	vector<struct Token> token;	//Token序列
	int len_tk = 0;
	vector<string> iT;	//标识符表
	int len_it = 0;
	vector<string> cT;	//字符表
	int len_ct = 0;
	vector<string> sT;	//字符串表
	int len_st = 0;
	vector<string> CT;	//常数表
	int len_CT = 0;
	vector<string> KT;	//关键字表
	int len_kt = 0;
	vector<string> PT;	//界符表
	int len_pt = 0;
public:
	//构造函数
	Lexical();
	Lexical(string path);
	//初始化
	void SetPath(string path);  //设置文件地址
	void SavePath(string path);//保存地址函数
	void ReadFile();//读取文件函数
	void init();//清除注释函数 初始化
	void init_KT();//保留字符表初始化
	void init_PT();	//界符表初始化
	void add_it(string str);	//标识符表添加
	void add_ct(string str);	//字符表添加
	void add_st(string str);	//字符串表添加
	void add_Ct(string str);	//常数表添加
	void get_char();	//读入下一个字符
	void get_ns();	//读入下一个非空字符
	bool letter();	//判断当前是否为字母
	bool digit();	//判断当前是否为数字
	//扫描表
	int if_iT(string word);
	int if_cT(string word);
	int if_sT(string word);
	int if_CT(string word);
	int if_PT(string word);
	int if_KT(string word);
	int state_change(char ch, int now_state);	//自动机状态转换函数
	void Token();	//Token生成函数
	//打印函数
	void PrintArt();
	void PrintToken();
	void Print_iT();
	void Print_cT();
	void Print_sT();
	void Print_CT();
	//主要外部接口
	struct Token LastToken();	//返回上一个Token
	struct Token NextToken();	//返回上一个Token
	string GetStr(string table, int key);	//返回当前序列对应字符串
	vector<struct Token> getToken();	//返回完整Token序列
};


#endif // LEX_H_INCLUDED
