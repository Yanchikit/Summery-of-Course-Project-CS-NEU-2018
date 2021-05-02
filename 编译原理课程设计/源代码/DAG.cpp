#include "DAG.h"

vector <quat_item> QUATS;   //四元式
vector <quat_item> NEW_QUATS;   //暂存优化后的四元式
vector <dagNode> DAG;  //dag图
map <string,int> mapDag; //用于查找标记
vector<string> ftemp;   //函数返回临时变量
int index=0;  //下一节点编号
int N=3;    //循环优化次数

bool isBinaryOp(string op){ //判断是否是二元运算符
    bool flag=false;
    if(op=="+" || op=="-" || op=="*" || op=="/" || op=="&&" || op=="||" ||
       op=="<" || op==">" || op=="==" || op=="<=" || op==">=" || op=="!="||op=="[]")
        flag = true;
    return flag;
}

int isBothConstant(string op1,string op2){ //判断两个数是否都是常数,只判断i和r型常数
    bool flag=false;
    string s1="";
    string s2="";
    if(op1.length()>=8) {
        for(int i=0;i<8;i++){
            s1 += op1[i];
            s2 += op2[i];
        }
        if((s1=="#const_i" || s1== "#const_r")&& (s2=="#const_i" || s2=="#const_r")) flag=true;
    }
    return flag;
}

void addAssignDag(quat_item q,int Num=-1) { //添加赋值四元式(=,b,_,a)

    if(Num==-1){
        if(mapDag.count(q.op1)==0){ //b不存在时添加结点
            dagNode dag_n;
            dag_n.num = index;
            dag_n.mark.push_back(q.op1);
            DAG.push_back(dag_n);
            mapDag[q.op1]=index;
            Num = index;
            index++;
        }
        else{
            Num = mapDag[q.op1];    //b已存在时获取结点号
        }
    }

    if(mapDag.count(q.t)>0){     //a存在先删除（主标记 数组的同地址变量免删)
        int Num2;
        Num2 = mapDag[q.t];
        if(q.t.length()>=3 && q.t[0]=='#' && q.t[1]=='p' && q.t[2]=='_' && DAG[Num2].opt=="[]") {}
        else if(DAG[Num2].mark[0]!=q.t){
            for(vector<string>::iterator iter=DAG[Num2].mark.begin();iter!=DAG[Num2].mark.end();iter++){
                if(*iter==q.t) {
                    DAG[Num2].mark.erase(iter);
                    break;
                }
            }
        }
    }
    string s="";
    for(int i=0;i<6;i++) s += q.t[i];
    if(s=="#temp_") DAG[Num].mark.push_back(q.t);   //临时变量直接附上即可
    else {  //非临时变量是否移动到主标记
        if(DAG[Num].mark.size()==0) DAG[Num].mark.push_back(q.t);
        else{
            string ss="";
            for(int i=0;i<6;i++) ss += DAG[Num].mark[0][i];
            if(ss=="#temp_"){
                DAG[Num].mark.insert(DAG[Num].mark.begin(),q.t); //成为主标记
            }
            else DAG[Num].mark.push_back(q.t);
        }
    }
    mapDag[q.t]=Num;    //增加map，同时把之前的删除
}

string calculateConst(quat_item q){     //计算两个常量结果,只考虑i/r型常量
    string opp1="";
    string opp2="";
    for(unsigned int i=9;i<q.op1.length();i++) opp1+=q.op1[i];
    for(unsigned int i=9;i<q.op2.length();i++) opp2+=q.op2[i];
    double op1, op2;
    double result;
    std::stringstream ss, ss1;
    ss << opp1;
    ss >> op1;
    ss1 << opp2;
    ss1 >> op2;
    if(q.w=="+") result= op1+op2;
    else if(q.w=="-") result= op1-op2;
    else if(q.w=="*") result= op1*op2;
    else if(q.w=="/") result= op1/op2;
    else if(q.w==">") result= op1>op2;
    else if(q.w=="<") result= op1<op2;
    else if(q.w=="==") result= op1==op2;
    else if(q.w==">=") result= op1>=op2;
    else if(q.w=="<=") result= op1<=op2;
    else if(q.w=="!=") result= op1!=op2;
    else if(q.w=="&&") result= op1&&op2;
    else result= op1||op2;
    ostringstream oss;
    string str;
    oss << result;
    if(q.op1[7]=='i' && q.op2[7]=='i') str="#const_i_"+oss.str();
    else str="#const_r_"+oss.str();
    return str;
}

