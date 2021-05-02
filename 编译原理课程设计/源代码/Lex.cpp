#include "all.h"
char* TurnChar(string a){	//string转为char*
	char *ch;
	ch = (char*)malloc((a.length() + 1) * sizeof(char*));
	a.copy(ch, a.length(), 0);
	*(ch + a.length()) = '\0';
	return ch;
}
Lexical::Lexical() {
	init_KT();	//关键字表初始化
	init_PT();	//界符表初始化
}
Lexical::Lexical(string path) {
	//初始化
	SavePath(path);
	ReadFile();	//读取文件
	init();	//清除注释
	init_KT();	//关键字表初始化
	init_PT();	//界符表初始化
	Token();
}
void Lexical::SetPath(string path) {	//保存地址函数
	SavePath(path);
	ReadFile();	//读取文件
	init();	//清除注释
}
void Lexical::SavePath(string path) {	//保存地址函数
	f_path = NULL;
	f_path = TurnChar(path);
	cout << "Path:" << f_path << endl;
}
void Lexical::ReadFile() {	//读取文件函数
	article.clear();
	ifstream infile(f_path);	//打开文件
	if (!infile.is_open()){
		cout << "File open failed!" << endl;
		return;
	}
	else{
		cout << "File open!" << endl;
		//读取文件
		string line;
		while (getline(infile, line))
		{
			article += line;
			article += '\n';
		}
		cout << "Read" << endl;
		//关闭文件
		infile.close();
	}
	//更新内容长度
	len = article.length();
}
void Lexical::init() {	//清除注释函数 初始化
	string sub;
	int start = 0, end = 0;
	for (int i = 0; i < len; i++)
	{
		if (article[i] == '/' && article[i + 1] == '/') //清除双斜杠型注释
		{
			end = i;
			sub += article.substr(start, end - start);
			int j = i + 2;
			while (article[j] != '\n')
			{
				j++;
			}
			start = j;
			i = j;
		}
		else if (article[i] == '/' && article[i + 1] == '*') //清除单斜杠注释
		{
			end = i;
			sub += article.substr(start, end - start);
			int j = i + 2;
			while (article[j] != '*' && article[j + 1] != '/')
			{
				j++;
			}
			start = j + 2;
			i = j;
		}
	}
	end = len - 1;
	sub += article.substr(start, end - start);
	article = sub;
	//更新内容长度
	len = article.length();
}	
void Lexical::init_KT() {	//保留字符表初始化
	KT.clear();
	KT.push_back("include");
	KT.push_back("logic");
	KT.push_back("auto");
	KT.push_back("break");
	KT.push_back("case");
	KT.push_back("char");
	KT.push_back("const");
	KT.push_back("continue");
	KT.push_back("default");
	KT.push_back("do");
	KT.push_back("double");
	KT.push_back("else");
	KT.push_back("enum");
	KT.push_back("extern");
	KT.push_back("float");
	KT.push_back("for");
	KT.push_back("goto");
	KT.push_back("if");
	KT.push_back("inline");
	KT.push_back("int");
	KT.push_back("long");
	KT.push_back("register");
	KT.push_back("restrict");
	KT.push_back("return");
	KT.push_back("short");
	KT.push_back("signed");
	KT.push_back("sizeof");
	KT.push_back("static");
	KT.push_back("struct");
	KT.push_back("switch");
	KT.push_back("typedef");
	KT.push_back("union");
	KT.push_back("unsigned");
	KT.push_back("void");
	KT.push_back("volatile");
	KT.push_back("while");
	KT.push_back("function");
	len_kt = KT.size();		//更新长度
}
void Lexical::init_PT() {	//界符表初始化
	PT.clear();
	PT.push_back("=");
	PT.push_back("+=");
	PT.push_back("-=");
	PT.push_back("*=");
	PT.push_back("/=");
	PT.push_back("%=");
	PT.push_back("&=");
	PT.push_back("|=");
	PT.push_back("^=");
	PT.push_back("<<=");
	PT.push_back(">>=");
	PT.push_back("++");
	PT.push_back("--");
	PT.push_back("+");
	PT.push_back("-");
	PT.push_back("*");
	PT.push_back("/");
	PT.push_back("%");
	PT.push_back("~");
	PT.push_back("&");
	PT.push_back("|");
	PT.push_back("^");
	PT.push_back("<<");
	PT.push_back(">>");
	PT.push_back("!");
	PT.push_back("&&");
	PT.push_back("||");
	PT.push_back("==");
	PT.push_back("!=");
	PT.push_back("<");
	PT.push_back(">");
	PT.push_back("<=");
	PT.push_back(">=");
	PT.push_back("[");
	PT.push_back("]");
	PT.push_back("->");
	PT.push_back(".");
	PT.push_back("(");
	PT.push_back(")");
	PT.push_back("{");
	PT.push_back("}");
	PT.push_back("/*");
	PT.push_back("*/");
	PT.push_back(";");
	PT.push_back(":");
	PT.push_back("#");
	PT.push_back(",");
	PT.push_back("'");
	PT.push_back("\"");
	len_pt = PT.size();		//更新长度
}
void Lexical::add_it(string str) {	//标识符表添加
	iT.push_back(str);
	len_it = iT.size();		//更新长度
}
void Lexical::add_ct(string str) {	//字符表添加
	cT.push_back(str);
	len_ct = cT.size();		//更新长度
}
void Lexical::add_st(string str) {	//字符串表添加
	sT.push_back(str);
	len_it = sT.size();		//更新长度
}
void Lexical::add_Ct(string str) {	//常数表添加
	CT.push_back(str);
	len_CT = CT.size();		//更新长度
}
void Lexical::get_char() {	//读入下一个字符
	index++;
	if (index < len)
		ch = article[index];
}
void Lexical::get_ns() {	//读入下一个非空字符
	while (ch == ' ' || ch == '\n' || ch == '\t')
	{
		get_char();
		if (index == len)
			break;
	}
}
bool Lexical::letter() {	//判断当前是否为字母
	if ((ch >= 'A'&&ch <= 'Z') || (ch >= 'a'&&ch <= 'z'))
		return true;
	else
		return false;
}
bool Lexical::digit() {	//判断当前是否为数字
	if (ch >= '0'&&ch <= '9')
		return true;
	else
		return false;
}
//扫描表
int Lexical::if_iT(string word) {
	for (int i = 0; i < len_it; i++)
	{
		if (word == iT[i])
			return i;
	}
	add_it(word);	//如果表中不存在 添加入表
	return len_it - 1;
}
int Lexical::if_cT(string word) {
	for (int i = 0; i < len_ct; i++)
	{
		if (word == cT[i])
			return i;
	}
	add_ct(word);	//如果表中不存在 添加入表
	return len_ct -1 ;
}
int Lexical::if_sT(string word) {
	for (int i = 0; i < len_st; i++)
	{
		if (word == sT[i])
			return i;
	}
	add_st(word);	//如果表中不存在 添加入表
	return len_st - 1;
}
int Lexical::if_CT(string word) {
	for (int i = 0; i < len_CT; i++)
	{
		if (word == CT[i])
			return i;
	}
	add_Ct(word);	//如果表中不存在 添加入表
	return len_CT - 1;
}
int Lexical::if_PT(string word) {
	for (int i = 0; i < len_pt; i++)
	{
		if (word == PT[i])
			return i;
	}
	return -1;
}
int Lexical::if_KT(string word) {
	for (int i = 0; i < len_kt; i++)
	{
		if (word == KT[i])
			return i;
	}
	return -1;
}	
int Lexical::state_change(char ch, int now_state){	//自动机状态转换函数
	struct Token tk;
	int key;
	switch (now_state) {
	case 0:{	//初始状态
		if (letter() || ch == '_') {	//标识符或关键字
			state = 1;
			word += ch;
		}
		else if (digit()) {	//常数
			state = 2;
			word += ch;
		}
		else if (ch == '\'') {	//字符
			state = 5;
			word += ch;
		}
		else if (ch == '"') {	//字符串
			state = 9;
			word += ch;
		}
		//以下为界符判断
		else if(ch == '='){	
			state = 11;
			word += ch;
		}
		else if (ch == '+') {
			state = 12;
			word += ch;
		}
		else if (ch == '-') {
			state = 13;
			word += ch;
		}
		else if (ch == '*') {
			state = 14;
			word += ch;
		}
		else if (ch == '/') {
			state = 15;
			word += ch;
		}
		else if (ch == '%') {
			state = 16;
			word += ch;
		}
		else if (ch == '&') {
			state = 17;
			word += ch;
		}
		else if (ch == '|') {
			state = 18;
			word += ch;
		}
		else if (ch == '^') {
			state = 19;
			word += ch;
		}
		else if (ch == '<') {
			state = 20;
			word += ch;
		}
		else if (ch == '>') {
			state = 21;
			word += ch;
		}
		else if (ch == '!') {
			state = 22;
			word += ch;
		}
		else {	//其他字符
			state = 25;
			word += ch;
		}
		break;
	}
	case 1: {	//关键字 标识符
		if (digit() || letter() || ch == '_') {
			state = 1;
			word += ch;
		}
		else {	//读取word完成
			state = 0;
			key = if_KT(word);
			//标识符
			if (key == -1)
			{
				tk.Word = "IT";
				tk.Key = if_iT(word) + 1;	
			}
			//关键字
			else
			{
				tk.Word = "KT";
				tk.Key = key + 1;
			}
			token.push_back(tk);
			len_tk++;
			word = "";//清空
			return -1;
		}
		break;
	}
	case 2: {	//常数
		if (digit()) {
			state = 2;
			word += ch;
		}
		else if (ch == '.') {
			state = 3;
			word += ch;
		}
		else{	//读取word完成
			state = 0;
			tk.Key = if_CT(word) + 1;
			tk.Word = "CT";
			token.push_back(tk);
			len_tk++;
			word = "";	//清空
			return -1;
		}
		break;
	}
	case 3: {
		if (digit()) {
			state = 4;
			word += ch;
		}
		else{
			cout << "Error:\t" << word << endl;
			return -1;
		}
		break;
	}
	case 4: {
		if (digit()) {
			state = 4;
			word += ch;
		}
		else{	//读取word完成
			state = 0;
			tk.Key = if_CT(word) + 1;
			tk.Word = "CT";
			token.push_back(tk);
			len_tk++;
			word = "";	//清空
			return -1;
		}
		break;
	}
	case 5: {	//字符
		if (letter()||digit()) {
			state = 6;
			word += ch;
		}
		else if (ch == '\\') {
			state = 8;
			word += ch;
		}
		else{
			cout << "Error:\t" << word << endl;
			return -1;
		}
		break;
	}
	case 6: {
		if (ch == '\'') {
			state = 7;
			word += ch;
		}
		else {
			cout << "Error:\t" << word << endl;
			return -1;
		}
		break;
	}
	case 7: {
		//读取word完成
		state = 0;
		tk.Key = if_cT(word) + 1;
		tk.Word = "cT";
		token.push_back(tk);
		len_tk++;
		word = "";	//清空
		return -1;
		break;
	}
	case 8: {	//转义字符（不全）
		if (ch == 't' || ch == '\'' || ch == 'n' || ch == '0' || ch == '\\' || ch == 'a') {
			state = 6;
			word += ch;
		}
		else {
			cout << "Error:\t" << word << endl;
			return -1;
		}
		break;
	}
	case 9: {	//字符串
		if (ch == '"') {
			state = 10;
			word += ch;
		}
		else {
			state = 9;
			word += ch;
		}
		break;
	}
	case 10: {
		//读取word完成
		state = 0;
		tk.Key = if_sT(word) + 1;
		tk.Word = "sT";
		token.push_back(tk);
		len_tk++;
		word = "";	//清空
		return -1;
		break;
	}
	case 11: {
		if (ch == '=') {
			state = 23;
			word += ch;
		}
		else {	//读取word完成
			state = 0;
			tk.Key = if_PT(word) + 1;
			tk.Word = "PT";
			token.push_back(tk);
			len_tk++;
			word = "";	//清空
			return -1;
		}
		break;
	}
	case 12: {
		if (ch == '='||ch == '+') {
			state = 23;
			word += ch;
		}
		else {	//读取word完成
			state = 0;
			tk.Key = if_PT(word) + 1;
			tk.Word = "PT";
			token.push_back(tk);
			len_tk++;
			word = "";	//清空
			return -1;
		}
		break;
	}
	case 13: {
		if (ch == '=' || ch == '-' || ch == '>') {
			state = 23;
			word += ch;
		}
		else {	//读取word完成
			state = 0;
			tk.Key = if_PT(word) + 1;
			tk.Word = "PT";
			token.push_back(tk);
			len_tk++;
			word = "";	//清空
			return -1;
		}
		break;
	}
	case 14: {
		if (ch == '=') {
			state = 23;
			word += ch;
		}
		else {	//读取word完成
			state = 0;
			tk.Key = if_PT(word) + 1;
			tk.Word = "PT";
			token.push_back(tk);
			len_tk++;
			word = "";	//清空
			return -1;
		}
		break;
	}
	case 15: {
		if (ch == '=') {
			state = 23;
			word += ch;
		}
		else {	//读取word完成
			state = 0;
			tk.Key = if_PT(word) + 1;
			tk.Word = "PT";
			token.push_back(tk);
			len_tk++;
			word = "";	//清空
			return -1;
		}
		break;
	}
	case 16: {
		if (ch == '=') {
			state = 23;
			word += ch;
		}
		else {	//读取word完成
			state = 0;
			tk.Key = if_PT(word) + 1;
			tk.Word = "PT";
			token.push_back(tk);
			len_tk++;
			word = "";	//清空
			return -1;
		}
		break;
	}
	case 17: {
		if (ch == '=' || ch == '&') {
			state = 23;
			word += ch;
		}
		else {	//读取word完成
			state = 0;
			tk.Key = if_PT(word) + 1;
			tk.Word = "PT";
			token.push_back(tk);
			len_tk++;
			word = "";	//清空
			return -1;
		}
		break;
	}
	case 18: {
		if (ch == '=' || ch == '|') {
			state = 23;
			word += ch;
		}
		else {	//读取word完成
			state = 0;
			tk.Key = if_PT(word) + 1;
			tk.Word = "PT";
			token.push_back(tk);
			len_tk++;
			word = "";	//清空
			return -1;
		}
		break;
	}
	case 19: {
		if (ch == '=') {
			state = 23;
			word += ch;
		}
		else {	//读取word完成
			state = 0;
			tk.Key = if_PT(word) + 1;
			tk.Word = "PT";
			token.push_back(tk);
			len_tk++;
			word = "";	//清空
			return -1;
		}
		break;
	}
	case 20: {
		if (ch == '<') {
			state = 24;
			word += ch;
		}
		else {	//读取word完成
			state = 0;
			tk.Key = if_PT(word) + 1;
			tk.Word = "PT";
			token.push_back(tk);
			len_tk++;
			word = "";	//清空
			return -1;
		}
		break;
	}
	case 21: {
		if (ch == '>') {
			state = 24;
			word += ch;
		}
		else {	//读取word完成
			state = 0;
			tk.Key = if_PT(word) + 1;
			tk.Word = "PT";
			token.push_back(tk);
			len_tk++;
			word = "";	//清空
			return -1;
		}
		break;
	}
	case 22: {
		if (ch == '=') {
			state = 23;
			word += ch;
		}
		else {	//读取word完成
			state = 0;
			tk.Key = if_PT(word) + 1;
			tk.Word = "PT";
			token.push_back(tk);
			len_tk++;
			word = "";	//清空
			return -1;
		}
		break;
	}
	case 23: {
		//读取word完成
		state = 0;
		tk.Key = if_PT(word) + 1;
		tk.Word = "PT";
		token.push_back(tk);
		len_tk++;
		word = "";	//清空
		return -1;
		break;
	}
	case 24: {
		if (ch == '=') {
			state = 23;
			word += ch;
		}
		else {	//读取word完成
			state = 0;
			tk.Key = if_PT(word) + 1;
			tk.Word = "PT";
			token.push_back(tk);
			len_tk++;
			word = "";	//清空
			return -1;
		}
		break;
	}
	case 25: {
		//读取word完成
		state = 0;
		tk.Key = if_PT(word) + 1;
		tk.Word = "PT";
		token.push_back(tk);
		len_tk++;
		word = "";	//清空
		return -1;
		break;
	}
	default: {
		cout << "State is wrong!\t" << state << "\t" << word << endl;
		state = 0;
	}
	}
	return 1;
}
void Lexical::Token() {	//Token生成函数
	int tip;
	get_ns();
	while (index < len)
	{
		//cout << state <<"-->"<<ch;
		tip = state_change(ch, state);	//使用自动机判断读入单词 并添加token序列
		//cout << "-->" << state <<":"<<tip<< endl;
		if (tip == 1)	
			get_char();
		else	//此时已完整读入一个单词并且已完成添加token序列
			get_ns();
	}
	state_change('\n', state);
}
//打印函数
void Lexical::PrintArt() {
	cout << "代码内容:" << endl << article << endl;
}
void Lexical::PrintToken() {
	cout << "Num:" << len_tk << endl;
	for (int i = 0; i < len_tk; i++)
	{
		cout << "<" << token[i].Word << "," << token[i].Key << ">";
	}
}
void Lexical::Print_iT() {
	cout << "----标识符----" << endl;
	for (int i = 0; i < len_it; i++)
	{
		cout << i + 1 << "\t" << iT[i] << endl;
	}
}
void Lexical::Print_cT() {
	cout << "----字符----" << endl;
	for (int i = 0; i < len_ct; i++)
	{
		cout << i + 1 << "\t" << cT[i] << endl;
	}
}
void Lexical::Print_sT() {
	cout << "----字符串----" << endl;
	for (int i = 0; i < len_st; i++)
	{
		cout << i + 1 << "\t" << sT[i] << endl;
	}
}
void Lexical::Print_CT() {
	cout << "----常数----" << len_CT << "----" << endl;
	for (int i = 0; i < len_CT; i++)
	{
		cout << i + 1 << "\t" << CT[i] << endl;
	}
}
//主要外部接口
struct Token Lexical::LastToken() {	//返回上一个Token
	return token[tk_index - 1];
}
struct Token Lexical::NextToken() {	//返回下一个Token
	return token[tk_index + 1];
}
string Lexical::GetStr(string table, int key) {	//返回当前序列对应字符串
	if(table=="IT")
		return iT[key-1];
	else if(table=="cT")
		return cT[key-1];
	else if(table=="sT")
		return sT[key-1];
	else if(table=="CT")
		return CT[key-1];
	else if(table=="KT")
		return KT[key-1];
	else
		return PT[key-1];
	}
vector<struct Token> Lexical::getToken(){	//返回完整Token序列
	return token;
}
/*int main(){
	string path = "F:/寇凯淇/东大/学习/疫情期间网课/编译原理/课设/ICE/Queen/code/Lexical/Lexical/testfile2.c";
	Lexical lex(path);
	//使用相应的打印函数显示结果
	//lex.PrintArt();
	lex.Token();//调用该函数 生成token序列
	lex.PrintToken();
	//lex.Print_CT();//打印常数表 可以使用对应的打印函数查看其他表内容
}*/