#include<bits/stdc++.h> //包含了所有C++头文件的头文件
//#include<iostream>
//#include<algorithm>
//#include<cstring>
//poj
using namespace std;

static int nameNum;


struct GenStruct



{



int label;    //四元式序号



string op;



int code;     //第一元素



string addr1="0"; //第二元素



string addr2="0"; //第三元素



string result="0";//第四元素



int out_port = 0;  //记录该四元式是否为一个基本块的入口，是则为1，否则为0。



void ConvertOpToCode(string);



GenStruct(int l){ label = l; }



GenStruct(int l,string op,string a1,string a2,string res){



label = l, this->op=op, ConvertOpToCode(op), addr1 = a1, addr2 = a2, result = res;



}



};


struct basicBlock

{

	string name;

	vector<GenStruct> gens;

	vector <string> codes;

	basicBlock()

	{

		string str;

		int2str(nameNum,str);

		name = "L" + str;

		nameNum++;

	}

	void add(GenStruct g)

	{

		gens.push_back(g);

	}

};

class codeTable

{

private:

	vector<basicBlock> block; //基本块

	void initblock();  //初始化基本块

	int findblocknameByGen(int index);  //根据四元式地址找到基本块

	string findblocknameByGen(string index){

		int i = stoi(index);

		i=findblocknameByGen(i);

		if (i >= block.size()) return "End";

		return block[i].name;

	}

	vector<string> createcode(GenStruct);

	void initblockcodes();

	bool stringisinGen(string,int);  //判断string 是否在index后四元式中存在

public:

	vector<basicBlock> getBasicBlock(){ return block; }

	codeTable(){ initblock(); initblockcodes(); }

	void clearNotUse(GenStruct);

	void printcodes();

};

void codeTable::initblock()

{

	for (int i = 0; i < genStructs.size()-1; i++)

	{

		if (i == 0) {   //程序第一条为入口

			changeOut_port(0);

		}

		if (genStructs[i].code <= 58 && genStructs[i].code >= 52) //跳转语句

		{

			changeOut_port(genStructs[i].result);//跳转到的语句为入口语句

			changeOut_port(i+1); //跳转语句的下一行,为入口语句

		}

	}

	for (int i = 0; i < genStructs.size() ; ) //把入口语句加入到基本块

	{

		basicBlock bl;

		bl.add(genStructs[i]);

		i++;

		for (; i < genStructs.size(); i++)

		{

			if (genStructs[i].out_port == 1)

			{

				block.push_back(bl);

				break;

			}

			else

				bl.add(genStructs[i]);

		}

		if (i==genStructs.size())

			block.push_back(bl);

	}

}

int codeTable::findblocknameByGen(int index)

{

	for (int i = 0; i < block.size(); i++) //i为block索引

	{

		for (int j = 0; j < block[i].gens.size(); j++)

		{

			if (block[i].gens[j].label == index)

			{

				return i;

			}

		}

	}

	return -1;

}

void codeTable::initblockcodes()

{

	for (int blockindex = 0; blockindex < block.size(); blockindex++)

	{

		for (int i = 0; i < block[blockindex].gens.size(); i++)

		{

			block[blockindex].codes = merge(block[blockindex].codes, createcode(block[blockindex].gens[i]));

		}

	}

}

void codeTable::printcodes()

{

	for (int blockindex = 0; blockindex < block.size(); blockindex++)

	{

		cout << block[blockindex].name << ":\n";

		for (int i = 0; i < block[blockindex].codes.size(); i++)

		{

			cout << "      "<<block[blockindex].codes[i] << endl;

		}

	}

}

vector<string> codeTable::createcode(GenStruct gen)

