#pragma once

#include "all.h"
class Tapel;

class Synbl;

class Vall;

class Rinfl_one;

class Ainfl;

class Synbl_one;
using namespace std;
extern int SEMANTIC_STACK_MAXN;
struct quat_item;
class semantic_analysis;

extern semantic_analysis SA;

class logic_block;

class assignment_block;

class arithmetic_block;

class semantic_analysis {
public:
    void *stk[100];
    int top;
    string now_name;
    string last_variable_name;
    bool is_flag_function = false;
    bool is_flag_parameter = false;
    bool is_define_variable = false;//是否在定义变量
    //bool is_switch;//swith特判，专门针对switch里的变量声明 使其不能定义变量
    int const_num;
    vector<int> arr_dimension;
    int temp_variable = 0;
    int synbl_num = 0;
    vector<string> var_define_name;//定义语句时的变量名字

    void get_last_name();//最后一个token的string置入now_name中

    bool push_stk(void *p);//指针压栈

    void *pop_stk();//出栈

    void push_type_name();//将类型名称压栈，is_define_variable=true启动定义

    void push_variable_name();//将变量名称压栈,并将改变量的名字放入last_variable_name

    void create_variable_not_arr();//生成非数组的变量，同时变量弹出栈

    void *pop_type_name();//将类型名称出栈，至此变量定义完成，is_define_variable=true关闭定义

    void insert_const();//向符号表添加常量，并更改last_variable_name

    void pop_arr_dimension();//结束，数组维度弹出栈

    void push_arr_dimension();//添加数组的维度到栈里

    void create_variable_arr();//生成数组变量，若没有对应类型将生成类型，同时变量弹出栈

    void push_Rinfl();//插入结构体表到语义栈

    void define_str();//定义无结构体表的结构体，并将结构体表插入语义栈

    void re_str_variable();//将结构体定义里的变量更正为d类型并填入结构体表中

    void create_str();//完成自定义结构体类型，删除栈内的结构体表

    void push_Var_init();//变量初始化，先放入一个初始化的结构

    void Var_init_variable();//用项去初始化，并将项弹出栈

    string get_next_temp_name();//获取下一个随机变量的名字

    string get_next_point_name();//获取下一个非临时变量的名字来解决数组问题

    void Var_init_variable_in_list();//使用列表里的项来初始化，并将项弹出栈

    void find_and_push_variable();//查找变量并放入栈中，并将改变量的名字放入last_variable_name

    void find_and_push_variable_arr_vn();//查找数组里的某一个变量，并将其入栈

    void create_or_find_variable_not_arr();//定义或者查找非数组变量

    void create_or_find_variable_arr();//定义或者查找数组变量

    void push_if_else_block();//if_else压栈初始化

    void if_else_merge_logic();//合并逻辑表达式的部分到if_else模块里，并且逻辑表达式出栈

    void if_else_merge_if_code_block();//合并if后面的复合语句代码块，并且将其弹出栈

    void if_else_merge_else_code_block();//合并else后面的复合语句代码块，并且将其弹出栈

    void if_else_end();//end if，if代码块不出栈

    void push_while_block();//while压栈初始化

    void while_merge_logic();//while 合并逻辑表达式的部分到whlie模块里，并且逻辑表达式出栈

    void while_merge_code_block();//while 合并复合代码块并弹出复合语句

    void while_end();//结束while，while不出栈

    void do_while_end();//结束do while，不出栈

    void push_for_block();//for压栈初始化

    void for_merge_init();//for 合并初始化语句，并弹出初始化语句

    void for_merge_logic();//for 合并逻辑逻辑表达，并弹出逻辑表达式

    void for_merge_last();//for 合并最后赋值语句，并弹出最后赋值语句

    void for_merge_code_block();//for 合并复合代码块并弹出复合语句

    void for_end();//for循环结束，不弹出for

    void push_assignment_block();//赋值语句压栈

    void assignment_merge_var();//将等式左端赋值给赋值语句，并把变量名声明弹出