int findWab(quat_item q){ //返回值为aWb的节点编号，没有则创建
    for(unsigned int i=0;i<DAG.size();i++){ //awb存在时
        if(DAG[i].opt==q.w){
            bool flag1=false; //左孩子是否是a标记
            if(DAG[i].leftChild>-1 && DAG[i].rightChild>-1) { //均有孩子时
                for(unsigned int j=0;j<DAG[DAG[i].leftChild].mark.size();j++){
                    if(DAG[DAG[i].leftChild].mark[j]==q.op1){
                        flag1=true;
                        break;
                    }
                }
                if(flag1==true){ //当左孩子满足为a时，看右孩子
                    for(unsigned int j=0;j<DAG[DAG[i].rightChild].mark.size();j++){
                        if(DAG[DAG[i].rightChild].mark[j]==q.op2) return int(i);
                    }
                }
            }
        }
    }
    int Num;
    int Num1,Num2;
    if(mapDag.count(q.op1)>0) Num1=mapDag[q.op1];
    else {  //创建操作数1结点
        dagNode dag_n1;
        dag_n1.num = index;
        dag_n1.mark.push_back(q.op1);
        DAG.push_back(dag_n1);
        mapDag[q.op1]=index;
        Num1=index;
        index++;
    }
    if(mapDag.count(q.op2)>0) Num2=mapDag[q.op2];
    else{ //创建操作数2结点
        dagNode dag_n2;
        dag_n2.num = index;
        dag_n2.mark.push_back(q.op2);
        DAG.push_back(dag_n2);
        mapDag[q.op2]=index;
        Num2 = index;
        index++;
    }
    dagNode dag_result;  //这个点没有mark，等待调用赋值四元式添加
    dag_result.num=index;
    dag_result.opt=q.w;
    dag_result.leftChild=Num1;
    dag_result.rightChild=Num2;
    DAG.push_back(dag_result);
    //mapDag[oss.str()]=index;
    Num=index;
    index++;
    return Num;
}

int findWa(quat_item q){  //返回值为wa的节点编号，没有则添加
    for(unsigned int i=0;i<DAG.size();i++){
        if(DAG[i].opt==q.w){
            if(DAG[i].leftChild>-1){
                for(unsigned int j=0;i<DAG[DAG[i].leftChild].mark.size();j++){
                    if(DAG[DAG[i].leftChild].mark[j]==q.op1) return int(i);
                }
            }
        }
    }
    int Num0;
    int Num;
    if(mapDag.count(q.op1)==0){ //没有则创建a结点
        dagNode dag_a;
        dag_a.num = index;
        dag_a.mark.push_back(q.op1);
        DAG.push_back(dag_a);
        mapDag[q.op1]=index;
        Num=index;
        index++;
    }
    else Num=mapDag[q.op1];

    dagNode dag_result;  //这个点没有mark，等待调用赋值四元式添加
    dag_result.num=index;
    dag_result.opt=q.w;
    dag_result.leftChild=Num;
    DAG.push_back(dag_result);
    //mapDag[ss]=index;
    Num0=index;
    index++;
    return Num0;
}

