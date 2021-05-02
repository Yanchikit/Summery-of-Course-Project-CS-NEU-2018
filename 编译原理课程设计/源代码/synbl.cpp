#pragma once

#include "synbl.h"

Synbl *synbl;//当前符号表
Vall *stack_vall[5000];//活动记录栈
int stack_vall_top = 0;//活动记录栈的栈顶位置+1，0表示空

Synbl *synbl_all[5000];//全部的符号表
Vall *vall_all[5000];//全部的活动记录原型
int synbl_cnt = 0;//总共的符号表数量


Synbl *find_synbl_by_name(char name[]) {//通过名字找到对应的符号表，找不到返回空
    for (int i = 0; i < synbl_cnt; i++) {
        if (strcmp(vall_all[i]->synbl->name, name) == 0) {//相等
            return vall_all[i]->synbl;
        }
    }
    return NULL;
}

void push_vall_function(char name[]) {//函数调用时的活动记录压栈
    Synbl *res = NULL;
    for (int i = 0; i < synbl_cnt; i++) {
        if (strcmp(vall_all[i]->synbl->name, name) == 0) {//相等
            res = vall_all[i]->synbl;
            stack_vall[stack_vall_top] = new Vall(*(vall_all[i]));
            break;
        }
    }
    Vall *&v = stack_vall[stack_vall_top];
    v->parameter = malloc(v->parameter_size);
    v->local_variable = malloc(v->local_variable_size);
    v->display = stack_vall[0];//函数调用，只能访问到全局
    res->vall = stack_vall[stack_vall_top];
    synbl = res;
    stack_vall_top++;
}

void pop_vall_function() {//函数调用时的活动记录弹出
    stack_vall_top--;
    delete stack_vall[stack_vall_top];
    Vall *&v = stack_vall[stack_vall_top - 1];
    v->synbl->vall = stack_vall[stack_vall_top - 1];
    synbl = v->synbl;
}

void push_vall_not_function(char name[]) {//代码块的调用活动记录压栈
    push_vall_function(name);
    stack_vall[stack_vall_top - 1]->display = stack_vall[stack_vall_top - 2];
}

void pop_vall_not_function() {//代码块调用时的活动记录弹出
    pop_vall_function();
}

Synbl_one *Synbl::find_synbl(char *tname) {
    Synbl_one *res = NULL;
    Synbl *synbl_tp = this;
    while (true) {
        for (auto i = synbl_tp->s.begin(); i != synbl_tp->s.end(); i++) {//改成list遍历
            if (strcmp(i->name, tname) == 0) {
                res = &(*i);
                return res;
            }
        }
//        for (int i = 0; i < synbl_tp->s.size(); i++) {//遍历
//            if (strcmp(synbl_tp->s[i].name, tname) == 0) {
//                res = &(synbl_tp->s[i]);
//                return res;
//            }
//        }
        if (synbl_tp->vall->display == NULL) {//已经到达全局全局变量，退出
            break;
        } else {//寻找上一级
            synbl_tp = synbl_tp->vall->display->synbl;
        }
    }
    return NULL;
}

Synbl_one *Synbl::find_synbl(char *tname, Synbl *&sv) {
    Synbl_one *res = NULL;
    Synbl *synbl_tp = this;
    while (true) {
        for (auto i = synbl_tp->s.begin(); i != synbl_tp->s.end(); i++) {//改成list遍历
            if (strcmp(i->name, tname) == 0) {
                res = &(*i);
                sv = synbl_tp;
                return res;
            }
        }
//        for (int i = 0; i < synbl_tp->s.size(); i++) {//遍历
//            if (strcmp(synbl_tp->s[i].name, tname) == 0) {
//                res = &(synbl_tp->s[i]);
//                return res;
//            }
//        }
        if (synbl_tp->vall->display == NULL) {//已经到达全局全局变量，退出
            break;
        } else {//寻找上一级
            synbl_tp = synbl_tp->vall->display->synbl;
        }
    }
    return NULL;
}

Tapel *Synbl::find_tapel(char *tname) {
    Synbl_one *res = this->find_synbl(tname);
    if (res == NULL) {
        return NULL;
    }
    return res->typ;
}

void new_synbl_and_Vall(char name[]) {//添加一个新的synbl和对应的Vall，并sybnl等于新添加，将记录入栈，不更新display
    synbl = synbl_all[synbl_cnt] = new Synbl;
    strcpy(synbl->name, name);
    vall_all[synbl_cnt] = stack_vall[stack_vall_top] = new Vall;
    stack_vall_top++;
    synbl_all[synbl_cnt]->vall = vall_all[synbl_cnt];
    vall_all[synbl_cnt]->synbl = synbl_all[synbl_cnt];
    synbl_cnt++;
}

void init_symbol() {//初始化symbl
    char name[] = "#global";
    new_synbl_and_Vall(name);
}

void update_Vall_and_pop() {//更新记录里的Vall并且弹出栈
    stack_vall_top--;
    stack_vall[stack_vall_top]->display = NULL;
    for (int i = synbl_cnt - 1; i >= 0; i--) {
        if (strcmp(vall_all[i]->synbl->name, stack_vall[stack_vall_top - 1]->synbl->name) == 0) {//相等
            synbl = vall_all[i]->synbl;
            break;
        }
    }
}

