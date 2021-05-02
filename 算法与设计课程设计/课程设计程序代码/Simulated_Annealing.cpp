//模拟退火算法
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <time.h>
#include <math.h>
#include<cmath>
#include <io.h>
using namespace std;

int number = 0;
typedef struct City {    //城市结构体
	int name;
	float X;
	float Y;
}City;
typedef struct info{
	vector<int> track;
	double length = 0;
}Info;
struct sa_param {	//退火参数
	const double K = 1.3806488e-23; //波尔兹曼常数
	const double T0 = 1e4; //初始温度
	const double T_end = 1e-4; //最终温度
	const double D = 0.97; //降温速度
	const int L = 200; //同温度下迭代次数
	const int Times = 2; //退火次数
	double T = T0; //温度记录
}sap;
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

class TSP {  //TSP类
private:
	char *f_path;   //文件地址
	double optimal;
	vector<City> city;
	int num_city;
	double **dis;    //城市距离记录
	int *visited;
	struct Best		
	{
		vector<int> min_path;    //最短路径
		double min_length = 999999999999999; //最短路径长度
	}res;		//最优解
	double start_time = 0, end_time = 0;
	double Time;
	//---------------------------------------------------
	Info now;
public:
	TSP() {}
	TSP(string path) {
		Set_OpenFile(path);
	}
	~TSP() {
		//Del();
		cout << "------------------Finish------------------" << endl;
	}
	void Set_OpenFile(string path) { //设置并读取文件
		cout << "File path: " << path << endl;
		Del();
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
	void Dis() {     //计算城市间距离
		cout << "Calculate the distance among the cities." << endl;
		dis = new double *[num_city];   //dis visited 初始化
		visited = new int[num_city];
		for (int i = 0; i < num_city; i++) {
			visited[i] = -1;
			dis[i] = new double[num_city];
			for (int j = 0; j < num_city; j++) {
				dis[i][j] = -1;
			}
		}
		for (int i = 0; i < num_city; i++) {
			for (int j = i; j < num_city; j++) {
				if (i != j) {
					dis[j][i] = dis[i][j] = sqrt((city[i].X - city[j].X)*(city[i].X - city[j].X) + (city[i].Y - city[j].Y)*(city[i].Y - city[j].Y));
				}
			}
		}
		//PrintDisMap();
	}
	void Updata() {	//更新最优解
		res.min_length = now.length;
		res.min_path = now.track;
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
		cout << "The shortest length: " << res.min_length << endl;
		cout << "Track: ";
		for (int i = 0; i < res.min_path.size() - 1; i++)
			cout << res.min_path[i] << " -> ";
		cout << res.min_path[res.min_path.size() - 1] << endl;
	}
	void PrintNow() {	//打印当前路径
		cout << "Now length: " << now.length << endl;
		cout << "Track: ";
		for (int i = 0; i < now.track.size() - 1; i++)
			cout << now.track[i] << " -> ";
		cout << now.track[now.track.size() - 1] << endl;
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
		res.min_path.clear();
		res.min_length = 99999999;
		start_time = 0, end_time = 0;
	}
	void Clean() {
		for (int i = 0; i < num_city; i++)
			visited[i] = -1;	//访问记录初始化
		now.track.clear();
		now.length = 0;
	}
	double GetLen() {
		return res.min_length;
	}
	double GetNumCity() {
		return num_city;
	}
	double GetTime() {
		return Time;
	}
	double GetOptimal() {
		return optimal;
	}
	//------------------------------------------模拟退火算法-------------------------------------------------------
	bool allvisited() {
		for (int i = 0; i < num_city; i++) {
			if (visited[i] == -1)
				return false;
		}
		return true;
	}
	void calculat_len() {	//计算now的路径长度
		double len = 0;
		for (int i = 0; i < now.track.size()-1; i++) {
			len += dis[now.track[i]][now.track[i + 1]];
		}
		now.length = len;
	}
	void Rand_Res() {	//随机生成一个解
		Clean();	//初始化
		int start = rand() % num_city;	//随机生成一个起点
		now.track.push_back(start);	//记录起点
		visited[start] = 1;
		int next = -1;
		while (!allvisited()) {	//如果还有为访问的城市
			int next = rand() % num_city;	//寻找下一个点
			if (visited[next] != -1)	//已被访问过
				continue;	//继续寻找
			else {	//未被访问
				now.track.push_back(next);	//记录该城市
				visited[next] = 1;
			}
		}	//所有城市均访问
		now.track.push_back(start);	//返回起点
		calculat_len();
	}
	void Rand_Next() {	//随机生成下一个解
		now.track.pop_back();	//回到终点记录弹出
		int change_x = 0, change_y = 0;
		if (change_x == change_y) {		//确保x,y不等
			change_x = rand() % (now.track.size());//随机生成点change交换
			change_y = rand() % (now.track.size());//随机生成点change交换
		}
		if (change_x > change_y) {
			int t = change_x;
			change_x = change_y;
			change_y = t;
		}
		for (int i = 0; i <= (change_y - change_x - 1) / 2; i++) {	//随机两点间路径调转
			int temp = now.track[change_x+i];
			now.track[change_x+i] = now.track[change_y-i];
			now.track[change_y-i] = temp;
		}
		now.track.push_back(now.track[0]);	//起点压入
		calculat_len();
	}
	bool eval() {	//评估更新函数
		if (now.length < res.min_length)	//如果新路径更小则直接更新
			return true;
		else {	//否则以一定概率接受新解
			double rd = rand() / (RAND_MAX + 1.0);	//随机产生概率
			
			if (exp(-(now.length - res.min_length) / (sap.T)) > rd)
				return true;	
			else
				return false;
		}
	}
	void SAA() {	//算法
		srand(time(NULL));	//更新随机种子
		Rand_Res();	//生成一个随机解
		//cout << "RD: "<<exp(-(now.length - res.min_length) / (sap.T)) << endl;
		if (eval()) {	//判断是否更新
			Updata();
		}
		sap.T = sap.T0;
		while (sap.T > sap.T_end) {
			int P = 0;
			int now_L = ((sap.T0 - sap.T) / (sap.T0 - sap.T_end) + 1)*sap.L;
			int JMP = 0.7 * now_L;
			for (int i = 0; i < now_L; i++) {
				struct info last;	//记录当前解
				last.length = now.length;
				last.track = now.track;
				Rand_Next();
				number++;
				if (eval()) {	//判断是否更新
					Updata();
					P++;	//记录迭代成功次数
				}
				else {	//恢复原解
					now.length = last.length;
					now.track = last.track;
				}
			}
			if (P > JMP) {
				sap.T *= 0.8;
				//wcout << "\t\t\t\t\tUpdata: " << P << "JMP: "<<JMP<< endl;
			}
			else
				sap.T *= sap.D;	//降温
		}
	}
	void SA() {
		if (num_city == 0) {	//无城市
			cout << "There is no city found!\nPlease Check the data file." << endl;
			return;
		}
		else {	//执行算法
			Dis();
			start_time = clock();	//记录开始时间
			//vector<struct info> l;
			for (int i = 0; i < sap.Times; i++) { //进行 sap.Times 次退火算法
				cout << "Times: " << i << endl;
				//struct info List;
				SAA();
				/*List.length = res.min_length;	//记录每次迭代的最优解
				List.track = res.min_path;
				l.push_back(List);*/
			}
			/*res.min_path = l[0].track;
			res.min_length = l[0].length;
			for (int i = 0; i < l.size(); i++) {	//选取几次迭代中的最优解
				now.track = l[i].track;
				now.length = l[i].length;
				if (eval())
					Updata();
			}*/
			end_time = clock();		//记录结束时间
			Time = (end_time - start_time) / CLOCKS_PER_SEC;
			cout << "Time: " << Time << endl;
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
	string folder = "/Table1";	//数据文件夹
	char *dic_path = TurnChar(root+folder);	//目标文件夹
	vector<string> files_name;
	getFiles(dic_path, files_name);	//获取文件夹内所有文件名

	ofstream outfile;
	outfile.open(root+"/"+"data.csv");	//根目录下保存
	cout << "The num of Files: " << files_name.size() - 2 << endl;
	outfile << "T0," << sap.T0 << ",T_end," << sap.T_end << ",D," << sap.D  << ",L," << sap.L  << ",Times," << sap.Times << endl;
	outfile << "File" << ',' << "Len" << ',' << "Num" << ',' << "Time" << endl;
	for (int i = 2; i < files_name.size(); i++) {
		number = 0;
		cout << "No " << i - 1 << ":" << endl;
		string path = root + folder +"/" + files_name[i];	//文件地址+文件名
		TSP t;
		t.Set_OpenFile(path);
		t.SA();
		t.PrintRes();
		cout << "The Number of Calulating: " << number;
		cout << endl;
		outfile << files_name[i] << ',' << t.GetLen() << ',' << t.GetNumCity() << ',' << t.GetTime() << endl;
		t.Del();
	}
	outfile.close();
}