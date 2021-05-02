#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <conio.h>
#include "Chain.h"

void SaveFile2(struct BooksInfo*pHead)                  //将链表保存至文件
{
	struct BooksInfo*p;
	p = pHead;
	FILE *fp;
	fp = fopen("BooksInfo.txt", "w");
	if (NULL == fp)
	{
		//printf("打开文件失败！");
		return;
	}
	while (p)
	{
		fprintf(fp, "%s\n", p->name);
		fprintf(fp, "%s\n", p->ISBN);
		fprintf(fp, "%s\n", p->BianHao);
		fprintf(fp, "%s\n", p->writer);
		fprintf(fp, "%s\n", p->print);
		//fprintf(fp, "%d\n", p->PubTime.day);
		fprintf(fp, "%s\n", p->cate);
		fprintf(fp, "%d\n", p->zt);
		fprintf(fp, "%f\n", p->price);
		fprintf(fp, "%d\n", p->PubTime.year);
		fprintf(fp, "%d\n", p->PubTime.mon);
		if (p->zt == 1)
		{
			fprintf(fp, "%s\n", p->BorrowStu_id);
		}
		p = p->next;
	}
	fclose(fp);
	return;
}

struct BooksInfo*OpenFile2()                                 //将文件输出至链表
{
	struct BooksInfo*pHead;
	//int t;
	struct BooksInfo*p, *q;
	FILE *fp;
	fp = fopen("BooksInfo.txt", "r");
	if (fp == NULL)
	{
		//printf("打开文件失败！\n");
		return NULL;
	}
	//else printf("打开文件成功\n");
	pHead = q = p = (struct BooksInfo*)malloc(sizeof(struct BooksInfo));
	int iCount2 = 0;
	while (fscanf(fp, "%s", p->name) != EOF)
	{
		fscanf(fp, "%s", p->ISBN);
		fscanf(fp, "%s", p->BianHao);
		fscanf(fp, "%s", p->writer);
		fscanf(fp, "%s", p->print);
		fscanf(fp, "%s", p->cate);
		fscanf(fp, "%d", &p->zt);
		fscanf(fp, "%f", &p->price);
		fscanf(fp, "%d", &p->PubTime.year);
		fscanf(fp, "%d", &p->PubTime.mon);
		if (p->zt == 1)
		{
			fscanf(fp, "%s", p->BorrowStu_id);
		}
		iCount2 = iCount2 + 1;
		q = p;
		p = (struct BooksInfo*)malloc(sizeof(struct BooksInfo));
		q->next = p;
	}
	printf("系统中已存%d本书籍\n", iCount2);
	fclose(fp);
	//printf("关闭文件");
	q->next = NULL;
	free(p);

	//printf("成功创建新链表\n");
	return pHead;
}

void Freechain2(struct BooksInfo*pHead)                              //释放整个链表
{
	struct BooksInfo*p, *q;
	p = pHead;
	q = p->next;
	while (q != NULL)
	{
		free(p);
		p = q;
		q = p->next;
	}

}

