#pragma once
#ifndef BEAN_H
#define BEAN_H
#include "all_head.h"

extern COLORREF bean[rate][rate];

class Bean{
private:
	
	pos BEAN;
public:
	void Create();
	void Print();
	int nature=0;	//0 ÆÕÍ¨  1 Ñª+1  2 
};
extern Bean beanfood;
#endif