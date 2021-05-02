#include<bits/stdc++.h> //包含了所有C++头文件的头文件
//#include<iostream>
//#include<algorithm>
//#include<cstring>
//poj
using namespace std;

struct registers
{
    string name;
    vector<string> values;
    registers(string s){name=s;}
    registers(){};
    bool clearpush(string s)
    {
        values.clear();
        values.push_back(s);
        return true;
    }
    bool isinreg(string s)
    {
        bool f=false;
        for(int i=0;i<values.size();i++)
        {
            if(values[i]==s)
                f=true;
        }
        return f;
    }
};
vector<registers> regs={registers("AX"),registers("BX"),registers("DX")};
registers M("M");
register findreg(string a,int &index)
{
    for(int i=0;i<regs.size();i++)
    {
        if(regs[i].isinreg(a))
            {index=i;
            return regs[i];
            }
    }
    for(int i=0;i<regs.size();i++)
    {
        if(regs[i].values.size()==0)
        {
            index=i;
            return regs[i];
        }
    }
    return NULL;
}
bool isinvalues(string a)
{
    for(int i=0;i<regs.size();i++)
    {
        if(regs[i].isinreg(a))
            return true;
    }
    return false;
}

