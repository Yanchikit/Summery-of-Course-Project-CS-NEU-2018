#include "semantic_analysis.h"

int SEMANTIC_STACK_MAXN = 100;

Var_init global_init;

string path = "testfile5.txt";
Lexical *lex;
extern PaserLL p;

void semantic_analysis::get_last_name() {//最后一个token的string置入now_name中
    Token tp = lex->LastToken();
    now_name = lex->GetStr(tp.Word, tp.Key);
}

bool semantic_analysis::push_stk(void *p) {//指针压栈
    stk[top] = p;
    top++;
    return true;
}

void *semantic_analysis::pop_stk() {//出栈
    top--;
    return stk[top];
}

void semantic_analysis::push_type_name() {//将类型名称压栈
    get_last_name();
    string *tp = new string;
    if (now_name == "int" || now_name == "float" || now_name == "char" || now_name == "doulbe" || now_name == "void") {
        *tp = now_name;
    } else {
        *tp = "#str_";
        *tp += now_name;
    }
    push_stk((void *) tp);
    is_define_variable = true;
}

void semantic_analysis::push_variable_name() {//将变量名称压栈,并将改变量的名字放入last_variable_name
    get_last_name();
    string *tp = new string;
    *tp = now_name;
    push_stk(tp);
    last_variable_name = *(string *) stk[top - 1];
    var_define_name.push_back(last_variable_name);
}

void semantic_analysis::create_variable_not_arr() {//生成非数组的变量，同时变量弹出栈
    bool res = false;

    if (*(string *) stk[top - 2] == "int" || *(string *) stk[top - 2] == "float" ||
        *(string *) stk[top - 2] == "char") {
        char n = (*(string *) stk[top - 2])[0];
        if (n == 'f') {
            n = 'r';
        }
        res = synbl->insert_v_or_vf_primary((char *) (*(string *) stk[top - 1]).data(), is_flag_parameter, n);
    } else {
        res = synbl->insert_v_or_vf_arr_or_strcut((char *) (*(string *) stk[top - 1]).data(), is_flag_parameter,
                                                  (char *) (*(string *) stk[top - 2]).data());
    }
    pop_stk();
    if (!res) {
        string error = last_variable_name;
        error += "重复定义！";
        throw error;
    }
}

void *semantic_analysis::pop_type_name() {//将类型名称出栈，至此变量定义完成
    is_define_variable = false;
    return pop_stk();
}

void semantic_analysis::insert_const() {//向符号表添加常量，并更改last_variable_name
    Token tp = lex->LastToken();
    string cT = "cT", CT = "CT";
    string back_name = to_string(const_num).data();
    if (tp.Word == cT) {
        string tname = "#const_c_";
        tname += lex->GetStr(tp.Word, tp.Key);
        char c = *tname.rbegin();
        last_variable_name = tname;
        synbl->add_constant((char *) tname.data(), c);
    } else if (tp.Word == CT) {
        string value = lex->GetStr(tp.Word, tp.Key);
        stringstream ss(value);
        if (value.find('.') == string::npos) {//没有找到，整数
            int c;
            ss >> c;
            string tname = "#const_i_";
            tname += value;
            last_variable_name = tname;
            synbl->add_constant((char *) tname.data(), c);
        } else {
            float c;
            ss >> c;
            string tname = "#const_r_";
            tname += value;
            last_variable_name = tname;
            synbl->add_constant((char *) tname.data(), c);
        }
    }
}

void semantic_analysis::pop_arr_dimension() {//将类型名称出栈，至此变量定义完成，is_define_variable=true关闭定义
    arr_dimension.clear();
}

void semantic_analysis::push_arr_dimension() {//添加数组的维度到栈里
    Synbl_one *tp = synbl->find_synbl((char *) last_variable_name.data());
    if (tp->cat[0] == 'c' && tp->typ->tval == 'i') {
        arr_dimension.push_back((int) (*(short *) tp->addr));
    }
}

void semantic_analysis::create_variable_arr() {//生成数组变量，若没有对应类型将生成类型，同时变量弹出栈
    string typname = "#arr_";
    string stp = *(string *) stk[top - 2];
    typname += stp;
    Tapel *last_tpy, *tp, *ttp;//处理单独的变量类型表
    if (*(string *) stk[top - 2] == "int" || *(string *) stk[top - 2] == "float" ||
        *(string *) stk[top - 2] == "char") {//基础类型
        char n = (*(string *) stk[top - 2])[0];
        if (n == 'f') {
            n = 'r';
        }
        last_tpy = new Tapel;
        last_tpy->tval = n;
        last_tpy->p = NULL;
    } else {//结构体类型
        last_tpy = synbl->find_tapel((char *) stk[top - 2]);
        if (last_tpy == NULL) {//结构体类型没有被定义
        }
    }
    for (auto i = arr_dimension.rbegin(); i != arr_dimension.rend(); i++) {
        if (*i < 0) {
            throw "数组维度必须为非负整数！";
        }
        typname += "_" + to_string(*i);
        tp = synbl->find_tapel((char *) typname.data());
        if (tp == NULL) {//tp更新为最新的类型，last_tpy更新为上次tp的类型
            ttp = tp;
            tp = synbl->insert_type_arr((char *) typname.data(), last_tpy, *i);
            last_tpy = tp;
        } else {
            last_tpy = tp;
        }
    }
    synbl->insert_v_or_vf_arr_or_strcut((char *) (*(string *) stk[top - 1]).data(), is_flag_parameter,
                                        (char *) typname.data());
    last_variable_name = *(string *) stk[top - 1];
    pop_stk();
    arr_dimension.clear();
}

void semantic_analysis::push_Rinfl() {//插入结构体表到语义栈
    Rinfl *rtp = new Rinfl;
    push_stk(rtp);
}

void semantic_analysis::define_str() {
    var_define_name.clear();
    if (!(synbl->insert_type_str_without_Rinfl((char *) (*(string *) stk[top - 1]).data()))) {
        throw "结构体重复定义！\n";
    }
    push_Rinfl();
}