void new_vall_display() {//填写时修改display
    if (stack_vall[stack_vall_top - 1]->function_flag) {
        stack_vall[stack_vall_top - 1]->display = stack_vall[0];
    } else {
        stack_vall[stack_vall_top - 1]->display = stack_vall[stack_vall_top - 2];
    }
}

Synbl_one *Synbl::find_only_this_synbl(char *tname) {//查找某一个变量，仅仅在这个符号表里查找，找不到返回NULL
//    for (int i = 0; i < s.size(); i++) {
//        if (strcmp(s[i].name, tname) == 0) {
//            return &s[i];
//        }
//    }
    for (auto i = s.begin(); i != s.end(); i++) {
        if (strcmp(i->name, tname) == 0) {
            return &(*i);
        }
    }
    return NULL;
}

Tapel *Synbl::find_only_this_tapel(char *tname) {//返回一个变量的类型，仅仅在这个符号表里查找，找不到返回NULL
    Synbl_one *res = this->find_only_this_synbl(tname);
    if (res == NULL) {
        return NULL;
    }
    return res->typ;
}

bool Synbl::add_constant(char tname[], int n) {//添加常量，成功返回true,失败返回false
    if (find_only_this_synbl(tname) == NULL) {
        Synbl_one s_one_tp;
        strcpy(s_one_tp.name, tname);
        s_one_tp.typ = new Tapel;
        s_one_tp.typ->tval = 'i';
        s_one_tp.typ->p = NULL;
        strcpy(s_one_tp.cat, "c");
        s_one_tp.addr = (new short);
        *(short *) s_one_tp.addr = (short) n;
        s.push_back(s_one_tp);
        return true;
    }
    return false;
}

bool Synbl::add_constant(char *tname, float n) {
    if (find_only_this_synbl(tname) == NULL) {
        Synbl_one s_one_tp;
        strcpy(s_one_tp.name, tname);
        s_one_tp.typ = new Tapel;
        s_one_tp.typ->tval = 'r';
        s_one_tp.typ->p = NULL;
        strcpy(s_one_tp.cat, "c");
        s_one_tp.addr = (new float);
        *(float *) s_one_tp.addr = (float) n;
        s.push_back(s_one_tp);
        return true;
    }
    return false;
}

bool Synbl::add_constant(char *tname, char n) {
    if (find_only_this_synbl(tname) == NULL) {
        Synbl_one s_one_tp;
        strcpy(s_one_tp.name, tname);
        s_one_tp.typ = new Tapel;
        s_one_tp.typ->tval = 'c';
        s_one_tp.typ->p = NULL;
        strcpy(s_one_tp.cat, "c");
        s_one_tp.addr = (new float);
        *(float *) s_one_tp.addr = (float) n;
        s.push_back(s_one_tp);
        return true;
    }
    return false;
}

int Synbl::size(Tapel &type, char *tname) {
    char &tval = type.tval;
    void *&p = type.p;
    if (tval == 'i') {
        return 2;
    } else if (tval == 'r') {
        return 4;
    } else if (tval == 'c') {
        return 1;
    } else if (tval == 'a') {
        return ((Ainfl *) p)->up * ((Ainfl *) p)->clen;
    } else if (tval == 'd') {
        Synbl_one *tp = find_synbl(tname);
        if (tp != NULL) {
            return *(int *) tp->addr;
        }
    }
    return 0;
}

bool Synbl::insert_v_or_vf_primary(char *tname, bool isflag, char n) {//n表示类别
    Synbl_one *tp = find_only_this_synbl(tname);
    if (tp != NULL) {
        return false;
    }
    Synbl_one s_one_tp;
    strcpy(s_one_tp.name, tname);
    s_one_tp.typ = new Tapel;
    s_one_tp.typ->tval = n;
    s_one_tp.typ->p = NULL;
    if (isflag) {
        strcpy(s_one_tp.cat, "vf");
        vall->parameter_num++;
        s_one_tp.addr = new short;
        *(short *) s_one_tp.addr = (short) vall->parameter_size;
        vall->parameter_size += size(*s_one_tp.typ);
    } else {
        strcpy(s_one_tp.cat, "v");
        s_one_tp.addr = new short;
        *(short *) s_one_tp.addr = (short) vall->local_variable_size;
        vall->local_variable_size += size(*s_one_tp.typ);
    }
    s.push_back(s_one_tp);
    return true;
}

