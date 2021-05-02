#pragma once
#include "all_head.h"
using namespace std;
const int _proportion = 15;//放缩比例
struct pos//逻辑坐标
{
	int x;
	int y;
};
COORD postocoord(pos p);//逻辑坐标到实际坐标
enum direction//方向
{
	w, a, s, d
};
void print(COLORREF photo[][_proportion], pos p);//在p点打印图案
void savephoto(COLORREF photo[][_proportion], string load);
void savephoto(COLORREF photo[][_proportion], char load[]);//在load路径下以二进制存储图案
void loadphoto(COLORREF photo[][_proportion], string load);
void loadphoto(COLORREF photo[][_proportion], char load[]);//读取load路径下的二进制文件，将图案存储到photo中
//将TCHAR转为char   
//*tchar是TCHAR类型指针，*_char是char类型指针   
void TcharToChar(const TCHAR * tchar, char * _char);
//同上   
void CharToTchar(const char * _char, TCHAR * tchar);