void semantic_analysis::re_str_variable() {//将结构体定义里的变量更正为d类型并填入结构体表中
    int s = 0;
    for (const auto &i:var_define_name) {
        Synbl_one *s_one_tp = synbl->find_synbl((char *) i.data());
        Rinfl_one r_one_tp;
        strcpy(r_one_tp.id, s_one_tp->name);
        r_one_tp.off = ((Rinfl *) stk[top - 1])->off_size;
        r_one_tp.typ = s_one_tp->typ;
        ((Rinfl *) stk[top - 1])->rinfl.push_back(r_one_tp);
        s = synbl->size(*s_one_tp->typ, s_one_tp->name);
        ((Rinfl *) stk[top - 1])->off_size += s;
        delete s_one_tp->addr;
        s_one_tp->addr = new short;
        *(short *) s_one_tp->addr = (short) s;
        strcpy(s_one_tp->cat, "d");
    }
    var_define_name.clear();
}

void semantic_analysis::create_str() {//完成自定义结构体类型，删除栈内的结构体表
    Synbl_one *s_one_tp = synbl->find_synbl((char *) ((*(string *) stk[top - 2]).data()));
    s_one_tp->typ->p = (Synbl_one *) stk[top - 1];
    pop_stk();//弹出栈并赋值给typ->p
    *(short *) s_one_tp->addr = (short) ((Rinfl *) (s_one_tp->typ->p))->off_size;
    synbl->struct_list.push_back(*s_one_tp->typ);
}

void semantic_analysis::push_Var_init() {//变量初始化，先放入一个初始化的结构
    Var_init *v_init = new Var_init;
    v_init->ans = synbl->find_synbl((char *) last_variable_name.data());
    v_init->pos = 0;
    push_stk(v_init);
}

void semantic_analysis::Var_init_variable() {//用项去初始化，并将项弹出栈
    ((Var_init *) stk[top - 2])->code.insert(((Var_init *) stk[top - 2])->code.end(),
                                             ((Var_or_item *) stk[top - 1])->code.begin(),
                                             ((Var_or_item *) stk[top - 1])->code.end());
    ((Var_init *) stk[top - 2])->op1 = synbl->find_synbl((((Var_or_item *) stk[top - 1])->ans->name));
    if (!((Var_init *) stk[top - 2])->is_variable_type_match()) {//类型不符合报错
        string error = ((Var_init *) stk[top - 2])->ans->name;
        error += "、";
        error += ((Var_init *) stk[top - 2])->op1->name;
        error += "类型不符合！";
        throw error;
    }
    quat_item q_i_tp;
    q_i_tp.w = "=";
    q_i_tp.op1 = ((Var_init *) stk[top - 2])->op1->name;
    q_i_tp.op2 = "_";
    q_i_tp.t = ((Var_init *) stk[top - 2])->ans->name;
    ((Var_init *) stk[top - 2])->code.push_back(q_i_tp);
    pop_stk();
}

bool Var_init::is_variable_type_match() {//判断用项初始化的时候类型之间是否符合
    if (ans->typ->p == NULL && op1->typ->p == NULL) {
        return ans->typ->tval == op1->typ->tval;
    } else if (ans->typ->tval == 'd' && op1->typ->tval == 'd') {
        return ans->typ->p == op1->typ->p;
    }
    return false;
}

string semantic_analysis::get_next_temp_name() {//获取下一个随机变量的名字
    string res = "#temp_";
    res += to_string(temp_variable);
    temp_variable++;
    return res;
}

void semantic_analysis::Var_init_variable_in_list() {//使用列表里的项来初始化，并将项弹出栈
    ((Var_init *) stk[top - 2])->code.insert(((Var_init *) stk[top - 2])->code.end(),
                                             ((Var_or_item *) stk[top - 1])->code.begin(),
                                             ((Var_or_item *) stk[top - 1])->code.end());
    string var_name = get_next_point_name();
    if (!(synbl->insert_vn_primary((char *) var_name.data(), ((Var_init *) stk[top - 2])->ans->name,
                                   ((Var_init *) stk[top - 2])->pos))) {
        string error = ((Var_init *) stk[top - 2])->ans->name;
        error += "不是数组！";
        throw error;
    }
    Synbl_one *var = synbl->find_synbl((char *) var_name.data());
    quat_item q_i_tp;
    q_i_tp.w = "[]";
    q_i_tp.op1 = to_string(((Var_init *) stk[top - 2])->pos);
    q_i_tp.op2 = ((Var_init *) stk[top - 2])->ans->name;
    q_i_tp.t = var_name;
    ((Var_init *) stk[top - 2])->code.push_back(q_i_tp);//生成叉总的四元组
    swap(((Var_init *) stk[top - 2])->ans, var);
    ((Var_init *) stk[top - 2])->op1 = synbl->find_synbl((((Var_or_item *) stk[top - 1])->ans->name));
    if (!((Var_init *) stk[top - 2])->is_variable_type_match()) {//类型不符合报错
        string error = ((Var_init *) stk[top - 2])->ans->name;
        error += "、";
        error += ((Var_init *) stk[top - 2])->op1->name;
        error += "类型不符合！";
        throw error;
    }
    q_i_tp.w = "=";
    q_i_tp.op1 = ((Var_init *) stk[top - 2])->op1->name;
    q_i_tp.op2 = "_";
    q_i_tp.t = ((Var_init *) stk[top - 2])->ans->name;
    ((Var_init *) stk[top - 2])->code.push_back(q_i_tp);
    swap(((Var_init *) stk[top - 2])->ans, var);
    ((Var_init *) stk[top - 2])->pos++;
    pop_stk();
}

void semantic_analysis::find_and_push_variable() {//查找变量并放入栈中，并将改变量的名字放入last_variable_name
    string *tname = (string *) stk[top - 1];
    pop_stk();
    Synbl_one *var = synbl->find_synbl((char *) tname->data());
    if (var == NULL) {//变量不存在
        string error = *tname;
        error += "未定义";
        throw error;
    }
    last_variable_name = *tname;
    Var_or_item *v_or_i;
    v_or_i = new Var_or_item;
    v_or_i->ans = var;
    push_stk(v_or_i);//入栈
}

