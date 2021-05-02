#include "all.h"

using namespace std;

typedef void(*voidptr)();
void Action(string s);

void semantic_analysis_init(); 
extern map<string, voidptr> SA_mp;