void addDagNode(quat_item q){
    if(q.w=="="){   //赋值四元式(=,b,_,a)
        addAssignDag(q);
    }
    else if(isBinaryOp(q.w)){   //处理二元运算四元式
        if(isBothConstant(q.op1,q.op2)) {  //都是数字常数，先算出结果
            quat_item q1;
            q1.w = "=";
            q1.t = q.t;
            q1.op1= calculateConst(q);  ////计算结果
            addAssignDag(q1);   //当赋值四元式添加即可
        }
        else{   //处理四元式(w,a,b,c)
            int Num;
            Num=findWab(q);
            addAssignDag(q,Num);
        }
    }
    else if(q.w=="!" || q.w=="if" || q.w=="do" || q.w=="ret"){  //处理一元式
        if(q.w=="!") {
            bool isConst=false;
            if(q.op1.length()>=8){
                string qs="";
                for(unsigned int i=0;i<8;i++) qs+=q.op1[i];
                if(qs=="#const_i" || qs=="#const_r" || qs=="#const_c") isConst=true;
            }
            if(isConst) {   //常数计算结果
                std::stringstream ss;
                ss<<q.op1;
                if(q.op1[7]=='i'||q.op1[7]=='r'){ //整数或浮点数常数
                    double op;
                    ss>>op;
                    quat_item q2;
                    q2.w = "=";
                    if(!op) q2.op1="1";
                    else q2.op1="0";
                    q2.t = q.t;
                    addAssignDag(q2);
                }
                else {  //字符常数
                    char op;
                    ss>>op;
                    quat_item q2;
                    q2.w = "=";
                    if(!op) q2.op1="1";
                    else q2.op1="0";
                    q2.t = q.t;
                    addAssignDag(q2);
                }
            }
            else{ //处理四元式(!,a,_,t)
                int Num;
                Num=findWa(q);
                addAssignDag(q,Num);
            }
        }
        else if(q.w=="if" || q.w=="do"){ //处理(if,a,_,偏移量)  (do,a,_,偏移量)
            q.w=q.w+"_"+q.t;   //修改成if_偏移量、do_偏移量的形式
            findWa(q);  //添加节点即可
        }
        else{   //处理(ret,_,_,返回值)
            q.op1=q.t;
            findWa(q);
        }
    }
    else{      //处理其他所有四元式
        dagNode dagN;
        dagN.num = index;
        dagN.opt = q.w;
        dagN.mark.push_back(q.op1);
        dagN.mark.push_back(q.op2);
        dagN.mark.push_back(q.t);
        DAG.push_back(dagN);
        index++;
    }
}
bool isNormalOpt(string opt){
    bool flag=false;
    if(opt=="=" || isBinaryOp(opt) || opt=="!" ) flag=true;
    else if(opt.length()>=3 ){
        string ss="";
        for(int i=0;i<3;i++) ss+=opt[i];
        if(ss=="if_" || ss=="do_" || ss=="ret") flag=true;
    }
    return flag;
}
void creatNEW_QUATS(){      //根据DAG图重组四元式
    for(unsigned int i=0;i<DAG.size();i++){ //遍历DAG图
        int isArrayFlag=0;
        if(DAG[i].leftChild!=-1 || DAG[i].rightChild!=-1){ //不为叶子节点时  //ret根据DAG生成四元式时需要把返回值放最后
            quat_item q;
            q.op1="_";
            q.op2="_";
            if(DAG[i].leftChild!=-1) q.op1=DAG[DAG[i].leftChild].mark[0];
            if(DAG[i].rightChild!=-1) q.op2=DAG[DAG[i].rightChild].mark[0];
            if(DAG[i].opt.length()>2){
                string s="";
                for(int p=0;p<3;p++) s+=DAG[i].opt[p];
                if(s=="if_"){
                    q.w = "if";
                    string st="";
                    for(unsigned int t=3;t<DAG[i].opt.length();t++) st+=DAG[i].opt[t];
                    q.t = st;
                }
                else if(s=="do_"){
                    q.w = "do";
                    string st="";
                    for(unsigned int t=3;t<DAG[i].opt.length();t++) st+=DAG[i].opt[t];
                    q.t = st;
                }
                else if(s=="ret"){
                    q.w = "ret";
                    q.t = q.op1;
                    q.op1 = "_";
                }
                else {
                    q.w = DAG[i].opt;
                    q.t = DAG[i].mark[0];
                }
            }
            else {
                if(DAG[i].opt=="[]") isArrayFlag=1;
                q.w=DAG[i].opt;q.t=DAG[i].mark[0];
                }
                NEW_QUATS.push_back(q);
                if(isArrayFlag){
                    for(unsigned int t=1;t<DAG[i].mark.size();t++){  //副标记的数组定义处理
                        q.t=DAG[i].mark[t];
                        NEW_QUATS.push_back(q);
                    }
                }
        }
        if(isArrayFlag) continue;
        if(DAG[i].opt!="" && !isNormalOpt(DAG[i].opt)){
            //特殊四元式
            quat_item q;
            q.w = DAG[i].opt;
            q.op1 = DAG[i].mark[0];
            q.op2 = DAG[i].mark[1];
            q.t = DAG[i].mark[2];
            NEW_QUATS.push_back(q);

        }
        else{
            for(unsigned int j=1;j<DAG[i].mark.size();j++){  //添加赋值四元式
                if(DAG[i].mark[j].length()>=5){
                    string ss="";
                    for(int k=0;k<5;k++) ss+=DAG[i].mark[j][k];
                    if(ss!="#temp") { //为非临时变量时
                        quat_item q;
                        q.w="=";
                        q.op1=DAG[i].mark[0];
                        q.op2="_";
                        q.t=DAG[i].mark[j];
                        NEW_QUATS.push_back(q);
                    }
                    else if(find(ftemp.begin(),ftemp.end(),DAG[i].mark[j])!=ftemp.end()){  //函数返回的临时变量
                       quat_item q;
                        q.w="=";
                        q.op1=DAG[i].mark[j];
                        q.op2="_";
                        q.t=DAG[i].mark[0];
                        NEW_QUATS.push_back(q);
                    }
                }
                else{
                    quat_item q;
                    q.w="=";
                    q.op1=DAG[i].mark[0];
                    q.op2="_";
                    q.t=DAG[i].mark[j];
                    NEW_QUATS.push_back(q);
                }
            }
        }
    }
    //数组四元式顺序的调整
    for(unsigned int i=0;i<NEW_QUATS.size();i++){
        if(NEW_QUATS[i].t.length()>=3 && NEW_QUATS[i].t[0]=='#' &&NEW_QUATS[i].t[1]=='p' && NEW_QUATS[i].t[2]=='_'){
            for(unsigned int j=i+1;j<NEW_QUATS.size();j++){
                if(NEW_QUATS[j].w=="[]" && NEW_QUATS[j].t==NEW_QUATS[i].t){
                    //交换顺序
                    quat_item q;
                    q = NEW_QUATS[i];
                    NEW_QUATS[i] = NEW_QUATS[j];
                    NEW_QUATS[j] = q;
                    break;
                }
            }
        }
    }


}

