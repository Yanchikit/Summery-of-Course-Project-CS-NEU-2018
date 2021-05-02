#ifndef KM_H
#define KM_H
#include<iostream>
#include<algorithm>
#include<vector>
#include<string>
#include<cstring>

using namespace std;

class KM
{
public:
    KM();
    vector<double> matrix[105];
    vector<int> matchx;
    vector<int> matchy;
    double mincost;
    int tn,pn;
    bool used[105];
    vector<string> pname;
    vector<string> tname;

    bool Find(int v);
    double _km();
    bool dfs(int x);
    bool xyl();

    bool inputinit();
private:
    double numx[105],numy[105];
    double slack[105];
    int visx[105],visy[105];
    double d;
};
extern KM ans;
extern bool ifok;
#endif // KM_H