void semantic_analysis::find_and_push_variable_arr_vn() {//查找数组里的某一个变量，并将其入栈
    int offset = 0;
    Synbl_one *var = synbl->find_synbl((char *) ((string *) stk[top - 1])->data());
    pop_stk();
    Tapel *tp;
    tp = var->typ;
    Var_or_item *v_or_i = new Var_or_item;
    for (int i = 0; i < arr_dimension.size(); i++) {
        if (tp->tval == 'a') {
            offset += ((Ainfl *) (tp->p))->clen * arr_dimension[i];
            tp = (Tapel *) ((Ainfl *) (tp->p))->ctp;
        } else {
            string error = var->name;
            error += "不匹配";
            throw error;
        }
    }
    quat_item it;
    it.w = "[]";
    it.op1 = to_string(offset);
    it.op2 = var->name;
    it.t = get_next_point_name();
    synbl->insert_vn_primary((char *) it.t.data(), var->name, offset);
    v_or_i->code.push_back(it);
    v_or_i->ans = synbl->find_synbl((char *) it.t.data());
    push_stk(v_or_i);
}

void semantic_analysis::create_or_find_variable_not_arr() {//定义或者查找非数组变量
    if (is_define_variable) {
        create_variable_not_arr();
    } else {
        find_and_push_variable();
    }
}

void semantic_analysis::create_or_find_variable_arr() {//定义或者查找数组变量
    if (is_define_variable) {
        create_variable_arr();
    } else {
        find_and_push_variable_arr_vn();
    }
}

void semantic_analysis::push_if_else_block() {//if_else压栈初始化
    if_else_block *if_else_tp = new if_else_block;
    push_stk(if_else_tp);
}

void semantic_analysis::if_else_merge_logic() {//合并逻辑表达式的部分到if_else模块里，并且逻辑表达式出栈
    ((if_else_block *) stk[top - 2])->merge_logic(*(logic_block *) stk[top - 1]);
    pop_stk();
}

void if_else_block::merge_logic(logic_block &log) {//合并逻辑表达式的部分到if_else模块里
    logic_code.insert(logic_code.end(), log.code.begin(), log.code.end());
    logic_case = log.ans;
}

void if_else_block::merge_if(Code_block &cb) {//合并if复合语句代码块
    if_code.insert(if_code.end(), cb.code.begin(), cb.code.end());
}

void semantic_analysis::if_else_merge_if_code_block() {//合并if后面的复合语句代码块，并且将其弹出栈
    ((if_else_block *) stk[top - 2])->merge_if(*(Code_block *) stk[top - 1]);
    pop_stk();
}

void if_else_block::merge_else(Code_block &cb) {//合并else复合语句代码块
    else_code.insert(else_code.end(), cb.code.begin(), cb.code.end());
}

void semantic_analysis::if_else_merge_else_code_block() {//合并else后面的复合语句代码块，并且将其弹出栈
    ((if_else_block *) stk[top - 2])->merge_else(*(Code_block *) stk[top - 1]);
    pop_stk();
}

string semantic_analysis::get_next_point_name() {//获取下一个非临时变量的名字来解决数组问题
    string res = "#p_";
    res += to_string(temp_variable);
    temp_variable++;
    return res;
}

void semantic_analysis::if_else_end() {// end if，if代码块不出栈
    ((if_else_block *) stk[top - 1])->endif();
}

void if_else_block::endif() {//end if
    code.insert(code.end(), logic_code.begin(), logic_code.end());
    quat_item if_item;
    if_item.w = "if";
    if_item.op1 = logic_case->name;
    if_item.op2 = "_";
    if (else_code.empty()) {//if语句
        if_item.t = to_string(if_code.size() + 1);
    } else {
        if_item.t = to_string(if_code.size() + 2);
    }
    code.push_back(if_item);
    code.insert(code.end(), if_code.begin(), if_code.end());
    if (!else_code.empty()) {//else语句
        quat_item else_item;
        else_item.w = "el";
        else_item.op1 = "_";
        else_item.op2 = "_";
        else_item.t = to_string(else_code.size() + 1);
        code.push_back(else_item);
        code.insert(code.end(), else_code.begin(), else_code.end());
    }
    quat_item end_if_item;
    end_if_item.w = "ie";
    end_if_item.op1 = "_";
    end_if_item.op2 = "_";
    end_if_item.t = "_";
    code.push_back(end_if_item);
    logic_code.clear();
    if_code.clear();
    else_code.clear();
}

void semantic_analysis::push_while_block() {//while压栈初始化
    while_block *while_tp = new while_block;
    push_stk(while_tp);
}

void semantic_analysis::while_merge_logic() {//合并逻辑表达式的部分到whlie模块里，并且逻辑表达式出栈
    ((while_block *) stk[top - 2])->merge_logic(*(logic_block *) stk[top - 1]);
    pop_stk();
}

void while_block::merge_logic(logic_block &log) {//合并逻辑表达式的部分到while模块里
    logic_code.insert(logic_code.end(), log.code.begin(), log.code.end());
    logic_case = log.ans;
}

void semantic_analysis::while_merge_code_block() {//合并复合代码块并弹出复合语句
    ((while_block *) stk[top - 2])->merge_while(*(Code_block *) stk[top - 1]);
    pop_stk();
}

void semantic_analysis::while_end() {//结束while，while不出栈
    ((while_block *) stk[top - 1])->end_while();
}

void while_block::merge_while(Code_block &cb) {//合并复合语句代码块到while里
    while_code.insert(while_code.end(), cb.code.begin(), cb.code.end());
}

void while_block::end_while() {//end while
    quat_item wh_item;
    wh_item.w = "wh";
    wh_item.op1 = "_";
    wh_item.op2 = "_";
    wh_item.t = "_";
    code.push_back(wh_item);
    code.insert(code.end(), logic_code.begin(), logic_code.end());
    quat_item do_item;
    do_item.w = "do";
    do_item.op1 = logic_case->name;
    do_item.op2 = "_";
    do_item.t = to_string(while_code.size() + 2);
    code.push_back(do_item);
    code.insert(code.end(), while_code.begin(), while_code.end());
    quat_item we_item;
    we_item.w = "we";
    we_item.op1 = "_";
    we_item.op2 = "_";
    we_item.t = "-" + to_string((while_code.size() + 2));
    code.push_back(we_item);
    while_code.clear();
    logic_code.clear();
}

void semantic_analysis::do_while_end() {//结束do while，不出栈
    ((while_block *) stk[top - 1])->end_do_while();
}

void while_block::end_do_while() {//end do while
    code.insert(code.end(), while_code.begin(), while_code.end());
    end_while();
}