void showDAG(){
    for(unsigned int i=0;i<DAG.size();i++){

        cout<<"-------------"<<endl;
        cout<<"编号："<<DAG[i].num<<endl;
        if(DAG[i].opt=="") cout<<"运算符："<<"无"<<endl;
        else cout<<"运算符："<<DAG[i].opt<<endl;
        cout<<"左孩子 右孩子:"<<DAG[i].leftChild<< " "<<DAG[i].rightChild<<endl;
        if(DAG[i].mark.size()==0) cout<<"无标记"<<endl;
        else cout<<"主标记："<<DAG[i].mark[0]<<endl;
        for(unsigned j=1;j<DAG[i].mark.size();j++) cout<<"副标记："<<DAG[i].mark[j]<<endl;

    }
}
void showQUATS(){
    for(unsigned int i=0;i<QUATS.size();i++){
        cout<<std::left<<setw(3)<<i<<"("<<QUATS[i].w<<","<<QUATS[i].op1<<","<<QUATS[i].op2<<","<<QUATS[i].t<<")"<<endl;
    }
}

void showNEW_QUATS(){
    cout<<"\n优化后的四元式:"<<endl;
    for(unsigned int i=0;i<NEW_QUATS.size();i++){
        cout<<"("<<NEW_QUATS[i].w<<","<<NEW_QUATS[i].op1<<","<<NEW_QUATS[i].op2<<","<<NEW_QUATS[i].t<<")"<<endl;
    }
}

