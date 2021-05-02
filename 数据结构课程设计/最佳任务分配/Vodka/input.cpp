#include "input.h"
#include "km.h"
bool txtinput(string &s){
    ans.inputinit();
    double temp;
    stringstream ss(s);
    if(!(ss>>ans.pn>>ans.tn)){
        ans.pn=ans.tn=0;
        return false;
    }
    for(int i=1;i<=ans.pn;i++){
        for(int j=1;j<=ans.tn;j++){
            if(i==1){
                (ans.matrix[j]).push_back(1);
            }
            if(!(ss>>temp)){
                return false;
            }
            (ans.matrix[j]).push_back((-1)*temp);
        }
    }
    ans.pname.push_back("\0");
    ans.tname.push_back("\0");
    string name;
    for(int i=0;i<ans.pn;i++){
        if(!(ss>>name)){
            return false;
        }
        ans.pname.push_back(name);
    }
    for(int i=0;i<ans.tn;i++){
        if(!(ss>>name)){
            return false;
        }
        ans.tname.push_back(name);
    }
    return true;
}

bool finput(string &path){
    ans.inputinit();
    ifstream ss(path);
    double temp;
    if(!(ss>>ans.pn>>ans.tn)){
        ans.pn=ans.tn=0;
        return false;
    }
    for(int i=1;i<=ans.pn;i++){
        for(int j=1;j<=ans.tn;j++){
            if(i==1){
                (ans.matrix[j]).push_back(1);
            }
            if(!(ss>>temp)){
                return false;
            }
            (ans.matrix[j]).push_back((-1)*temp);
        }
    }
    ans.pname.push_back("\0");
    ans.tname.push_back("\0");
    string name;
    for(int i=0;i<ans.pn;i++){
        if(!(ss>>name)){
            return false;
        }
        ans.pname.push_back(name);
    }
    for(int i=0;i<ans.tn;i++){
        if(!(ss>>name)){
            return false;
        }
        ans.tname.push_back(name);
    }
    return true;
}