void semantic_analysis::push_for_block() {//for压栈初始化
    for_block *ftp = new for_block;
    push_stk(ftp);
}

void semantic_analysis::for_merge_init() {//for 合并初始化语句，并弹出初始化语句
    ((for_block *) stk[top - 2])->merge_init(*(assignment_block *) stk[top - 1]);
    pop_stk();
}

void for_block::merge_init(assignment_block &ab) {//初始化合并
    init_code.insert(init_code.end(), ab.code.begin(), ab.code.end());
}

void semantic_analysis::for_merge_logic() {//for 合并逻辑逻辑表达，并弹出逻辑表达式
    ((for_block *) stk[top - 2])->merge_logic(*(logic_block *) stk[top - 1]);
    pop_stk();
}

void for_block::merge_logic(logic_block &log) {//合并逻辑表达式部分
    logic_code.insert(logic_code.end(), log.code.begin(), log.code.end());
    logic_case = log.ans;
}

void semantic_analysis::for_merge_last() {//for 合并最后赋值语句，并弹出最后赋值语句
    ((for_block *) stk[top - 2])->merge_last(*(assignment_block *) stk[top - 1]);
    pop_stk();
}

void for_block::merge_last(assignment_block &ab) {//最后赋值合并
    last_code.insert(last_code.end(), ab.code.begin(), ab.code.end());
}

void semantic_analysis::for_merge_code_block() {//for 合并复合代码块并弹出复合语句
    ((for_block *) stk[top - 2])->merge_for(*(Code_block *) stk[top - 1]);
    pop_stk();
}

void for_block::merge_for(Code_block &cb) {//合并for 循环部分
    while_code.insert(while_code.end(), cb.code.begin(), cb.code.end());
}

void semantic_analysis::for_end() {//for循环结束，不弹出for
    ((for_block *) stk[top - 1])->end_for();
}

void for_block::end_for() {//end for
    code.insert(code.end(), init_code.begin(), init_code.end());
    quat_item wh_item;
    wh_item.w = "wh";
    wh_item.op1 = "_";
    wh_item.op2 = "_";
    wh_item.t = "_";
    code.push_back(wh_item);
    code.insert(code.end(), logic_code.begin(), logic_code.end());
    quat_item do_item;
    do_item.w = "do";
    do_item.op1 = logic_case->name;
    do_item.op2 = "_";
    do_item.t = to_string(while_code.size() + last_code.size() + 2);
    code.push_back(do_item);
    code.insert(code.end(), while_code.begin(), while_code.end());
    code.insert(code.end(), last_code.begin(), last_code.end());
    quat_item we_item;
    we_item.w = "we";
    we_item.op1 = "_";
    we_item.op2 = "_";
    we_item.t = "-" + to_string((while_code.size() + last_code.size() + 2));
    code.push_back(we_item);
    while_code.clear();
    logic_code.clear();
    init_code.clear();
    last_code.clear();
}

void semantic_analysis::push_assignment_block() {//赋值语句压栈
    assignment_block *tp = new assignment_block;
    push_stk(tp);
}

void semantic_analysis::assignment_merge_var() {//将等式左端赋值给赋值语句，并把变量名声明弹出
    ((assignment_block *) stk[top - 2])->merge_var(*(Var_or_item *) (stk[top - 1]));
    pop_stk();
}

void assignment_block::merge_var(Var_or_item &v_i) {//将等式左端赋值给赋值语句
    code.insert(code.end(), v_i.code.begin(), v_i.code.end());
    ans = v_i.ans;
}

void semantic_analysis::assignment_end_with_arithmetic() {//以算术表达式结束赋值语句，弹出顺数表达式，不弹出赋值语句
    ((assignment_block *) stk[top - 2])->end_assignment_arithmetic(*(arithmetic_block *) stk[top - 1]);
    pop_stk();
}

void assignment_block::end_assignment_arithmetic(arithmetic_block &ab) {//以算术表达式结束赋值语句
    code.insert(code.end(), ab.code.begin(), ab.code.end());
    quat_item assign;
    assign.w = "=";
    assign.op1 = ab.ans->name;
    assign.op2 = "_";
    assign.t = ans->name;
    code.push_back(assign);
}

void semantic_analysis::assignment_end_with_variable() {//以变量名声明结束赋值语句，弹出变量名声明，不弹出赋值语句
    ((assignment_block *) stk[top - 2])->end_assignment_variable(*(Var_or_item *) stk[top - 1]);
    pop_stk();
}

void assignment_block::end_assignment_variable(Var_or_item &v_i) {//以变量名声明结束赋值语句，弹出变量名声明，不弹出赋值语句
    code.insert(code.end(), v_i.code.begin(), v_i.code.end());
    quat_item assign;
    assign.w = "=";
    assign.op1 = v_i.ans->name;
    assign.op2 = "_";
    assign.t = ans->name;
}

void semantic_analysis::Var_or_item_to_arithmetic() {//算术表达式中，把栈顶的变量或项变成算术表达式，统一中间的结构
    arithmetic_block *tp = new arithmetic_block;
    Var_or_item *vtp = (Var_or_item *) stk[top - 1];
    tp->ans = vtp->ans;
    tp->code.insert(tp->code.end(), vtp->code.begin(), vtp->code.end());
    pop_stk();
    push_stk(tp);
}

bool
arithmetic_block::merge(arithmetic_block &op1, arithmetic_block &op2, string w, string tans) {//用w运算，将op1 op2合并到当前算术表达式中
    code.insert(code.end(), op1.code.begin(), op1.code.end());
    code.insert(code.end(), op2.code.begin(), op2.code.end());
    quat_item it;
    it.op1 = op1.ans->name;
    it.op2 = op2.ans->name;
    it.w = w;
    it.t = tans;
    code.push_back(it);
    char n = 'i';
    if (!(op1.ans->typ->p == NULL && op2.ans->typ->p == NULL)) {
        string error = it.op1;
        error += " ";
        error += it.op2;
        error += "不可进行算术运算！";
        throw error;
    }
    if (op1.ans->typ->tval == 'r' || op2.ans->typ->tval == 'r') {
        n = 'r';
    }
    if (op1.ans->typ->tval == 'i' || op2.ans->typ->tval == 'i') {
        n = 'i';
    }
    if (op1.ans->typ->tval == 'c' || op2.ans->typ->tval == 'c') {
        n = 'c';
    }
    synbl->insert_v_or_vf_primary((char *) tans.data(), false, n);
    Synbl_one *s_one = synbl->find_synbl((char *) tans.data());
    ans = s_one;
    return true;
}

