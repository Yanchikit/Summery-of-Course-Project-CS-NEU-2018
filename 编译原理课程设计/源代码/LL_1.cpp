#include "all.h"
PaserLL::PaserLL(){
	token.clear();
	init();
}
PaserLL::PaserLL(Lexical ll) {
	lex = ll;
	token = ll.getToken();
	init();
}
void PaserLL::init(){
	init_Gram();
	cout << "----------check----------"<<endl;
	Check();
	cout << "----------Over----------"<<endl;
	cout << "----------First----------" << endl;
	First();
	cout << "----------Over----------" << endl;
	cout << "----------Follow----------" << endl;
	Follow();
	cout << "----------Over----------" << endl;
	cout << "----------Table----------" << endl;
	Table();
	cout << "----------Over----------" << endl;
}
void PaserLL::init_Gram(){
	memset(table, -1, sizeof(table));	//初始化表
	getnum["END#"] = 0;
	getch[0] = "END#";
	vector<string> Terminal;
	Terminal = initTer();
	for(int i =0;i<Terminal.size();i++){
		string str = Terminal[i];
		getnum[str] = ++num;
		getch[num] = str;
	}
	numvt = ++num;
	getnum["NULL"] = numvt;	//空字符
	getch[num] = "NULL";
	cout<<"Terminal:"<<Terminal.size()<<endl;
	vector<string> N_Terminal;
	N_Terminal = initN_Ter();
	for(int i =0;i<N_Terminal.size();i++){
		string str = N_Terminal[i];
		getnum[str] = ++num;
		getch[num] = str;
	}
	cout<<"N_Terminal:"<<N_Terminal.size()<<endl;
	ProList();
	ProList_Action();
}
vector<string> PaserLL::initTer(){	//终结符集
	vector<string> T;
	T.push_back("IDENTIFIER");
	T.push_back("FUNCTION");
	T.push_back(",");
	T.push_back(";");
	T.push_back("#");
	T.push_back("INCLUDE");
	T.push_back("<");
	T.push_back(">");
	T.push_back("[");
	T.push_back("]");
	T.push_back("{");
	T.push_back("}");
	T.push_back("(");
	T.push_back(")");
	T.push_back("=");
	T.push_back("CONSTANT");
	T.push_back("CH");
	T.push_back("STR");
	T.push_back("STRUCT");
	T.push_back("IF");
	T.push_back("ELSE");
	T.push_back("WHILE");
	T.push_back("DO");
	T.push_back("FOR");
	T.push_back("CONTINUE");
	T.push_back("BREAK");
	T.push_back("RETURN");
	T.push_back("+");
	T.push_back("-");
	T.push_back("*");
	T.push_back("/");
	T.push_back(".");
	T.push_back("VOID");
	T.push_back("INT");
	T.push_back("FLOAT");
	T.push_back("CHAR");
	T.push_back("DOUBLE");
	T.push_back("LOGIC");
	T.push_back("OR_OP");
	T.push_back("AND_OP");
	T.push_back("NOT_OP");
	T.push_back("RE_OP");
	return T;
}
vector<string> PaserLL::initN_Ter(){	//非终结符集
	vector<string> N_T;
	N_T.push_back("P");
	N_T.push_back("Psub");
	N_T.push_back("ODC");
	N_T.push_back("FDF");
	N_T.push_back("FDC");
	N_T.push_back("FDCsub");
	N_T.push_back("AL");
	N_T.push_back("ALsub");
	N_T.push_back("ADC");
	N_T.push_back("DCS");
	N_T.push_back("HDC");
	N_T.push_back("FN");
	N_T.push_back("VDC");
	N_T.push_back("IDL");
	N_T.push_back("IDLsub");
	N_T.push_back("IDC");
	N_T.push_back("IDCsub");
	N_T.push_back("VNDC");
	N_T.push_back("VEC");
	N_T.push_back("V");
	N_T.push_back("Vsub");
	N_T.push_back("INIT");
	N_T.push_back("IL");
	N_T.push_back("ILsub");
	N_T.push_back("SDC");
	N_T.push_back("SDCsub");
	N_T.push_back("SML");
	N_T.push_back("SMLsub");
	N_T.push_back("CS");
	N_T.push_back("SL");
	N_T.push_back("SLsub");
	N_T.push_back("S");
	N_T.push_back("CSS");
	N_T.push_back("CSSsub");
	N_T.push_back("TS");
	N_T.push_back("DF");
	N_T.push_back("LE");
	N_T.push_back("LEsub");
	N_T.push_back("LA");
	N_T.push_back("LAsub");
	N_T.push_back("LN");
	N_T.push_back("LNsub");
	N_T.push_back("AE");
	N_T.push_back("JS");
	N_T.push_back("AS");
	N_T.push_back("ES");
	N_T.push_back("E");
	N_T.push_back("A");
	N_T.push_back("T");
	N_T.push_back("B");
	N_T.push_back("F");
	N_T.push_back("I");
	N_T.push_back("Isub");
	N_T.push_back("PRL");
	N_T.push_back("PRLsub");
	N_T.push_back("VOS");
	N_T.push_back("TYPE");
	return N_T;
}
void PaserLL::ProList(){		//语法
	//程序定义
	cout << "Gram1Loading" << endl;
	proce.clear();
	add_Production("P->ODC Psub", proce);
	add_Production("Psub->P|NULL", proce);
	add_Production("ODC->FUNCTION FDF|DCS", proce);	//修改
	add_Production("FDF->TYPE FDC CS", proce);
	add_Production("FDC->IDENTIFIER ( FDCsub )", proce);
	add_Production("FDCsub->NULL|AL", proce);
	add_Production("AL->ADC ALsub", proce);
	add_Production("ALsub->NULL|, AL", proce);
	add_Production("ADC->TYPE VNDC", proce);
	add_Production("DCS->HDC|VDC ;|SDC ;", proce);	//修改0708
	add_Production("HDC-># INCLUDE < FN >", proce);
	add_Production("FN->IDENTIFIER . IDENTIFIER|STR", proce);
	add_Production("VDC->TYPE IDL", proce);
	add_Production("IDL->IDC IDLsub", proce);
	add_Production("IDLsub->NULL|, IDL", proce);
	add_Production("IDC->VNDC IDCsub", proce);
	add_Production("IDCsub->NULL|= INIT", proce);
	add_Production("VNDC->IDENTIFIER VEC", proce);
	add_Production("VEC->NULL|V", proce);
	add_Production("V->[ CONSTANT ] Vsub", proce);
	add_Production("Vsub->NULL|V", proce);
	add_Production("INIT->I|{ IL }", proce);
	add_Production("IL->I ILsub", proce);
	add_Production("ILsub->NULL|, IL", proce);
	add_Production("SDC->STRUCT IDENTIFIER { SML } SDCsub", proce);
	add_Production("SDCsub->NULL|IDENTIFIER", proce);
	add_Production("SML->VDC ; SMLsub", proce);
	add_Production("SMLsub->NULL|SML", proce);
	//语句定义
	add_Production("CS->{ SL }", proce);	//修改
	add_Production("SL->DCS SLsub|S SLsub", proce);
	add_Production("SLsub->NULL|SL", proce);
	add_Production("S->CS|CSS|TS|JS ;|AS ;", proce);
	add_Production("CSS->IF ( LE ) CS CSSsub", proce);
	add_Production("CSSsub->NULL|ELSE CS", proce);
	add_Production("TS->WHILE ( LE ) CS|DO CS WHILE ( LE ) ;|FOR ( DF ; LE ; AE ) CS", proce);
	add_Production("DF->AS|NULL", proce);
	add_Production("LE->LA LEsub", proce);
	add_Production("LEsub->OR_OP LE|NULL", proce);
	add_Production("LA->LN LAsub", proce);
	add_Production("LAsub->AND_OP LA|NULL", proce);
	//cout << "1111111111111111" << endl;
	add_Production("LN->NOT_OP LN|LOGIC ( LE )|ES LNsub", proce);
	add_Production("LNsub->RE_OP ES|< ES|> ES|NULL", proce);
	add_Production("AE->AS|NULL", proce);
	add_Production("JS->CONTINUE|BREAK|RETURN ES", proce);	//修改
	add_Production("AS->VNDC = ES", proce);
	add_Production("ES->T A", proce);	//修改
	add_Production("A->+ T A|- T A|NULL", proce);
	add_Production("T->F B", proce);
	add_Production("B->* F B|/ F B|NULL", proce);
	add_Production("F->I|( ES )", proce);
	add_Production("I->IDENTIFIER Isub|CONSTANT|- CONSTANT|CH|STR", proce);
	add_Production("Isub->( PRL )|[ CONSTANT ] VOS|. IDENTIFIER VOS|NULL", proce);
	add_Production("PRL->I PRLsub", proce);
	add_Production("PRLsub->NULL|, PRL", proce);
	add_Production("VOS->[ CONSTANT ] VOS|. IDENTIFIER VOS|NULL", proce);
	add_Production("TYPE->VOID|INT|FLOAT|CHAR|DOUBLE", proce);
	cout<<"Gram1:"<<proce.size()<<endl;
}
void PaserLL::ProList_Action(){		//语法 含动作
	//程序定义
	cout << "Gram2Loading" << endl;
	proce_with_action.clear();
	add_Production("P->ODC Psub", proce_with_action);
	add_Production("Psub->P|NULL @0", proce_with_action);
	add_Production("ODC->FUNCTION FDF @1|DCS", proce_with_action);	//修改
	add_Production("FDF->TYPE @2 FDC @3 CS @4", proce_with_action);
	add_Production("FDC->IDENTIFIER @5 ( FDCsub )", proce_with_action);
	add_Production("FDCsub->NULL|AL", proce_with_action);
	add_Production("AL->ADC ALsub", proce_with_action);
	add_Production("ALsub->NULL|, AL", proce_with_action);
	add_Production("ADC->TYPE @6 VNDC @7", proce_with_action);
	add_Production("DCS->HDC|VDC ;|SDC ;", proce_with_action);	//修改0708
	add_Production("HDC-># INCLUDE < FN >", proce_with_action);
	add_Production("FN->IDENTIFIER . IDENTIFIER|STR", proce_with_action);
	add_Production("VDC->TYPE @8 IDL @9", proce_with_action);
	add_Production("IDL->IDC IDLsub", proce_with_action);
	add_Production("IDLsub->NULL|, IDL", proce_with_action);
	add_Production("IDC->VNDC IDCsub", proce_with_action);
	add_Production("IDCsub->NULL|= @10 INIT @11", proce_with_action);
	add_Production("VNDC->IDENTIFIER @12 VEC", proce_with_action);
	add_Production("VEC->NULL @13|V", proce_with_action);
	add_Production("V->[ CONSTANT @14 ] @15 Vsub", proce_with_action);
	add_Production("Vsub->NULL @16|V", proce_with_action);
	add_Production("INIT->I @17|{ IL }", proce_with_action);
	add_Production("IL->I @18 ILsub", proce_with_action);
	add_Production("ILsub->NULL|, IL", proce_with_action);
	add_Production("SDC->STRUCT IDENTIFIER @19 { @20 SML } @85 SDCsub", proce_with_action);
	add_Production("SDCsub->NULL @21|IDENTIFIER @21", proce_with_action);
	add_Production("SML->VDC @22 ; SMLsub", proce_with_action);
	add_Production("SMLsub->NULL @23|SML", proce_with_action);
	//语句定义
	add_Production("CS->{ @24 SL } @25", proce_with_action);	//修改
	add_Production("SL->DCS SLsub|S SLsub", proce_with_action);
	add_Production("SLsub->NULL|SL", proce_with_action);
	add_Production("S->CS @26|CSS @27|TS|JS @28 ;|AS @29 ;", proce_with_action);
	add_Production("CSS->IF @30 ( LE ) @31 CS @32 CSSsub @33", proce_with_action);
	add_Production("CSSsub->NULL|ELSE CS @34", proce_with_action);
	add_Production("TS->WHILE @35 ( LE ) @36 CS @37|DO @38 CS @39 WHILE ( LE @40 ) @41 ;|FOR @84 ( DF ; LE @42 ; AE ) CS @43", proce_with_action);
	add_Production("DF->AS @44|NULL", proce_with_action);
	add_Production("LE->LA LEsub", proce_with_action);
	add_Production("LEsub->OR_OP @45 LE @46|NULL", proce_with_action);
	add_Production("LA->LN LAsub", proce_with_action);
	add_Production("LAsub->AND_OP @47 LA @48|NULL", proce_with_action);
	add_Production("LN->NOT_OP @49 LN @50|LOGIC ( LE )|ES @51 LNsub", proce_with_action);
	add_Production("LNsub->RE_OP @52 ES @53|< @54 ES @55|> @56 ES @57|NULL", proce_with_action);
	add_Production("AE->AS @58|NULL", proce_with_action);
	add_Production("JS->CONTINUE @59|BREAK @60|RETURN @61 ES @62", proce_with_action);	//修改
	add_Production("AS->@63 VNDC @64 = ES @65", proce_with_action);
	add_Production("ES->T A", proce_with_action);	//修改
	add_Production("A->+ T @66 A|- T @67 A|NULL", proce_with_action);
	add_Production("T->F B", proce_with_action);
	add_Production("B->* F @68 B|/ F @69 B|NULL", proce_with_action);
	add_Production("F->I @70|( ES )", proce_with_action);
	add_Production("I->IDENTIFIER @71 Isub|CONSTANT @72|- CONSTANT @73|CH @74|STR @75", proce_with_action);
	add_Production("Isub->( PRL @76 )|[ CONSTANT @77 ] VOS|. IDENTIFIER @78 VOS|NULL", proce_with_action);
	add_Production("PRL->I @79 PRLsub", proce_with_action);
	add_Production("PRLsub->NULL|, PRL", proce_with_action);
	add_Production("VOS->[ CONSTANT @80 ] VOS|.  @81 IDENTIFIER @82 VOS|NULL @83", proce_with_action);
	add_Production("TYPE->VOID|INT|FLOAT|CHAR|DOUBLE", proce_with_action);
	cout<<"Gram2:"<<proce_with_action.size()<<endl;
}
void PaserLL::add_Production(string str, vector<vector<string>> &p){
	vector<string> sen;
	string left;
	int t;
	for(int i=0;i<str.size();i++){
		if(str[i] == '-'){
			t = i;
			break;
		}
		else
			left += str[i];
	}
	sen.push_back(left);
	t += 2;
	string right;
	for(int i=t;i<str.size();i++){
		if(str[i] == ' '){
			sen.push_back(right);
			right.clear();
		}
		else if(str[i] == '|'){
			sen.push_back(right);
			right.clear();
			p.push_back(sen);
			sen.clear();
			sen.push_back(left);
		}
		else{
			right += str[i];
		}
	}
	sen.push_back(right);
	p.push_back(sen);

}
void PaserLL::First(){	//求产生式First集
	for (int i = 1; i <= numvt; i++){	//终结符
		first[i].push_back(i);
	}
	for(int j = 0;j<proce.size();j++){	//产生式
		int k = 0, has_0 = 0;
		do{
			has_0 = 0;
			k++;
			if(k == proce[j].size()){	//如果产生式j读完
				first[getnum[proce[j][0]]].push_back(numvt);	//添加NULL
				break;
			}
			Mixed(first[getnum[proce[j][0]]], Get(getnum[proce[j][k]], has_0));	//取
		}while(has_0);	//has_0为0结束
	}
}
void PaserLL::Follow(){
	for(int i = 0;i<2;i++){
		vector<int> m;
		m.push_back(0);
		Mixed(follow[getnum[proce[0][0]]], m);	//第一条产生式follow为End#
		for (int j = 0; j < proce.size(); j++){	//遍历每一个产生式
			for (int k = 1; k < proce[j].size(); k++){	//遍历产生式每一个成员
				if (getnum[proce[j][k]] <= numvt)	//终结符
					continue;
				int p = k, has_0;
				do{	//非终结符
					has_0 = 0;
					p++;
					if(p == proce[j].size()){	//产生式末尾+1
						Mixed(follow[getnum[proce[j][k]]], follow[getnum[proce[j][0]]]);
						break;
					}
					Mixed(follow[getnum[proce[j][k]]], Get(getnum[proce[j][p]], has_0));
				} while (has_0);
			}
		}
	}
}
void PaserLL::Table(){
	//table[左部序号][终结符序号] = 产生式序号
	for (int i = 0; i < proce.size(); i++){
		if (proce[i][1] == "NULL"){		//若first为空字符
			vector<int> flw = follow[getnum[proce[i][0]]];	//follow集
			for(int k = 0; k < flw.size(); k++){
				table[getnum[proce[i][0]]][flw[k]] = i;
			}
		}
		vector<int> temps = first[getnum[proce[i][1]]];	//first集
		for (int j = 0; j < temps.size(); j++){
			if (temps[j] != (numvt)){
				table[getnum[proce[i][0]]][temps[j]] = i;
			}
			else{	//NULL
				vector<int> flw = follow[getnum[proce[i][1]]];
				for (int k = 0; k < flw.size(); k++){
					table[getnum[proce[i][0]]][flw[k]] = i;
				}
			}
		}
		/*cout << proce[i][0] << "-->";
		for (int j = 0; j < 200; j++) {
			if (table[getnum[proce[i][0]]][j] == i)
				cout << getch[j] << "\t";
		}
		cout << endl;*/
	}
}
void PaserLL::LL1() {	//LL1文法
	bool tip = Process();
	if (tip)
		cout << "Right!" << endl;
}
int tk_index = 0;
bool PaserLL::Process(){
	//语义初始化
	SA.init();
	semantic_analysis_init();
	//LL_1分析
	stack<string> ST;
	ST.push("END#");	//栈插入结束符
	ST.push(proce_with_action[0][0]);	//起始符入栈
	while (!ST.empty()){	//若栈不空
		string current = ST.top();
		//cout << "\t\t\t" << current << endl;
		ST.pop();	//栈顶弹出
		if(current[0] == '@'){	//如果是语义动作
			Action(current);
			continue;	//弹出下一个
		}
		else{
			string word;
			if (tk_index >= token.size())
				word = "END#";
			else
				word = GetInitStr(tk_index);
			if( current == word)
				tk_index++;
			else if(current == "END#")
				return 1;
			else if(table[getnum[current]][getnum[word]] != -1){
				int k = table[getnum[current]][getnum[word]];
				for (int j = proce_with_action[k].size() - 1; j > 0; j--){  //逆序入栈
					//cout << "Stack:"<<proce_with_action[k][j] << endl;
					if (proce_with_action[k][j] != "NULL")
						ST.push(proce_with_action[k][j]);
				}
			}
			else {
				set<string> ex;
				set<string>::iterator it;
				cout << "Error!\tExpected:  ";
				for (int x = 0; x < first[getnum[current]].size(); x++) {
					if (getch[first[getnum[current]][x]] == "NULL"){
						for (int y = 0; y < follow[getnum[current]].size(); y++)
								ex.insert(getch[follow[getnum[current]][y]]);
					}
					else
						ex.insert(getch[first[getnum[current]][x]]);
				}
				int s = ex.size();
				int num = 0;
				for (it = ex.begin(); it != ex.end(); it++) {
					cout << "\"" << *it << "\"";
					num++;
					if (num != s)
						cout << " or ";

				}
				string w = token[tk_index - 1].Word;
				int key = token[tk_index - 1].Key;
				cout << " behind \""<< lex.GetStr(w,key) <<"\"";
				cout << endl;
				return 0;
			}
		}
	}
}
string PaserLL::GetInitStr(int i){
	struct Token tk = token[i];
	//cout << "TK to STR:" << i << ":" << tk.Word << "\t" << tk.Key;
	string str = lex.GetStr(tk.Word, tk.Key);
	//cout << "\t" << str << endl;
	if(tk.Word == "IT")
		str = "IDENTIFIER";
	else if(tk.Word == "cT")
		str = "CH";
	else if(tk.Word == "sT")
		str = "STR";
	else if(tk.Word == "CT")
		str = "CONSTANT";
	else if(tk.Word == "KT")
		str = ToUpper(str);
	else{
		if(str == "||")
			str = "OR_OP";
		else if(str == "&&")
			str = "AND_OP";
		else if(str == "!")
			str = "NOT_OP";
		else if(str == "==" || str == "!=" || str == ">=" || str == "<=")
			str = "RE_OP";
	}
	return str;
}
string PaserLL::ToUpper(string str){	//转换为大写
	for(int i=0;i<str.size();i++)
		str[i] = toupper(str[i]);
	return str;
}
void PaserLL::Action1(string s){
	//cout<<"Action!"<<endl;
}
void PaserLL::Mixed(vector<int> &a, vector<int> b){  //a=a or b   取a,b交集赋值给a
	set<int> temp;
	for (int i = 0; i < a.size(); i++)
		temp.insert(a[i]);
	for (int i = 0; i < b.size(); i++)
		temp.insert(b[i]);
	vector<int> ans;
	set<int>::iterator it;
	for (it = temp.begin(); it != temp.end(); it++)
		ans.push_back(*it);
	a = ans;
}
vector<int> PaserLL::Get(int vn,int & has_0){	//查找标号为vn的首元素
	if(vn == numvt)		//是NULL
		has_0 = 1;	//循环继续
	if(vn < numvt)	//是终结符
		return first[vn];	//返回first
	vector<int> ans;
	vector<int> temp;
	for (int i = 0; i < proce.size(); i++){	//非终结符
		if (getnum[proce[i][0]] == vn)	//查找非终结符的产生式
			temp = Get(getnum[proce[i][1]], has_0);
			//ans.insert(ans.end(),temp.begin(),temp.end());
			for(int k =0;k<temp.size();k++)
				ans.push_back(temp[k]);
			temp.clear();
	}
	return  ans;
}
void PaserLL::PrintGram(){	//打印文法
	cout << "Gram:" << endl;
	for(int i = 0;i<proce.size();i++){
		for(int j = 0;j<proce[i].size();j++)
			cout<<proce[i][j]<<" ";
		cout<<endl;
	}
}