    void assignment_end_with_arithmetic();//以算术表达式结束赋值语句，弹出顺数表达式，不弹出赋值语句

    void assignment_end_with_variable();//以变量名声明结束赋值语句，弹出变量名声明，不弹出赋值语句

    void Var_or_item_to_arithmetic();//算术表达式中，把栈顶的变量或项变成算术表达式，统一中间的结构

    void arithmetic_add();

    void arithmetic_sub();

    void arithmetic_mul();

    void arithmetic_div();//加减乘除，生成包含对应运算的算术表达式，将两个操作数的算术表达式弹栈，入栈结果

    void arithmetic_to_logic();//逻辑表达式中，把栈顶的算术表达式变成逻辑表达式，统一中间结构

    void push_logic_w();//将逻辑运算符的string放入栈中

    void logic_two_operation();//逻辑双目运算，弹出栈内的三个元素，分别是操作数1 运算符 操作数 2 ，生成新的逻辑表达式后压栈
    void logic_one_operation();//逻辑单目目运算，弹出栈内的三个元素，分别是操作数1 运算符 ，生成新的逻辑表达式后压栈

    void push_function_block();//函数定义，获取类型说明，同时建立函数定义类并将其压栈，将参数定义is_flag_parameter置为true

    void function_get_name();//函数定义，获取函数名称，同时更新函数参数前缀名，同时生成符号表

    void function_re_parameter();//函数定义，纠正参数变为形参，并且插入到函数表中

    void function_create_synbl_and_vall();//函数定义创建符号表和活动记录调用，将参数定义is_flag_parameter置为false，函数定义标志is_flag_function置为true

    void function_end();//函数定义结束，将复合语句接入函数里，弹出复合语句，并且回退函数的活动记录，函数定义标志is_flag_function置为false

    void push_continues_or_break();//跳转语句，压栈continues\break，偏移量默认为1

    void push_return();//跳转语句，压栈return，返回值默认是值为0的int

    void return_re_ans();//return 表达式，将表达式的值放入ret中，弹出表达式语句

    void re_continues_break(vector<quat_item> &code);//重新修正continues break的指向问题

    void push_code_block();//复合语句压栈，同时生成并切换符号表和活动记录，生成调用代码，并且压栈

    string get_next_synbl_name();//获得下一个符号表的名字

    void code_block_merge_code_block();//复合语句合并复合语句，并弹出后者

    void code_block_merge_if_else_block();//复合语句合并分支语句，并弹出后者

    void code_block_merge_while();//复合语句合并while语句，并弹出后者

    void code_block_merge_for();//复合语句合并for语句，并弹出后者

    void code_block_merge_jmp();//复合语句合并jmp跳转语句，并弹出后者

    void code_block_merge_assignment();//复合语句合并赋值语句，并弹出后者

    void code_block_end();//复合语句结束，切换符号表并且添加切换的代码

    void push_Var_or_item_const();//项入栈，处理常量

    void push_Var_or_item_fu_const();//项入栈，处理负常量

    void push_Var_or_item_variable();//项入栈，处理其他情况

    void Var_or_item_arr();//项，清空数组维度栈，并且更新出来数组元素。当数组维度为空时不会运行

    void Var_or_item_str();//项，获取上一个标识符，查找结构体变量

    void Var_or_item_get_parameter();//项，获取一个参数，并将参数的项弹出栈

    void Var_or_item_end_function();//项目，以函数调用结束，产生调用式子，不弹栈

    void Var_init_end();//变量初始化结束，若在函数中，与上一个复合语句结合，若不在，则与栈底的全局结合。最后将其弹栈

    void program_merge_function();//程序段，合并函数定义，并将函数定义弹出

    void program_end();//程序段，结束，进行continues和break的修正，将四元式放入向量QUATS中

    void init();//语义分析初始化

    void push_Var_or_item_char();//项入栈，处理char
};

