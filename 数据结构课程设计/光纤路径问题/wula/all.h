#pragma once
#ifndef ALL_H
#define ALL_H
#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <cstdlib>
#include <cmath>
#include <algorithm>
#include <Qstring>
#include <sstream>
#include <ctime>
using namespace std;


class Building {
public:
    string name;
    float x;
    float y;
    Building(){
        name='\0';
        x=y=0;
    }
};

class edge {
public:
    int u,v;
    double d;
};

class fa {
public:
    int query(int x) {
        int r = x, y;
        while (f[x] != x) {
            x = f[x];
        }
        while (r != x) {
            y = f[r];
            f[r] = x;
            r = y;
        }
        return x;
    }

    void merge(int i, int j) {
        if (query(i) != query(j)) {
            f[query(i)] = j;
        }
    }

    fa(int n) {
        for (int i = 0; i < n; i++) {
            f.push_back(i);
        }
    }

private:
    vector<int> f;
};
extern string instring;
extern vector<Building> b;
extern vector<edge> a;
bool Inputf(vector<Building> &b,string path);
bool Input(vector<Building> &b);
bool edgecmp(const edge &a, const edge &b);
double Kruskal(vector<Building> &b, vector<edge> &ans); //返回根节点    -1无
void Output(vector<Building> &b, vector<edge> &ans,double dis);
void RandomInput(vector<Building> &b);
extern bool ifok;




#endif // ALL_H