{

	vector<string> codes;

	int code = gen.code;

	clearNotUse(gen);

	registers reg; int regindex,temp;

	switch (code)

	{



	case 1://op = "*";

		if (isinvalues(gen.addr1) && isinvalues(gen.addr2))

		{

			codes.push_back("MUL " + findreg(gen.addr1, regindex).name + "," + findreg(gen.addr2, temp).name);

			regs[regindex].clearPush(gen.result);

		}

		else if (isinvalues(gen.addr1) && !isinvalues(gen.addr2))

		{

			codes.push_back("MUL " + findreg(gen.addr1, regindex).name + "," + gen.addr2);

			regs[regindex].clearPush(gen.result);

		}

		else if (!isinvalues(gen.addr1) && isinvalues(gen.addr2))

		{

			codes.push_back("MUL " + findreg(gen.addr2, regindex).name + "," + gen.addr1);

			regs[regindex].clearPush(gen.result);

		}

		else{

			reg = findreg(gen.addr1, regindex);

			codes.push_back("MOV " + reg.name + "," + gen.addr1);

			codes.push_back("MUL " + reg.name + "," + gen.addr2);

			regs[regindex].clearPush(gen.result);

		}

		break;

	case 2://op = "+";



		if (isinvalues(gen.addr1) && isinvalues(gen.addr2))

		{

			codes.push_back("ADD " + findreg(gen.addr1, regindex).name + "," + findreg(gen.addr2, temp).name);

			regs[regindex].clearPush(gen.result);

		}

		else if (isinvalues(gen.addr1) && !isinvalues(gen.addr2))

		{

			codes.push_back("ADD " + findreg(gen.addr1, regindex).name + "," + gen.addr2);

			regs[regindex].clearPush(gen.result);

		}

		else if (!isinvalues(gen.addr1) && isinvalues(gen.addr2))

		{

			codes.push_back("ADD " + findreg(gen.addr2, regindex).name + "," + gen.addr1);

			regs[regindex].clearPush(gen.result);

		}

		else{

			reg = findreg(gen.addr1, regindex);

			codes.push_back("MOV " + reg.name + "," + gen.addr1);

			codes.push_back("Add " + reg.name + "," + gen.addr2);

			regs[regindex].clearPush(gen.result);

		}

		break;

	case 3://op = "-";

		codes.push_back("MOV " + findreg(gen.addr1, regindex).name + ",-" + gen.addr2);

		regs[regindex].clearPush(gen.result);

		break;

	case 4://op = "/";

		codes.push_back("DIV " + gen.addr1 + "," + gen.addr2);

		break;

	case 5://op = ":=";

		reg = findreg(gen.addr1, regindex);

		codes.push_back("MOV " + gen.result + "," + reg.name);

		regs[regindex].Rvalue.push_back(gen.result);

		break;

	case 6://op = "j";

		codes.push_back("GOTO " + findblocknameByGen(gen.result));

		break;

	case 7://op = "j<";

		codes.push_back("CMP " + gen.addr1 + "," + gen.addr2);

		codes.push_back("JL " + findblocknameByGen(gen.result));

		break;

	case 8://op = "j<=";

		codes.push_back("CMP " + gen.addr1 + "," + gen.addr2);

		codes.push_back("JLE " + findblocknameByGen(gen.result));

		break;

	case 9://op = "j<>";

		codes.push_back("CMP " + gen.addr1 + "," + gen.addr2);

		codes.push_back("JNE " + findblocknameByGen(gen.result));

		break;

	case 10://op = "j=";

		codes.push_back("CMP " + gen.addr1 + "," + gen.addr2);

		codes.push_back("JE " + findblocknameByGen(gen.result));

		break;

	case 11://op = "j>";

		codes.push_back("CMP " + gen.addr1 + "," + gen.addr2);

		codes.push_back("JG " + findblocknameByGen(gen.result));

		break;

	case 12://op = "j>=";

		codes.push_back("CMP " + gen.addr1 + "," + gen.addr2);

		codes.push_back("JGE " + findblocknameByGen(gen.result));

		break;

	default:

		break;

	}

	return codes;

}

bool codeTable::stringisinGen(string str,int index)

{

	for (int i = genStructs.size() - 1; i >= index; i--)   //因为先删除后操作，所以要把iindex是加进去

	{

		if (genStructs[i].addr1 == str || genStructs[i].addr2 == str)

			return true;

	}

	return false;

}

//遍历所有基本块，把非待用的寄存器里值给删了,把基本块里的Rvalue

void codeTable::clearNotUse(GenStruct gen)//运行到四元式的值

{

	int index = gen.label;

	//遍历所有寄存器的Rvalue 看看后没有在index之后的四元式出现

	for (int i = 0; i < regs.size(); i++)

	{

		for (int j = 0; j < regs[i].Rvalue.size(); j++)

		{

			if (!stringisinGen(regs[i].Rvalue[j], index))

			{

				//删除

				regs[i].Rvalue.erase(regs[i].Rvalue.begin() + j);

			}

		}

	}

}
