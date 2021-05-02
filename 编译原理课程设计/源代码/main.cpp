#include "all.h"

using namespace std;
/*ofstream outfile("quats.txt");
void quats_print() {
    int cnt = 1;
    for (const auto &i:QUATS) {
        outfile << cnt << "¡¢ " << "( " << i.w << " , " << i.op1 << " , " << i.op2 << " , " << i.t << " )" << endl;
        cnt++;
    }
}*/
extern string path ;
extern Lexical *lex;
extern PaserLL p;
//Lexical lex(path);

int main(int argc,char *argv[]) {

    //p.PrintGram();
    //p.PrintGram_With_Action();
    //p.PrintFirst();
    //p.PrintFollow();
    //p.PrintTable();
    if(argc<3){
        cout<<"Please enter the the Filename and the Destination filename"<<endl;
        exit(1);
    }
    path=argv[1];
    lex=new Lexical(path);
    PaserLL p(*lex);
    p.PrintToken();
    try {
        p.LL1();
    } catch (string &s) {
        cout << s << endl;
        exit(1);
    }

    freopen(argv[2],"w",stdout);
    cout<<"-------------------"<<endl;
    showQUATS();
    optimizeQuats();
    cout<<"---------------------"<<endl;
    showQUATS();
}
