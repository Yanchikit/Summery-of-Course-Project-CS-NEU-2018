#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <time.h>
#include <io.h>
using namespace std;
int number = 0;
typedef struct City{    //城市结构体
    int name;
    float X;
    float Y;
}City;
void split(const string &s, vector<string> &token, const string&delimiters = " ") {    //切分字符串函数
	string::size_type lastPos = s.find_first_not_of(delimiters, 0);
	string::size_type pos = s.find_first_of(delimiters, lastPos);
	while (string::npos != pos || string::npos != lastPos) {
		token.push_back(s.substr(lastPos, pos - lastPos));
		lastPos = s.find_first_not_of(delimiters, pos);
		pos = s.find_first_of(delimiters, lastPos);
	}
}
char* TurnChar(string a) {    //string转为char*
	char *ch;
	ch = (char*)malloc((a.length() + 1) * sizeof(char*));
	a.copy(ch, a.length(), 0);
	*(ch + a.length()) = '\0';
	return ch;
}
template <class Type>
Type stringToNum(const string& str) {    //string转数值类型
	istringstream iss(str);
	Type num;
	iss >> num;
	return num;
}

class TSP{  //TSP类
private:
    char *f_path;   //文件地址
    vector<City> city;	//城市信息
    int num_city;
    double **dis;    //城市距离记录   dis[][] ---> dis[x][y] 距离
    int *visited;	//访问信息	visited[]   -1 未访问  1 已访问
    vector<int> min_path;    //最短路径
    double min_length=999999999999999; //最短路径长度
    double start_time=0,end_time=0;
	double time;	//记录程序运行时间
	//----------------------------------------
	vector<int> track;	//临时信息
	double length = 0;
public:
    TSP(){}
    TSP(string path){
        Set_OpenFile(path);
    }
	void Del() {   //初始化
		//*f_path = NULL;
		city.clear();
		for (int i = 0; i < num_city; i++) {
			delete[] dis[i];
		}
		delete[] dis;
		delete[] visited;
		num_city = 0;
		min_path.clear();
		min_length = 99999999;
		start_time = 0, end_time = 0;
	}
	~TSP() {
		//Del();
		cout << "------------------Finish------------------" << endl;
	}
	void Set_OpenFile(string path) { //设置并读取文件
		cout << "File path: " << path << endl;
		f_path = TurnChar(path);
		ifstream infile(f_path);
		if (!infile.is_open()) {
			cout << "File open failed!!!" << endl;
			return;
		}
		else {
			cout << "File has been open!!!" << endl;
			string line;
			int key = 0;
			while (getline(infile, line)) {
				//读取城市名和城市坐标
				if (line != "EOF"&&line != "") {
					if (line == "NODE_COORD_SECTION")
						key = 1;
					vector<string> token;
					split(line, token, " ");
					/*for (int i = 0; i < token.size(); i++)
						cout << token[i] << " ";
					cout << endl;*/
					if (stringToNum<int>(token[0]) != 0 && key == 1) {
						City c;
						c.name = stringToNum<int>(token[0]);
						c.X = stringToNum<double>(token[1]);
						c.Y = stringToNum<double>(token[2]);
						city.push_back(c);
						num_city++;
					}
				}
			}
			cout << "Read" << endl;
			infile.close();
		}
		num_city = city.size(); //更新数量
		cout << "The number of cities: " << num_city << endl;
	}

    void Dis(){     //计算城市间距离
        cout<<"Calculate the distance among the cities."<<endl;
        dis = new double *[num_city];   //dis visited 初始化
        visited = new int [num_city];
        for(int i=0;i<num_city;i++){
            visited[i] = -1;
            dis[i] = new double [num_city];
            for(int j=0;j<num_city;j++){
                dis[i][j]=-1;
            }
        }
        for(int i=0;i<num_city;i++){		//计算距离
            for(int j=i;j<num_city;j++){
                if(i!=j){
                    dis[j][i] = dis[i][j] = sqrt((city[i].X-city[j].X)*(city[i].X-city[j].X)+(city[i].Y-city[j].Y)*(city[i].Y-city[j].Y));
                }
            }
        }
		//PrintDisMap();
    }

	void Updata() {	//更新最优解
		if (length < min_length) {
			min_length = length;
			min_path = track;
			//cout << "New Result: " << min_length << endl;
			//cout << "Path: " << track.size() << endl;
		}
	}