class Var_init {//变量初始化结构
public:
    vector<quat_item> code;//存放四元组
    Synbl_one *ans;//被赋值的变量
    Synbl_one *op1;
    int pos = 0;

    bool is_variable_type_match();//判断用项初始化的时候类型之间是否符合
};

class Var_or_item {//项和变量名声明调用的产物
public:
    vector<quat_item> code;//存放四元组
    Synbl_one *ans;//变量
    vector<string> parameter;//参数列表
    void end_function(string ret);//函数调用结束
};

class Code_block {//代码块，复合语句
public:
    vector<quat_item> code;
    string code_block_name;//代码块名字
    Synbl *c_synbl;//新的符号表
    Vall *c_vall;//新的活动记录

    void create_synbl();//生成对应的符号表、活动记录表，生成调用代码
    void merge_code(vector<quat_item> &c);//合并代码，并清空向量
};

class if_else_block {//分支语句
public:
    vector<quat_item> code;
    vector<quat_item> if_code;
    vector<quat_item> else_code;
    vector<quat_item> logic_code;
    Synbl_one *logic_case;

    void merge_logic(logic_block &log);//合并逻辑表达式的部分到if_else模块里
    void merge_if(Code_block &cb);//合并if复合语句代码块
    void merge_else(Code_block &cb);//合并if复合语句代码块
    void endif();//end if
};

class logic_block {//逻辑表达式
public:
    vector<quat_item> code;
    Synbl_one *ans;

    bool merge(logic_block &op1, logic_block &op2, string w, string tans);//用w运算，将op1 op2合并到当前逻辑表达式中
};

class while_block {//while代码块
public:
    vector<quat_item> code;
    vector<quat_item> while_code;
    vector<quat_item> logic_code;
    Synbl_one *logic_case;

    void merge_logic(logic_block &log);//合并逻辑表达式的部分到logic模块里
    void merge_while(Code_block &cb);//合并复合语句代码块到while里
    void end_while();//end while
    void end_do_while();//end do while
};

class for_block {//for代码块
public:
    vector<quat_item> code;
    vector<quat_item> init_code;
    vector<quat_item> logic_code;
    vector<quat_item> last_code;
    vector<quat_item> while_code;
    Synbl_one *logic_case;

    void merge_init(assignment_block &ab);//初始化合并
    void merge_logic(logic_block &log);//合并逻辑表达式部分
    void merge_last(assignment_block &ab);//最后赋值合并
    void merge_for(Code_block &cb);//合并for 循环部分
    void end_for();//end for
};

class assignment_block {//赋值语句
public:
    vector<quat_item> code;
    Synbl_one *ans;

    void merge_var(Var_or_item &v_i);//将等式左端赋值给赋值语句
    void end_assignment_arithmetic(arithmetic_block &ab);//以算术表达式结束赋值语句
    void end_assignment_variable(Var_or_item &v_i);//以变量名声明结束赋值语句
};

class arithmetic_block {//算术表达式
public:
    vector<quat_item> code;
    Synbl_one *ans;

    bool merge(arithmetic_block &op1, arithmetic_block &op2, string w, string tans);//用w运算，将op1 op2合并到当前算术表达式中
};

class function_block {//函数
public:
    string function_name;//函数名字
    string from_name;//参数变量前缀名
    Synbl *f_synbl;//新的符号表
    Vall *f_vall;//新的活动记录
    int parameter_number = 0;//参数个数
    Synbl_one *ans;//函数返回值
    vector<quat_item> code;//四元式组
    Synbl_one *fun;//函数

    void create_synbl_and_vall();//函数定义创建符号表和活动记录调用
    void merge(Code_block &cb);//合并函数部分，添加返回值避免没有返回值
};

class jmp_block {//跳转语句
public:
    vector<quat_item> code;
    Synbl_one *ans;

    void merge(arithmetic_block &ab);//合并表达式返回值
};

class program_blcok {//程序代码块，总体
public:
    vector<quat_item> code;
    vector<quat_item> variable_init_code;
};
