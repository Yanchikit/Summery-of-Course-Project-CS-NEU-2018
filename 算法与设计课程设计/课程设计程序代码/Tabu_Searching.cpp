#include <iostream>
#include <algorithm>
#include <random>
#include <vector>
#include <list>
#include <io.h>
#include <istream>
#include <fstream>
#include <sstream>
#include <cmath>
#include <ctime>

using namespace std;

void getFiles(char *dic, vector<string> &files) {
    //文件句柄
    long hFile = 0;
    //文件信息
    struct _finddata_t fileinfo{};
    string p;
    if ((hFile = _findfirst(p.assign(dic).append("\\*").c_str(), &fileinfo)) != -1) {
        do {
            files.push_back(fileinfo.name);
        } while (_findnext(hFile, &fileinfo) == 0);
        _findclose(hFile);
    }
}

class City {
public:
    int num;
    double x, y;
};

class Edge {
public:
    int u, v;
    double dis;
};

class TSP {
public:
    int num;
    string file_name;
    vector<City> city;
    vector<vector<double>> edge; //从0开始计数的
    ifstream in_file;
    double ans;
    int start_time, end_time;
    //ofstream out_file;
    default_random_engine re{};

    bool open_file(string &p);

    bool load_euc_2d();

    void clear();

    double solve_tabu_one();

    double tabu_getcost(vector<int> &p);//获取该路径需要的花费

    void tabu_getnext(vector<int> &next);//将next变成下一个节点

    bool tabu_in_tabu(vector<int> &p, list<vector<int>> &tabu);//判断p是否在禁忌表中

    void tabu_insert_tabu(vector<int> &p, list<vector<int>> &tabu, int tabu_len);//向tabu插入一个路径

    double solve_tatu();
};

bool TSP::open_file(string &p) {
    in_file.open(p);
    if (!in_file.is_open()) {
        cout << "File open failed!" << endl;
        return false;
    }
    return true;
}

bool TSP::load_euc_2d() {
    clear();
    string s_tp;
    for (int i = 1; i <= 6; i++) {//跳过前六行
        getline(in_file, s_tp);
        stringstream ss(s_tp);
        if (i == 1) { //读取文件名字
            s_tp = "1";
            while (s_tp[s_tp.size() - 1] != ':') {
                ss >> s_tp;
            }
            ss >> file_name;
        }
        if (i == 4) { //读取城市个数
            s_tp = "1";
            while (s_tp[s_tp.size() - 1] != ':' && ss >> s_tp) {
            }
            ss >> num;
        }
    }
    city.resize(num + 1);
    edge.resize(num + 1);
    for (int i = 0; i < edge.size(); i++) {
        edge[i].resize(num + 1);
    }
    int n;
    double x, y;
    for (int i = 0; i < num; i++) { //读取城市信息
        in_file >> n >> x >> y;
        city[i].num = n;
        city[i].x = x;;
        city[i].y = y;
    }
    double dis;
    for (int i = 0; i < num; i++) { //遍历建立无向边
        for (int j = i + 1; j < num; j++) {
            dis = (city[i].x - city[j].x) * (city[i].x - city[j].x) + (city[i].y - city[j].y) * (city[i].y - city[j].y);
            dis = sqrt(dis);
            edge[i][j] = edge[j][i] = dis;
        }
    }
    city.clear();//没用了，清除
    in_file.close();//文件关闭
    return true;
}

void TSP::clear() {
    city.clear();
    for (auto &i:edge) {
        i.clear();
    }
    edge.clear();
    num = 0;
    file_name = "NO FILE!";
}