bool Synbl::insert_v_or_vf_arr_or_strcut(char *tname, bool isflag, char *arr_or_struct_name) {
    Synbl_one *tp = find_only_this_synbl(tname);
    if (tp != NULL) {
        return false;
    }
    Tapel *arr_tp = find_tapel(arr_or_struct_name);
    if (arr_tp == NULL) {//如果没有这个类型
        return false;
    }
    Synbl_one s_one_tp;
    strcpy(s_one_tp.name, tname);
    s_one_tp.typ = arr_tp;//直接使用已有的typel即可
    if (isflag) {
        strcpy(s_one_tp.cat, "vf");
        vall->parameter_num++;
        s_one_tp.addr = new short;
        *(short *) s_one_tp.addr = (short) vall->parameter_size;
        vall->parameter_size += size(*s_one_tp.typ, arr_or_struct_name);
    } else {
        strcpy(s_one_tp.cat, "v");
        s_one_tp.addr = new short;
        *(short *) s_one_tp.addr = (short) vall->local_variable_size;
        vall->local_variable_size += size(*s_one_tp.typ, arr_or_struct_name);
    }
    s.push_back(s_one_tp);
    return true;
}

Tapel *Synbl::insert_type_arr(char *tname, Tapel *tap, int up) {//添加数组类别,tap是数组中的一个元素的类型，up是数组上限
    Synbl_one *tp = find_only_this_synbl(tname);
    if (tp != NULL) {
        return NULL;
    }
    Tapel *arr_TP = find_tapel(tname);
    if (arr_TP != NULL) {//如果有这个类型，则失败返回
        return arr_TP;
    }
    Tapel arr_tp;
    arr_tp.tval = 'a';
    arr_tp.p = new Ainfl;
    ((Ainfl *) arr_tp.p)->ctp = tap;
    ((Ainfl *) arr_tp.p)->up = up;
    ((Ainfl *) arr_tp.p)->clen = size(*tap);
    arr_list.push_back(arr_tp);
    //arr_TP = &arr_list[arr_list.size() - 1];//在数组表中插入成功
    arr_TP = &(*arr_list.rbegin());
    Synbl_one s_one_tp;
    strcpy(s_one_tp.name, tname);
    s_one_tp.typ = arr_TP;
    strcpy(s_one_tp.cat, "t");
    s_one_tp.addr = new short;
    *(short *) s_one_tp.addr = (short) size(arr_tp);
    s.push_back(s_one_tp);
    return arr_TP;
}

bool Synbl::insert_type_str_without_Rinfl(char *tname) {//添加一个没有结构体表的结果体，长度设为0，如果已经存在则返回false
    Synbl_one *tp = find_only_this_synbl(tname);
    if (tp != NULL) {
        return false;
    }
    Synbl_one s_one_tp;
    strcpy(s_one_tp.name, tname);
    s_one_tp.typ = new Tapel;
    s_one_tp.typ->tval = 'd';
    s_one_tp.typ->p = NULL;
    strcpy(s_one_tp.cat, "t");
    s_one_tp.addr = (short *) new short;
    *(short *) (s_one_tp.addr) = 0;
    s.push_back(s_one_tp);
    return true;
}

Tapel *Synbl::find_arr_base_var(char *tname) {//利用变量的名字查找数组的最基本元素类型，找不到返回NULL
    Synbl_one *s_one_tp = find_synbl(tname);
    if (s_one_tp == NULL) {
        return NULL;
    }
    return find_arr_base_var(*s_one_tp->typ);
}

Tapel *Synbl::find_arr_base_var(Tapel tp) {//利用变量的名字查找数组的最基本元素类型，找不到返回NULL
    if (tp.tval != 'a') {
        return NULL;
    }
    Tapel *now = &tp;
    while (now->tval == 'a') {//直到找到不是数组的为止
        now = (Tapel *) ((Ainfl *) now->p)->ctp;
    }
    return now;
}

bool Synbl::insert_vn_primary(char *tname, char *from_name, int offset) {//插入一个换名形参，offset为偏移的基础类型个数
    Synbl_one tp, *ftp = find_synbl(from_name);
    if (ftp == NULL) {
        return false;
    }
    tp.typ = find_arr_base_var(from_name);
    if (tp.typ == NULL) {
        return false;
    }
    strcpy(tp.name, tname);
    strcpy(tp.cat, "vn");
    tp.addr = new short;
    *(short *) tp.addr = *(short *) ftp->addr;
    *(short *) (tp.addr) += (short) (offset * (size(*ftp->typ, from_name)));
    s.push_back(tp);
    return true;
}

bool Synbl::insert_vn_primary(char *tname, char *from_name, char *offset) {//插入一个换名形参，offset是结构体里的变量名称
    Synbl *s_tp;
    Synbl_one s_one_tp, *ftp = find_synbl(from_name, s_tp);
    if (ftp == NULL) {
        return false;
    }
    if (ftp->typ->tval != 'd') {
        return false;
    }
    Rinfl *rtp = (Rinfl *) ftp->typ->p;
    if (rtp == NULL) {
        return false;
    }
    strcpy(s_one_tp.name, tname);
    strcpy(s_one_tp.cat, "vn");
    for (int i = 0; i < rtp->rinfl.size(); i++) {
        if (strcmp(rtp->rinfl[i].id, offset) == 0) {
            s_one_tp.typ = (Tapel *) rtp->rinfl[i].typ;
            s_one_tp.addr = new short;
            *(short *) s_one_tp.addr = *(short *) ftp->addr;
            *(short *) s_one_tp.addr += (short) rtp->rinfl[i].off;
            s.push_back(s_one_tp);
            return true;
        }
    }
    return false;
}