void semantic_analysis::arithmetic_add() {
    arithmetic_block *res = new arithmetic_block;
    arithmetic_block *op1 = (arithmetic_block *) stk[top - 2], *op2 = (arithmetic_block *) stk[top - 1];
    res->merge(*op1, *op2, "+", get_next_temp_name());
    pop_stk();
    pop_stk();
    delete op1;
    delete op2;
    push_stk(res);
}

void semantic_analysis::arithmetic_sub() {
    arithmetic_block *res = new arithmetic_block;
    arithmetic_block *op1 = (arithmetic_block *) stk[top - 2], *op2 = (arithmetic_block *) stk[top - 1];
    res->merge(*op1, *op2, "-", get_next_temp_name());
    pop_stk();
    pop_stk();
    delete op1;
    delete op2;
    push_stk(res);
}

void semantic_analysis::arithmetic_mul() {
    arithmetic_block *res = new arithmetic_block;
    arithmetic_block *op1 = (arithmetic_block *) stk[top - 2], *op2 = (arithmetic_block *) stk[top - 1];
    res->merge(*op1, *op2, "*", get_next_temp_name());
    pop_stk();
    pop_stk();
    delete op1;
    delete op2;
    push_stk(res);
}

void semantic_analysis::arithmetic_div() {
    arithmetic_block *res = new arithmetic_block;
    arithmetic_block *op1 = (arithmetic_block *) stk[top - 2], *op2 = (arithmetic_block *) stk[top - 1];
    res->merge(*op1, *op2, "/", get_next_temp_name());
    pop_stk();
    pop_stk();
    delete op1;
    delete op2;
    push_stk(res);
}

void semantic_analysis::arithmetic_to_logic() {//逻辑表达式中，把栈顶的算术表达式变成逻辑表达式，统一中间结构
    logic_block *tp = new logic_block;
    arithmetic_block *vtp = (arithmetic_block *) stk[top - 1];
    tp->ans = vtp->ans;
    tp->code.insert(tp->code.end(), vtp->code.begin(), vtp->code.end());
    pop_stk();
    delete vtp;
    push_stk(tp);
}

void semantic_analysis::push_logic_w() {//将逻辑运算符的string放入栈中
    get_last_name();
    string *tp = new string;
    *tp = now_name;
    push_stk(tp);
}

void semantic_analysis::logic_two_operation() {//逻辑双目运算，弹出栈内的三个元素，分别是操作数1 运算符 操作数 2 ，生成新的逻辑表达式后压栈
    logic_block *res = new logic_block;
    logic_block *op1 = (logic_block *) stk[top - 3], *op2 = (logic_block *) stk[top - 1];
    string *w_tp = (string *) stk[top - 2];
    res->merge(*op1, *op2, *w_tp, get_next_temp_name());
    pop_stk();
    pop_stk();
    pop_stk();
    delete op1;
    delete op2;
    delete w_tp;
    push_stk(res);
}

bool logic_block::merge(logic_block &op1, logic_block &op2, string w, string tans) {//用w运算，将op1 op2合并到当前逻辑表达式中
    code.insert(code.end(), op1.code.begin(), op1.code.end());
    code.insert(code.end(), op2.code.begin(), op2.code.end());
    quat_item it;
    it.op1 = op1.ans->name;
    it.op2 = op2.ans->name;
    it.w = w;
    it.t = tans;
    code.push_back(it);
    char n = 'i';
    if (!(op1.ans->typ->p == NULL && op2.ans->typ->p == NULL)) {
        string error = it.op1;
        error += " ";
        error += it.op2;
        error += "不可进行逻辑运算！";
        throw error;
    }
    synbl->insert_v_or_vf_primary((char *) tans.data(), false, n);
    Synbl_one *s_one = synbl->find_synbl((char *) tans.data());
    ans = s_one;
    return true;
}

void semantic_analysis::logic_one_operation() {//逻辑单目目运算，弹出栈内的三个元素，分别是操作数1 运算符 ，生成新的逻辑表达式后压栈
    logic_block *op1 = (logic_block *) stk[top - 1];
    string *w_tp = (string *) stk[top - 2], tans = get_next_temp_name();
    quat_item it;
    it.op1 = op1->ans->name;
    it.op2 = "_";
    it.w = *w_tp;
    it.t = tans;
    op1->code.push_back(it);//放入单目运算
    char n = 'i';
    synbl->insert_v_or_vf_primary((char *) tans.data(), false, n);
    Synbl_one *s_one = synbl->find_synbl((char *) tans.data());
    op1->ans = s_one;//生成临时变量，更改ans
    pop_stk();
    pop_stk();
    delete w_tp;
    push_stk(op1);//弹出后再次插入
}

void semantic_analysis::push_function_block() {//获取类型说明，同时建立函数定义类并将其压栈，将参数定义is_flag_parameter置为true
    get_last_name();//获取函数返回值类型
    function_block *tp = new function_block;
    char s = now_name[0];//确定函数返回值类型
    if (s == 'f') {
        s = 'r';
    }
    if (s == 'v') {//无类型当整型处理
        s = 'i';
    }
    string ans_name = get_next_temp_name();
    synbl->insert_v_or_vf_primary((char *) ans_name.data(), true, s);
    tp->ans = synbl->find_synbl((char *) ans_name.data());

    is_flag_parameter = true;
    push_stk(tp);
}

void semantic_analysis::function_get_name() {//函数定义，获取函数名称，同时更新函数参数前缀名
    get_last_name();
    ((function_block *) stk[top - 1])->from_name = now_name;
    ((function_block *) stk[top - 1])->function_name = "#f_";
    ((function_block *) stk[top - 1])->function_name += now_name;
    char tname[105];
    strcpy(tname, (char *) now_name.data());
    Synbl_one *tp = synbl->find_only_this_synbl(tname);
    if (tp != NULL) {
        throw "函数重名！";
    }
    Synbl_one s_one_tp;
    strcpy(s_one_tp.name, tname);
    s_one_tp.typ = new Tapel;
    s_one_tp.typ->tval = ((function_block *) stk[top - 1])->ans->typ->tval;
    s_one_tp.typ->p = ((function_block *) stk[top - 1])->ans->typ->p;
    strcpy(s_one_tp.cat, "f");
    s_one_tp.addr = new vector<string>;//这里将addr设计为了形参的名称表，其他的改了
    synbl->s.push_back(s_one_tp);
    ((function_block *) stk[top - 1])->fun = &(*synbl->s.rbegin());
}

