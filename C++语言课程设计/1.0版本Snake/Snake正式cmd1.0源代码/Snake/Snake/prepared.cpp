#pragma once
#include "all_head.h"
using namespace std;
/*struct pos//逻辑坐标
{
	int x;
	int y;
};*/
COORD postocoord(pos p)//逻辑坐标到实际坐标
{
	COORD coord;
	coord.X = p.x*_proportion;
	coord.Y = p.y*_proportion;
	return coord;
}
/*
enum direction//方向
{
	w, a, s, d
};
*/
void print(COLORREF photo[][_proportion], pos p)//在p点打印图案
{
	COORD coord = postocoord(p);
	int i, k;
	for (i = coord.X; i < coord.X + 15; i++)
	{
		for (k = coord.Y; k < coord.Y + 15; k++)
		{
			putpixel(i, k, photo[i - coord.X][k - coord.Y]);
		}
	}
}
void savephoto(COLORREF photo[][_proportion], string load)
{
	ofstream f(load, ios::out | ios::binary);
	f.write((char *)photo, sizeof(COLORREF) * _proportion * _proportion);
	f.close();
}
void savephoto(COLORREF photo[][_proportion], char load[])
{
	ofstream f(load, ios::out | ios::binary);
	f.write((char *)photo, sizeof(COLORREF) * _proportion * _proportion);
	f.close();
}//在load路径下以二进制存储图案
void loadphoto(COLORREF photo[][_proportion], string load)
{
	ifstream f(load, ios::in | ios::binary);
	f.read((char *)photo, sizeof(COLORREF) * _proportion * _proportion);
	f.close();
}
void loadphoto(COLORREF photo[][_proportion], char load[])
{
	ifstream f(load, ios::in | ios::binary);
	f.read((char *)photo, sizeof(COLORREF) * _proportion * _proportion);
	f.close();
}//读取load路径下的二进制文件，将图案存储到photo中
//将TCHAR转为char   
//*tchar是TCHAR类型指针，*_char是char类型指针   
void TcharToChar(const TCHAR * tchar, char * _char)
{
	int iLength;
	//获取字节长度   
	iLength = WideCharToMultiByte(CP_ACP, 0, tchar, -1, NULL, 0, NULL, NULL);
	//将tchar值赋给_char    
	WideCharToMultiByte(CP_ACP, 0, tchar, -1, _char, iLength, NULL, NULL);
}
//同上   
void CharToTchar(const char * _char, TCHAR * tchar)
{
	int iLength;

	iLength = MultiByteToWideChar(CP_ACP, 0, _char, strlen(_char) + 1, NULL, 0);
	MultiByteToWideChar(CP_ACP, 0, _char, strlen(_char) + 1, tchar, iLength);
}