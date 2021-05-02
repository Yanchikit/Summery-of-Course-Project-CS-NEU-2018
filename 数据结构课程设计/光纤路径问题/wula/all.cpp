#include "all.h"


string instring;
vector<Building> b;
vector<edge> a;
bool ifok;
bool Inputf(vector<Building> &b,string path)
{
    int N, num;
    Building building;
    ifstream fin(path);      //从文件读入
    if (!fin)
    {
        cout << "文件打开失败！" << endl;
        return false;
    }
    if(!(fin>>N))
        return false;
    while (N--)
    {
        if(!(fin >> building.name))
            return false;
        if(!(fin >> building.x))
            return false;
        if(!(fin >> building.y))
            return false;
        b.push_back(building);
    }
    fin.close();
    //b.pop_back();   //弹出最后重复的元素
    return true;
}
bool Input(vector<Building> &b)
{
    int N, num;
    Building building;
    cout << "1.随机输入\n2.用户输入\n3.文件输入" << endl;
    cout << "请选择输入方式：";
    cout << "请输入教学楼的数目：";
    cout<<"-----------"<<endl;
    stringstream ss(instring);
    //ss<<instring;
    if(!(ss >> num)){
        return false;
    }
    cout<<num<<endl;
    while (num--)
    {
        cout << "请输入教学楼的名称：";
        if(!(ss >> building.name)){
            return false;
        }
        cout << "请输入教学楼的横坐标：";
        if(!(ss >> building.x)){
            return false;
        }
        cout << "请输入教学楼的纵坐标：";
        if(!(ss >> building.y)){
            return false;
        }
        b.push_back(building);
    }
    ss.clear();
    return true;
}

bool edgecmp(const edge &a, const edge &b) {
    return a.d < b.d;
}

double Kruskal(vector<Building> &b, vector<edge> &ans) //返回根节点    -1无
{
    double res = 0;
    ans.clear();
    vector<edge> e;
    double temp;
    for (int i = 0; i < b.size(); i++) {
        for (int j = i + 1; j < b.size(); j++) {
            temp = sqrt((double)(b[i].x - b[j].x) * (b[i].x - b[j].x) + (double)((b[i].y - b[j].y)) * ((b[i].y - b[j].y)));
            e.push_back(edge{ i, j, temp });
            e.push_back(edge{ j, i, temp });
        }
    }
    fa ff(b.size());
    sort(e.begin(), e.end(), edgecmp);
    int cnt = 0;
    for (int i = 0; i < e.size() && cnt < b.size() - 1; i++) {
        if (ff.query(e[i].u) != ff.query(e[i].v)) {
            cnt++;
            res += e[i].d;
            ans.push_back(e[i]);
            ff.merge(e[i].u, e[i].v);
        }
        else {
            continue;
        }
    }
    if (cnt == b.size() - 1)
        return res;
    else return -1;
}

void Output(vector<Building> &b, vector<edge> &ans,double dis)
{
    int num;
    num = ans.size();
    cout << num << endl;
    for (int i = 0; i < num; i++)
    {
        cout << b[ans[i].u].name << "(" << b[ans[i].u].x << "," << b[ans[i].u].y << ")" << "--" << ans[i].d << "m -->" << b[ans[i].v].name << "(" << b[ans[i].v].x << "," << b[ans[i].v].y << ")" << endl;
    }
    cout << "Total distance:" << endl << dis << "m" << endl;
}
void RandomInput(vector<Building> &b)
{
    int num;
    Building building;
    char name;
    srand(time(NULL));
    num = rand() % 24 + 2;  //随机生成的教学楼数量
    for(int i=0;i<num;i++)
    {
        name = 97 + i;

        building.name.push_back(name);
        building.x = float(rand()%800);
        building.y = float(rand()%600);

        b.push_back(building);
        building.name.clear();
    }
    b[0].name="a";
    for(int i= 0;i<b.size();i++)
    {
        cout <<b[i].name<<" "<<b[i].x<<" "<<b[i].y<<endl;
    }

}