void semantic_analysis::function_re_parameter() {//函数定义，纠正参数变为形参，并且插入到函数表中
    Synbl_one *tp = synbl->find_synbl((char *) last_variable_name.data());
    if (tp->cat[0] != 'v') {
        string error = tp->name;
        error += "必须为变量";
        throw error;
    }
    strcpy(tp->cat, "vf");
    ((function_block *) stk[top - 2])->parameter_number++;
    ((vector<string> *) (((function_block *) stk[top - 2])->fun->addr))->push_back(last_variable_name);
}

void
semantic_analysis::function_create_synbl_and_vall() {//函数定义创建符号表和活动记录调用，将参数定义is_flag_parameter置为false，函数定义标志is_flag_function置为true
    ((function_block *) stk[top - 1])->create_synbl_and_vall();
    push_vall_function((char *) ((function_block *) stk[top - 1])->function_name.data());
    is_flag_parameter = false;
    is_flag_function = true;
}

void function_block::create_synbl_and_vall() {//函数定义创建符号表和活动记录调用
    f_synbl = new Synbl;
    f_vall = new Vall;
    f_vall->function_flag = true;
    f_vall->synbl = f_synbl;
    f_vall->local_variable_size = f_vall->parameter_size = f_vall->parameter_num = 0;
    strcpy(f_synbl->name, (char *) function_name.data());
    f_synbl->vall = f_vall;
    synbl_all[synbl_cnt] = f_synbl;
    vall_all[synbl_cnt++] = f_vall;
}

void semantic_analysis::function_end() {//函数定义结束，将复合语句接入函数里，弹出复合语句，并且回退函数的活动记录，函数定义标志is_flag_function置为false
    ((function_block *) stk[top - 2])->merge(*((Code_block *) stk[top - 1]));
    quat_item it;
    it.w = "f_begin";
    it.op1 = "_";
    it.op2 = "_";
    it.t = ((function_block *) stk[top - 2])->fun->name;
    ((function_block *) stk[top - 2])->code.insert((((function_block *) stk[top - 2])->code.begin()), it);
    it.w = "f_end";
    ((function_block *) stk[top - 2])->code.push_back(it);
    pop_vall_function();
    pop_stk();
    is_flag_function = false;
}

void function_block::merge(Code_block &cb) {//合并函数部分，添加返回值避免没有返回值
    code.insert(code.end(), cb.code.begin(), cb.code.end());
    quat_item it;
    it.w = "ret";
    it.op1 = "_";
    it.op2 = "_";
    it.t = "#null_i_0";
    code.push_back(it);
}

void semantic_analysis::push_continues_or_break() {//跳转语句，压栈跳转语句，偏移量默认为1
    jmp_block *jtp = new jmp_block;
    //synbl->insert_v_or_vf_primary("#null_i_0", not, 'i');
    quat_item it;
    get_last_name();
    if (now_name[0] == 'c') {
        it.w = "jmpc";
    } else {
        it.w = "jmpb";
    }
    it.op1 = "_";
    it.op2 = "_";
    it.t = "1";
    (jtp->code).push_back(it);
    push_stk(jtp);
}

void semantic_analysis::push_return() {//跳转语句，压栈return，返回值默认是值为0的int
    jmp_block *jtp = new jmp_block;
    synbl->insert_v_or_vf_primary("#null_i_0", false, 'i');
    jtp->ans = synbl->find_synbl("#null_i_0");
    quat_item it;
    it.w = "ret";
    it.op1 = "_";
    it.op2 = "_";
    it.t = "#null_i_0";
    (jtp->code).push_back(it);
    push_stk(jtp);
}

void semantic_analysis::return_re_ans() {//return 表达式，将表达式的值放入ret中，弹出表达式语句
    ((jmp_block *) stk[top - 2])->merge(*((arithmetic_block *) stk[top - 1]));
    pop_stk();
}

void jmp_block::merge(arithmetic_block &ab) {//合并表达式返回值
    code.clear();
    code.insert(code.end(), ab.code.begin(), ab.code.end());
    ans = ab.ans;
    quat_item it;
    it.w = "ret";
    it.op1 = "_";
    it.op2 = "_";
    it.t = ans->name;
    code.push_back(it);
    ab.code.clear();
}
/*
void semantic_analysis::re_continues_break(vector<quat_item> &code) {//重新修正continues break的指向问题
    stack<int> cb;
    cb.push(-1);
    int while_flag = 0, now;
    for (int i = 0; i < code.size(); i++) {
        if (code[i].w == "wh") {
            while_flag++;
            cb.push(-1);//添加断开符号
        }
        if (code[i].w == "we") {
            while (true) {
                now = cb.top();
                cb.pop();
                if (now == -1) {//一个循环处理结束
                    while_flag--;
                    break;
                }
                if (while_flag > 0) {//在while内
                    if (code[now].w == "jmpc") {//查找到continues
                        code[now].w = "jmp";
                        code[now].t = to_string(i - now);
                    } else if (code[now].w == "jmpb") {//查找到break
                        code[now].w = "jmp";
                        code[now].t = to_string(i - now + 1);
                    }
                } else {//不在while中
                    if (code[now].w == "jmpc") { //查找到continues
                        code[now].w = "jmp";
                    } else if (code[now].w == "jmpb") {//查找到break
                        code[now].w = "jmp";
                    }
                }
            }
        }
    }
}
*/
void semantic_analysis::re_continues_break(vector<quat_item> &code) {//重新修正continues break的指向问题
    stack<int> cb;
    cb.push(-1);
    int while_flag = 0, now;
    for (int i = 0; i < code.size(); i++) {
        if (code[i].w == "wh") {
            while_flag++;
            cb.push(-1);//添加断开符号
        }
        if (code[i].w == "we") {
            while (true) {
                now = cb.top();
                cb.pop();
                if (now == -1) {//一个循环处理结束
                    while_flag--;
                    break;
                }
                if (while_flag > 0) {//在while内
                    if (code[now].w == "jmpc") {//查找到continue
                        //code[now].w = "jmp";
                        code[now].t = to_string(i - now);
                    } else if (code[now].w == "jmpb") {//查找到break
                        //code[now].w = "jmp";
                        code[now].t = to_string(i - now + 1);
                    }
                } else {//不在while中
                    if (code[now].w == "jmpc") { //查找到continue
                        code[now].w = "jmp";
                    } else if (code[now].w == "jmpb") {//查找到break
                        code[now].w = "jmp";
                    }
                }
            }
        } else {
            if (while_flag > 0) {//在while内
                if (code[i].w == "jmpc") {//查找到continues
                    //code[now].w = "jmp";
                    //code[now].t = to_string(i - now);
                    cb.push(i);
                } else if (code[i].w == "jmpb") {//查找到break
                    //code[now].w = "jmp";
                    //code[now].t = to_string(i - now + 1);
                    cb.push(i);
                }
            }
        }
    }
}
string semantic_analysis::get_next_synbl_name() {//获得下一个符号表的名字
    string s = "#synbl_";
    s += to_string(synbl_num);
    synbl_num++;
    return s;
}