void PaserLL::PrintGram_With_Action() {	//打印文法
	cout << "Gram_With_Action:" << endl;
	for (int i = 0; i < proce_with_action.size(); i++) {
		for (int j = 0; j < proce_with_action[i].size(); j++)
			cout << proce_with_action[i][j] << " ";
		cout << endl;
	}
}

void PaserLL::PrintFirst(){	//打印First集
	cout<<"First:"<<endl;
	for (int i = numvt+1; i <= num; i++){
		cout <<i<< "first [" << getch[i] << "]:";
		for (int j = 0; j < first[i].size(); j++)
			cout << getch[first[i][j]] <<" ";
		cout << endl;
	}
	cout << endl;
}
void PaserLL::PrintFollow(){	//打印Follow集
	cout<<"Follow:"<<endl;
	for (int i = numvt + 1; i <= num; i++){
		cout<<"follow["<<getch[i]<<"]:";
		for (int j = 0; j < follow[i].size(); j++)
			cout<<getch[follow[i][j]]<<" ";
		cout<<endl;
	}
	cout << endl;
}
void PaserLL::PrintTable(){	//打印Select表
	cout<<"Table:"<<endl;
	for(int i =0;i<proce.size();i++){
		// i 产生式序号
		cout<<"No."<<i<<":";
		int left = getnum[proce[i][0]];
		cout<<getch[left]<<"---\t";
		for(int j = 0;j<200;j++){
			if(table[left][j] == i){
				cout<<getch[j]<<" ";
			}
		}
		cout<<endl;
	}
}
void PaserLL::PrintToken() {
	cout << "Token:" << endl;
	cout << "Num:" << token.size() << endl;
	for (int i = 0; i < token.size(); i++)
	{
		cout << "<" << token[i].Word << "," << token[i].Key << ">\t";
	}
	cout << endl;
}

void PaserLL::Check(){	//检测终结符/非终结符重复定义
	for(int i=0;i<num;i++){
		for(int j=0;j<num;j++){
			if(i!=j&&getch[i]==getch[j])
				cout<<"Wrong!定义重复"<<getch[i]<<endl;
		}
	}
}

