#pragma once

#include "all.h"

using namespace std;
const int NAME_MAX = 100;

class Tapel;

class Synbl;

class Vall;

class Rinfl_one;

class Ainfl;

class Synbl_one;
extern Synbl *synbl;//当前符号表
extern Vall *stack_vall[5000];//活动记录栈
extern int stack_vall_top;//活动记录栈的栈顶位置+1，0表示空

Synbl *find_synbl_by_name(char name[]);

void push_vall_function(char name[]);

void pop_vall_function();

void push_vall_not_function(char name[]);

void pop_vall_not_function();

void new_synbl_and_Vall(char name[]);

void init_symbol();

void update_Vall_and_pop();

void new_vall_display();

extern Synbl *synbl_all[5000];//全部的符号表
extern Vall *vall_all[5000];//全部的活动记录原型

extern int synbl_cnt;

class Synbl_one {//符号表的某一项
public:
    char name[NAME_MAX];//名字
    Tapel *typ;//类型指针
    char cat[5];//种类
    void *addr;//地址


};

class Synbl {//符号表
public:
    list<Synbl_one> s;//每一项的符号
    list<Tapel> arr_list;//已有的数组结构
    list<Tapel> struct_list;//已经有结构体结构
    Vall *vall;//对应的活动记录
    char name[NAME_MAX];

    int size(Tapel &type, char *tname = "\0");//返回该类型的字节数
    Tapel *find_tapel(char tname[]);//返回一个变量的类型，找不到返回NULL
    Synbl_one *find_synbl(char tname[]);//查找某一个变量，找不到返回NULL
    Tapel *find_only_this_tapel(char tname[]);//返回一个变量的类型，仅仅在这个符号表里查找，找不到返回NULL
    Synbl_one *find_only_this_synbl(char tname[]);//查找某一个变量，仅仅在这个符号表里查找，找不到返回NULL
    bool add_constant(char tname[], int n);//添加常量，成功返回true,失败返回false
    bool add_constant(char tname[], float n);//添加常量，成功返回true,失败返回false
    bool add_constant(char tname[], char n);//添加常量，成功返回true,失败返回false

    bool insert_v_or_vf_primary(char tname[], bool isflag, char n = 'i');//n表示类别
    bool insert_v_or_vf_arr_or_strcut(char tname[], bool isflag, char arr_or_struct_name[]);//插入数组、结构体变量

    Tapel *insert_type_arr(char tname[], Tapel *tap, int up);//添加数组类别,tap是数组中的一个元素的类型，up是数组上限
    bool insert_type_str_without_Rinfl(char tname[]);//添加一个没有结构体表的结果体，长度设为0，如果已经存在则返回false
    Tapel *find_arr_base_var(char tname[]);//利用变量的名字查找数组的最基本元素类型，找不到返回NULL
    Tapel*find_arr_base_var(Tapel tp);//利用变量的名字查找数组的最基本元素类型，找不到返回NULL
    bool insert_vn_primary(char tname[],char from_name[],int offset);//插入一个换名形参，offset为偏移的基础类型个数
    bool insert_vn_primary(char tname[],char from_name[],char offset[]);//插入一个换名形参，offset是结构体里的变量名称

    Synbl_one *find_synbl(char *tname,Synbl*&sv);
};

class Tapel {//类型表
public:
    char tval;//类型代码
    void *p;//指针，指向对应的信息


};

class Ainfl {//数组表
public:
    //数组下界固定为0，此处没写
    int up;//数组上界
    void *ctp;//成分类型指针
    int clen;//成分类型长度
};

class Rinfl_one {//结构体表中的一项
public:
    char id[NAME_MAX];//结构的域名
    int off;//间距
    void *typ;//域成分类型指针
};

class Rinfl {
public:
    vector<Rinfl_one> rinfl;
    int off_size;
};

class Pfinfl {//函数表
public:
    void *off;//数据存放地址入口
    int fn;//参数个数
    Synbl *param;//指向形参表
    void *entry;//入口地址
};

class Vall {//活动记录表
public:
    Synbl *synbl;//对应的符号表
    bool function_flag;//是否为函数,true为函数，false不是
    int parameter_size, local_variable_size;//开辟的参数内存大小、局部变量内存大小
    int parameter_num;//参数个数
    void *parameter;//参数
    void *local_variable;//局部变量
    Vall *display;//上一级活动记录的地址
    Vall() {
        synbl = NULL;
        parameter = NULL;
        local_variable = NULL;
        display = NULL;
        function_flag = false;
        parameter_size = local_variable_size = parameter_num = 0;
    }

    Vall(const Vall &v) {
        synbl = v.synbl;
        function_flag = v.function_flag;
        parameter_size = v.parameter_size;
        local_variable_size = v.local_variable_size;
        parameter_num = v.parameter_num;
        parameter = NULL;
        local_variable = NULL;
        display = NULL;
    }

    ~Vall() {
        free(parameter);
        free(local_variable);
    }
};