void semantic_analysis::push_code_block() {//复合语句压栈，同时生成并切换符号表和活动记录，生成调用代码，并且压栈
    Code_block *ctp = new Code_block;
    ctp->code_block_name = get_next_synbl_name();
    ctp->create_synbl();
    push_vall_not_function((char *) ctp->code_block_name.data());
    push_stk(ctp);
}

void Code_block::create_synbl() {//生成对应的符号表、活动记录表并切换，生成调用代码
    c_synbl = new Synbl;
    c_vall = new Vall;
    c_vall->function_flag = false;
    c_vall->synbl = c_synbl;
    c_vall->local_variable_size = c_vall->parameter_size = c_vall->parameter_num = 0;
    strcpy(c_synbl->name, (char *) code_block_name.data());
    c_synbl->vall = c_vall;
    synbl_all[synbl_cnt] = c_synbl;
    vall_all[synbl_cnt++] = c_vall;
}

void Code_block::merge_code(vector<quat_item> &c) {//合并代码，并清空向量
    code.insert(code.end(), c.begin(), c.end());
    c.clear();
}

void semantic_analysis::code_block_merge_code_block() {
    ((Code_block *) stk[top - 2])->merge_code(((Code_block *) stk[top - 1])->code);
    pop_stk();
}

void semantic_analysis::code_block_merge_if_else_block() {//复合语句合并分支语句，并弹出后者
    ((Code_block *) stk[top - 2])->merge_code(((if_else_block *) stk[top - 1])->code);
    pop_stk();
}

void semantic_analysis::code_block_merge_while() {//复合语句合并while语句，并弹出后者
    ((Code_block *) stk[top - 2])->merge_code(((while_block *) stk[top - 1])->code);
    pop_stk();
}

void semantic_analysis::code_block_merge_for() {//复合语句合并for语句，并弹出后者
    ((Code_block *) stk[top - 2])->merge_code(((for_block *) stk[top - 1])->code);
    pop_stk();
}

void semantic_analysis::code_block_merge_jmp() {//复合语句合并jmp跳转语句，并弹出后者
    ((Code_block *) stk[top - 2])->merge_code(((jmp_block *) stk[top - 1])->code);
    pop_stk();
}

void semantic_analysis::code_block_merge_assignment() {//复合语句合并赋值语句，并弹出后者
    ((Code_block *) stk[top - 2])->merge_code(((assignment_block *) stk[top - 1])->code);
    pop_stk();
}

void semantic_analysis::code_block_end() {//复合语句结束，切换符号表并且添加切换的代码
    quat_item it;
    it.w = "pvret";
    it.op1 = "_";
    it.op2 = "_";
    it.t = "_";
    ((Code_block *) stk[top - 1])->code.push_back(it);
    //生成切换符号表的代码
    it.w = "pvall";
    it.op1 = "_";
    it.op2 = "_";
    it.t = "_";
    ((Code_block *) stk[top - 1])->code.insert(((Code_block *) stk[top - 1])->code.begin(), it);
    pop_vall_not_function();
}

void semantic_analysis::push_Var_or_item_const() {//放入项，处理常量
    insert_const();
    Var_or_item *tp = new Var_or_item;
    tp->ans = synbl->find_synbl((char *) last_variable_name.data());
    push_stk(tp);
}

void semantic_analysis::push_Var_or_item_fu_const() {//放入项，处理负常量
    insert_const();
    Var_or_item *tp = new Var_or_item;
    quat_item it;
    it.w = "-";
    it.op1 = "0";
    it.op2 = last_variable_name;
    //it.t = last_variable_name + "-";
    it.t=last_variable_name;
    it.t.insert(9,"-");
    //tp->code.push_back(it);
    tp->ans = synbl->find_synbl((char *) last_variable_name.data());
    if (tp->ans->typ->tval == 'i') {
        short n = *(short *) tp->ans->addr;
        n = (short) -n;
        synbl->add_constant((char *) it.t.data(), n);
    } else if (tp->ans->typ->tval == 'r') {
        float n = *(float *) tp->ans->addr;
        n = -n;
        synbl->add_constant((char *) it.t.data(), n);
    } else if (tp->ans->typ->tval == 'c') {
        char n = *(char *) tp->ans->addr;
        n = -n;
        synbl->add_constant((char *) it.t.data(), n);
    }
    tp->ans = synbl->find_synbl((char *) it.t.data());
    push_stk(tp);
}

void semantic_analysis::push_Var_or_item_char() {//项入栈，处理char
    get_last_name();
    string tname = "#const_c_";
    tname.push_back(now_name[1]);
    synbl->add_constant((char *) tname.data(), now_name[1]);
    Var_or_item *tp = new Var_or_item;
    tp->ans = synbl->find_synbl((char *) tname.data());
    push_stk(tp);
}

void semantic_analysis::push_Var_or_item_variable() {//项入栈，处理其他情况
    get_last_name();
    Var_or_item *tp = new Var_or_item;
    tp->ans = synbl->find_synbl((char *) now_name.data());
    push_stk(tp);
}