double TSP::solve_tabu_one() {
    int tp_cnt;
    srand(time(NULL));
    //start_time = time(NULL);//获取开始时间
    list<vector<int>> tabu;//禁忌表
    int tabu_len = num; //禁忌表长度
    vector<int> best_ans, now_ans, next_ans, next_best_ans;
    double best_cost, now_cost, next_cost, next_best_cost;
    int up_all_cnt = num;//总迭代迭代次数
    //int up_all_cnt = 50;
    int up_next_cnt = num * 5;//单次寻找的迭代次数
    for (int i = 0; i < num; i++) {
        now_ans.push_back(i);
    }
    shuffle(now_ans.begin(), now_ans.end(), std::mt19937(rand())); //洗牌随机化初始化解
    best_ans = now_ans;
    next_best_cost = next_cost = -1;//设置为-1表示无穷大
    best_cost = now_cost = tabu_getcost(now_ans);//记录当前为最优解
    for (int i = 0; i < up_all_cnt;) {//主要迭代
        next_best_cost = -1;//邻居最优解设置为无穷
        for (int j = 0; j < up_next_cnt;) {//寻找邻居中的最优解
            next_ans = now_ans;
            tabu_getnext(next_ans);//获取新的邻居
            if (!tabu_in_tabu(next_ans, tabu)) {//不在禁忌表里
                next_cost = tabu_getcost(next_ans);//获取评价
                if (next_best_cost == -1 || next_cost < next_best_cost) {//如果低于当前最佳邻居
                    next_best_cost = next_cost;
                    next_best_ans = next_ans;//更新最佳
                }
                j++; //寻找邻居次数+1
            }
        }
        if (next_best_cost == -1) {//没有找到结果
            cout << "--" << tp_cnt << "** " << best_cost << " ****  " << endl;
            return best_cost;
        }
        if (next_best_cost < best_cost) {//可以更新最优解，特赦
            best_cost = next_best_cost;
            best_ans = next_best_ans;
            tabu.clear();
            i = 0;
        } else {
            i = i + 1;
        }
        tabu_insert_tabu(next_best_ans, tabu, tabu_len);
        now_ans = next_best_ans;
        now_cost = next_cost;//更新当前值
        tp_cnt++;
    }
    //ans = best_cost;//更新最后结果
    //end_time = time(NULL);
    cout << "--" << tp_cnt << "__ " << best_cost << " --**  " << endl;
    return best_cost;
}

double TSP::tabu_getcost(vector<int> &p) {
    double res = 0;
    int last_city = p[p.size() - 1];
    for (int i = 0; i < p.size(); i++) {
        res = res + edge[last_city][p[i]];
        last_city = p[i];
    }
    return res;
}

void TSP::tabu_getnext(vector<int> &next) {
    int times = 1;
    for (int k = 0; k < times; k++) {
        int i = 0, j = 0;
        uniform_int_distribution<int> d(0, num - 1);
        while (i == j) {
            i = d(re);
            j = d(re);
        }
        //swap(next[i], next[j]);
        if (i > j) {
            swap(i, j);
        }
        while (i < j) {
            swap(next[i], next[j]);
            i++;
            j--;
        }
    }
}

bool TSP::tabu_in_tabu(vector<int> &p, list<vector<int> > &tabu) {
    bool res = false;
    for (const auto &i:tabu) {
        if (i == p) {
            res = true;
            break;
        }
    }
    return res;
}

void TSP::tabu_insert_tabu(vector<int> &p, list<vector<int> > &tabu, int tabu_len) {
    tabu.push_front(p);//直接插入到最前
    if (tabu.size() > tabu_len) {//超出上限
        tabu.pop_back();//删除最后一位
    }
}

double TSP::solve_tatu() {
    start_time = time(NULL);
    ans = -1;
    double tp_ans;
    int times = 10;
    for (int i = 0; i < times; i++) {
        cout << i << "//" << times << ' ';
        tp_ans = solve_tabu_one();
        if (ans == -1) {
            ans = tp_ans;
        } else {
            ans = min(ans, tp_ans);
        }
    }
    end_time = time(NULL);
    cout << endl;
    return ans;
}

int main() {
    char dic_path[] = "../../data/";    //目标文件夹
    vector<string> files_name;
    string tp_name;
    getFiles(dic_path, files_name);
    TSP tsp;
    ofstream out_file("ans.csv");
    out_file << "Number,File,Ans,Time" << endl;
    for (int i = 2; i < files_name.size(); i++) {
        tp_name = dic_path + files_name[i];
        tsp.open_file(tp_name);
        cout << "NO." << i - 1 << " File : " << files_name[i] << " start " << endl;
        tsp.load_euc_2d();
        tsp.solve_tatu();
        cout << i - 1 << " : " << "File is " << tsp.file_name << endl;
        cout << "ans = " << tsp.ans << endl;
        cout << "time = " << tsp.end_time - tsp.start_time << endl << endl;
        out_file << tsp.num << ",";
        out_file << tsp.file_name << ',' << tsp.ans << ',' << tsp.end_time - tsp.start_time << endl;
    }
    cout << "OK!" << endl;
    return 0;
}