	void PrintDisMap() {	//打印距离矩阵
		for (int i = 0; i < num_city; i++) {
			cout << "\t" << i;
		}
		cout << endl;
		for (int i = 0; i < num_city; i++) {
			cout << i;
			for (int j = 0; j < num_city; j++) {
				cout << "\t" << dis[i][j];
			}
			cout << endl;
		}
	}
	void PrintRes() {	//打印最优解
		cout << "The shortest length: " << min_length << endl;
	}
	double GetTime() {
		return time;
	}
	double GetLen() {
		return min_length;
	}
	int GetNumCity() {
		return num_city;
	}
	void Clean(){   //初始化
        //*f_path = NULL;
        city.clear();
        for (int i = 0; i < num_city; i++) {
            delete[] dis[i];
        }
        delete[] dis;
        delete[] visited;
        num_city=0;
        min_path.clear();
        min_length=99999999;
        start_time=0,end_time=0;
    }

	//------------------------------------------------贪心算法--------------------------------------------------------
	bool has_visited(int i) {	//判断城市i是否被访问过
		if (visited[i] == 1)
			return true;
		else
			return false;
	}
	int closestCity(int current) {
		float temp = 999999999999999;	//记录当前查找到的距离最小值
		int next = -1;	//记录下个访问城市
		for (int i = 0; i < num_city; i++) {	//寻找距离当前城市最近的城市
			if (!has_visited(i) && dis[current][i] != -1 && dis[current][i] < temp) {
				temp = dis[current][i];
				next = i;	//发现更近的城市	更新记录
			}
		}
		if (next != -1) {	//找到最近的未访问城市
			track.push_back(next);	//路径记录
			visited[next] = 1;	//访问记录
			length += temp;	//计算路径长度
			return closestCity(next);	//寻找next城市的最近未访问城市
		}
		else {	//全部城市以访问且回到起点
			return current;
		}
	}

	void Greedy() {		//贪心算法			TSP类
		if (num_city == 0) {	//无城市
			cout << "There is no city found!\nPlease Check the data file." << endl;
			return;
		}
		else {	//执行算法
			Dis();					//计算城市间距离
			start_time = clock();	//记录开始时间
			//-----------------------------------------------
			track.clear();	//路径清空
			for (int j = 0; j < num_city; j++) {	//访问记录初始化
				visited[j] = -1;
			}
			length = 0;	//路径长度初始化
			//-----------------------------------------------
			int start = 0;
			int end = -1;	//最后访问的城市
			track.push_back(start);	//访问i	压栈
			visited[start] = 1;//记录访问
			end = closestCity(start);	//递归搜索最近的城市进行访问 知道所有城市均被访问 返回最后访问的城市的序号
			track.push_back(start);	//返回起点
			length += dis[end][start];
			Updata();	//更新最优解
			end_time = clock();	//记录结束时间
			time = (end_time - start_time) / CLOCKS_PER_SEC;	//消耗时间
			cout << "Time: " << time << endl;
		}
	}
};


void getFiles(char *dic, vector<string> &files) {
	//文件句柄  
	long   hFile = 0;
	//文件信息  
	struct _finddata_t fileinfo;
	string p;
	if ((hFile = _findfirst(p.assign(dic).append("\\*").c_str(), &fileinfo)) != -1)
	{
		do
		{
			files.push_back(fileinfo.name);
		} while (_findnext(hFile, &fileinfo) == 0);
		_findclose(hFile);
	}
}

int main() {
	string root = "./Data_tsp";	//根目录
	string folder = "/ALL";	//数据文件夹
	char *dic_path = TurnChar(root + folder);	//目标文件夹
	vector<string> files_name;
	getFiles(dic_path, files_name);	//获取文件夹内所有文件名

	ofstream outfile;
	outfile.open(root + "/" + "data.csv");	//根目录下保存
	cout << "The num of Files: " << files_name.size() - 2 << endl;
	//outfile << "T0," << sap.T0 << ",T_end," << sap.T_end << ",D," << sap.D << ",L," << sap.L << ",Times," << sap.Times << endl;
	outfile << "File" << ',' << "Len" << ',' << "Num" << ',' << "Time" << endl;
	for (int i = 2; i < files_name.size(); i++) {
		number = 0;
		cout << "No " << i - 1 << ":" << endl;
		string path = root + folder + "/" + files_name[i];	//文件地址+文件名
		TSP t;
		t.Set_OpenFile(path);
		t.Greedy();
		t.PrintRes();
		cout << "The Number of Calulating: " << number;
		cout << endl;
		outfile << files_name[i] << ',' << t.GetLen() << ',' << t.GetNumCity() << ',' << t.GetTime() << endl;
		t.Del();
	}
	outfile.close();
}