void semantic_analysis::Var_or_item_arr() {//项，清空数组维度栈，并且更新出来数组元素。当数组维度为空时不会运行
    if (arr_dimension.empty()) {
        return;
    }
    Tapel *tp = ((Var_or_item *) stk[top - 1])->ans->typ;
    short offset = 0;
    Synbl_one *var = ((Var_or_item *) stk[top - 1])->ans;
    for (int i = 0; i < arr_dimension.size(); i++) {//查找每一维度
        if (tp->tval == 'a') {
            offset += ((Ainfl *) (tp->p))->clen * arr_dimension[i];
            tp = (Tapel *) ((Ainfl *) (tp->p))->ctp;
        } else {
            string error = var->name;
            error += "不匹配";
            throw error;
        }
    }
    quat_item it;
    it.w = "[]";
    it.op1 = to_string(offset);
    it.op2 = var->name;
    it.t = get_next_point_name();
    synbl->insert_vn_primary((char *) it.t.data(), var->name, offset);
    ((Var_or_item *) stk[top - 1])->code.push_back(it);
    ((Var_or_item *) stk[top - 1])->ans = synbl->find_synbl((char *) it.t.data());
    arr_dimension.clear();//清空维度
}

void semantic_analysis::Var_or_item_str() {//项，获取上一个标识符，查找结构体变量
    get_last_name();
    Tapel *tp = ((Var_or_item *) stk[top - 1])->ans->typ;
    Synbl_one *var = ((Var_or_item *) stk[top - 1])->ans;
    string s_tp = get_next_point_name();
    synbl->insert_vn_primary((char *) s_tp.data(), var->name, (char *) now_name.data());
    ((Var_or_item *) stk[top - 1])->ans = synbl->find_synbl((char *) s_tp.data());
    quat_item it;
    it.w = ".";
    it.op1 = now_name;
    it.op2 = var->name;
    it.t = s_tp;
    ((Var_or_item *) stk[top - 1])->code.push_back(it);
}

void semantic_analysis::Var_or_item_get_parameter() {//项，获取一个参数，并将参数的项弹出栈
    ((Var_or_item *) stk[top - 2])->code.insert(((Var_or_item *) stk[top - 2])->code.end(),
                                                ((Var_or_item *) stk[top - 1])->code.begin(),
                                                ((Var_or_item *) stk[top - 1])->code.end());
    ((Var_or_item *) stk[top - 2])->parameter.push_back(((Var_or_item *) stk[top - 1])->ans->name);
    ((Var_or_item *) stk[top - 1])->code.clear();
    pop_stk();
}

void semantic_analysis::Var_or_item_end_function() {//项目，以函数调用结束，产生调用式子，不弹栈
    ((Var_or_item *) stk[top - 1])->end_function(get_next_temp_name());
}

void Var_or_item::end_function(string ret) {//函数调用结束
    if (((vector<string> *) (ans->addr))->size() != parameter.size()) {
        string error = ans->name;
        error += "参数不符合！";
        throw error;
    }
    string base = "entry(";
    quat_item it;
    it.w = "param";
    it.op2 = "_";
    it.t = "_";
    for (const auto &i:parameter) {//参数代码
        it.op1 = base;
        it.op1 += i;
        it.op1 += ")";
        code.push_back(it);
    }
    Synbl_one *re;
    if (ans->typ->p == NULL) {
        synbl->insert_v_or_vf_primary((char *) ret.data(), false, ans->typ->tval);
    } else {
        //synbl->insert_v_or_vf_arr_or_strcut((char *) ret.data(), false,ans->typ->p);
        //啊哈哈这个没有
    }
    it.w = "call";
    it.op1 = base + ans->name + ")";
    it.op2 = to_string(parameter.size());
    it.t = ret;
    code.push_back(it);
    ans = synbl->find_synbl((char *) ret.data());
}

void semantic_analysis::Var_init_end() {//变量初始化结束，若在函数中，与上一个复合语句结合，若不在，则与栈底的全局结合。最后将其弹栈
    if (is_flag_function) {
        ((Code_block *) stk[top - 3])->code.insert(((Code_block *) stk[top - 3])->code.end(),
                                                   ((Var_init *) stk[top - 1])->code.begin(),
                                                   ((Var_init *) stk[top - 1])->code.end());
    } else {
        ((program_blcok *) stk[0])->variable_init_code.insert(((program_blcok *) stk[0])->variable_init_code.end(),
                                                              ((Var_init *) stk[top - 1])->code.begin(),
                                                              ((Var_init *) stk[top - 1])->code.end());
    }
    pop_stk();
}

void semantic_analysis::program_merge_function() {//程序段，合并函数定义，并将函数定义弹出
    ((program_blcok *) stk[0])->code.insert(((program_blcok *) stk[0])->code.end(),
                                            ((function_block *) stk[top - 1])->code.begin(),
                                            ((function_block *) stk[top - 1])->code.end());
    pop_stk();
}

void semantic_analysis::program_end() {//程序段，结束，进行continues和break的修正，将四元式放入向量QUATS中
    re_continues_break(((program_blcok *) stk[0])->code);
    QUATS.insert(QUATS.end(), ((program_blcok *) stk[0])->variable_init_code.begin(),
                 ((program_blcok *) stk[0])->variable_init_code.end());
    QUATS.insert(QUATS.end(), ((program_blcok *) stk[0])->code.begin(),
                 ((program_blcok *) stk[0])->code.end());
}

void semantic_analysis::init() {//语义分析初始化
    top = 0;
    is_flag_function = is_flag_parameter = is_define_variable = false;
    temp_variable = synbl_num = 0;
    program_blcok *p_tp = new program_blcok;
    push_stk(p_tp);
    Synbl *c_synbl;
    Vall *c_vall;
    c_synbl = new Synbl;
    c_vall = new Vall;
    c_vall->function_flag = false;
    c_vall->synbl = c_synbl;
    c_vall->local_variable_size = c_vall->parameter_size = c_vall->parameter_num = 0;
    strcpy(c_synbl->name, "#global");
    c_synbl->vall = c_vall;
    synbl_all[synbl_cnt] = c_synbl;
    vall_all[synbl_cnt++] = c_vall;

    synbl = c_synbl;//活动记录压栈
    c_vall->display = NULL;
    stack_vall[stack_vall_top++] = c_vall;
}

semantic_analysis SA;