void optimizeOnce(){       //优化一次
        //初始化
        DAG.clear();
        mapDag.clear();
        NEW_QUATS.clear();
        index=0;
        //将跳转语句的偏移量处理成对应四元式编号
        for(int i=0;i<int(QUATS.size());i++){
            if(QUATS[i].w=="jmpc" || QUATS[i].w=="jmpb" || QUATS[i].w=="if" || QUATS[i].w=="el" || QUATS[i].w=="do" || QUATS[i].w=="we"){
                int dis;
                std::stringstream ss;
                ss<<QUATS[i].t;
                ss>>dis;
                dis = dis+i;    //实际位置
                ostringstream oss;
                oss <<dis;
                QUATS[i].t = oss.str();
            }
        }
        vector<unsigned int> Jumpc;  //存jmpc跳转到的四元式位置
        vector<unsigned int> Jumpb;  //存jmpb跳转到的四元式位置
        vector<unsigned int> Ifs;  //存if跳转到的四元式位置
        vector<unsigned int> Els;  //存el跳转到的四元式位置
        vector<unsigned int> Dos;  //存do跳转到的四元式位置
        vector<unsigned int> Wes;  //存we跳转到的四元式位置
        map<string,string> JumpcI;    //存每个跳转四元式优化后应该跳转到的位置
        map<string,string> JumpbI;
        map<string,string> IfI;
        map<string,string> ElI;
        map<string,string> DoI;
        map<string,string> WeI;
        for(unsigned int i=0;i<QUATS.size();i++){
            if(QUATS[i].w=="jmpc"){
                std::stringstream ss;
                ss<<QUATS[i].t;
                unsigned int t;
                ss>>t;
                Jumpc.push_back(t);
            }
            else if(QUATS[i].w=="jmpb"){
                std::stringstream ss;
                ss<<QUATS[i].t;
                unsigned int t;
                ss>>t;
                Jumpb.push_back(t);
            }
            else if(QUATS[i].w=="if"){
                std::stringstream ss;
                ss<<QUATS[i].t;
                unsigned int t;
                ss>>t;
                Ifs.push_back(t);
            }
            else if(QUATS[i].w=="el"){
                std::stringstream ss;
                ss<<QUATS[i].t;
                unsigned int t;
                ss>>t;
                Els.push_back(t);
            }
            else if(QUATS[i].w=="do"){
                std::stringstream ss;
                ss<<QUATS[i].t;
                unsigned int t;
                ss>>t;
                Dos.push_back(t);
            }
            else if(QUATS[i].w=="we"){
                std::stringstream ss;
                ss<<QUATS[i].t;
                unsigned int t;
                ss>>t;
                Wes.push_back(t);
            }
        }

        int *a;
        int n=QUATS.size();
        a = (int *)malloc(sizeof(int) * n);
        for (int i = 1; i < n; i++)  a[i] = 0;  //入口四元式标记，1表示是入口
        for(unsigned int i=0;i<QUATS.size();i++){
            if(QUATS[i].w=="call" || QUATS[i].w=="ret" || QUATS[i].w=="pvall" || QUATS[i].w=="pvret" || QUATS[i].w=="f_begin " || QUATS[i].w=="f_end"){
                //下一条为入口
                if(i+1<QUATS.size()) a[i+1]=1;
            }
            else if(QUATS[i].w=="if" || QUATS[i].w=="el" || QUATS[i].w=="do" || QUATS[i].w=="we" || QUATS[i].w=="jmpc" ||QUATS[i].w=="jmpb"){
                //下一条为入口
                if(i+1<QUATS.size()) a[i+1]=1;
                //转移到的为入口
                std::stringstream ss;
                ss<<QUATS[i].t;
                int t;
                ss>>t;
                a[t]=1;
            }
        }
        //分块进行优化
        for(int unsigned i=0;i<QUATS.size();i++){
            if(QUATS[i].w=="call") {ftemp.push_back(QUATS[i].t);}
            if(a[i]==1){
                creatNEW_QUATS();
                DAG.clear();
                mapDag.clear();
                index=0;
                if(find(Jumpc.begin(),Jumpc.end(),i)!=Jumpc.end()){
                    ostringstream oss,os;
                    oss <<i;
                    os<<NEW_QUATS.size();
                    JumpcI[oss.str()]= os.str();
                }
                if(find(Jumpb.begin(),Jumpb.end(),i)!=Jumpb.end()){
                    ostringstream oss,os;
                    oss <<i;
                    os<<NEW_QUATS.size();
                    JumpbI[oss.str()]= os.str();
                }
                if(find(Ifs.begin(),Ifs.end(),i)!=Ifs.end()){
                    ostringstream oss,os;
                    oss <<i;
                    os<<NEW_QUATS.size();
                    IfI[oss.str()]= os.str();
                }
                if(find(Els.begin(),Els.end(),i)!=Els.end()){
                    ostringstream oss,os;
                    oss <<i;
                    os<<NEW_QUATS.size();
                    ElI[oss.str()]= os.str();
                }
                if(find(Dos.begin(),Dos.end(),i)!=Dos.end()){
                    ostringstream oss,os;
                    oss <<i;
                    os<<NEW_QUATS.size();
                    DoI[oss.str()]= os.str();
                }
                if(find(Wes.begin(),Wes.end(),i)!=Wes.end()){
                    ostringstream oss,os;
                    oss <<i;
                    os<<NEW_QUATS.size();
                    WeI[oss.str()]= os.str();
                }
            }
            addDagNode(QUATS[i]);
        }
        creatNEW_QUATS();
        for(unsigned int i=0;i<NEW_QUATS.size();i++){
            if(NEW_QUATS[i].w=="jmpc") NEW_QUATS[i].t = JumpcI[NEW_QUATS[i].t];   //修改jmpc四元式的偏移量
            else if(NEW_QUATS[i].w=="jmpb") NEW_QUATS[i].t = JumpbI[NEW_QUATS[i].t]; //修改jmpb四元式的偏移量
            else if(NEW_QUATS[i].w=="if") NEW_QUATS[i].t = IfI[NEW_QUATS[i].t];  //修改if四元式的偏移量
            else if(NEW_QUATS[i].w=="el") NEW_QUATS[i].t = ElI[NEW_QUATS[i].t];  //修改el四元式的偏移量
            else if(NEW_QUATS[i].w=="do") NEW_QUATS[i].t = DoI[NEW_QUATS[i].t];  //修改do四元式的偏移量
            else if(NEW_QUATS[i].w=="we") NEW_QUATS[i].t = WeI[NEW_QUATS[i].t];  //修改we四元式的偏移量
        }
        for(int i=0;i<int(NEW_QUATS.size());i++){  //实际位置变为偏移量
            if(NEW_QUATS[i].w=="jmpc" || NEW_QUATS[i].w=="jmpb" || NEW_QUATS[i].w=="if" || NEW_QUATS[i].w=="el" || NEW_QUATS[i].w=="do" || NEW_QUATS[i].w=="we"){
                int dis;
                std::stringstream ss;
                ss<<NEW_QUATS[i].t;
                ss>>dis;
                dis = dis-i;    //实际位置
                ostringstream oss;
                oss <<dis;
                NEW_QUATS[i].t = oss.str();

            }
        }

        QUATS=NEW_QUATS;
}

void optimizeQuats(){
    int num=N;
    while(num--){
       optimizeOnce();
    }
}
