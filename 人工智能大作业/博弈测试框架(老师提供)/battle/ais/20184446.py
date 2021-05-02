#20184446.py
#import time
size = 15 #棋盘大小
Serch_Depth = 2 #最大搜索深度
goals= [] #保存子节点的得分
LianWU = 10000000     #连五 *****
HuoSI = 180000      #活四 _****_
SiSI = 40000       #死四 #****_    *_***   **_**
HuoSAN = 30000     #活三 _***_     _*_**_
SiSAN = 5000       #死三 _***#     _*_**#
                    #死三 _**_*#    *__**
                    #死三 *_*_*     #_***_#
HuoER =  10000     #活二 __**__    _*_*_   _*__*_
SiER = 10          #死二 ___**#    __*_*#
                    #死二 _*__*#    *___*
El = 0              #其他
def ai(List_me, List_enemy, List_all):    #ai博弈函数
    #time_start = time.time()
    global goals
    if len(List_enemy) == 0:    #若先手 7，7
        #print(7,7)
        #time_end = time.time()
        #print("Time:"+str(time_end-time_start))
        return (7,7)
    #保护现场
    MyList = List_me    #我方落子序列
    EnList = List_enemy #敌方落子序列
    AlList = List_all   #棋盘棋子序列
    HasList = MyList + EnList #已落子序列
    Alpha = float('-inf')
    Beta = float('inf')
    next_step = generator(HasList, List_all) #搜索可落子点
    dep =0  #第0层
    who = 1# 1为ai 2为敌手
    Max = AlphaBeta(dep, 1, Alpha, Beta, MyList, EnList, HasList, AlList) #调用算法
    i = goals.index(Max)
    #print(next_step[i])
    #time_end = time.time()
    #print("Time:"+str(time_end-time_start))
    return next_step[i]
#极大极小算法 有剪枝
def AlphaBeta(dep, who, Alpha, Beta, MyList, EnList, HasList, AlList):     #返回当前结点权重
    global goals
    if if_win(MyList, EnList)!=0 or dep == Serch_Depth: #决策树叶子结点或游戏结束
        return envalution(who, MyList, EnList, HasList, AlList) #返回权重
    else:
        G = []  #保存子节点权重值
        G.clear()
        lists = generator(HasList, AlList)  #寻找子节点 即可落子的点
        for pos in lists:   #遍历可落子点
            if who == 1: #ai落子    极大值点
                MyList.append(pos)  #ai落子--->子节点
                HasList.append(pos)
                temp = AlphaBeta(dep+1, 2, Alpha, Beta, MyList, EnList, HasList, AlList)    #深度增加，敌手落子,返回子节点权值
                G.append(temp) #保存子节点权重为列表
                MyList.pop()    #恢复现场
                HasList.pop()  
                if temp > Alpha:
                    Alpha = temp
                    if Alpha >= Beta:
                        return Beta     #剪枝
            else:   #敌手落子   极小值点
                EnList.append(pos)
                HasList.append(pos)
                temp = AlphaBeta(dep+1, 1, Alpha, Beta, MyList, EnList, HasList, AlList)    #深度增加，ai落子， 返回子节点权值
                G.append(temp) #保存子节点权重为列表
                EnList.pop()
                HasList.pop()
                if temp < Beta:
                    Beta = temp
                    if Alpha >= Beta:
                        return Alpha    #剪枝
        #print(G)
        goals = G   #另存 最后退出保存的应是第一层的权值
        if who == 1: #ai落子    极大值点
            return Alpha
        else:  #敌手落子    极小值点
            return Beta          

def generator(HasList, AlList):     #搜索可以落子的点 当前为棋子邻近的点
    blank = list(set(AlList).difference(set(HasList)))
    lists = []
    for pos in blank:
        if is_neighbour(pos, HasList, 3):
            lists.append(pos)   #添加
    return lists    #返回可落子点列表
    
def is_neighbour(pos, HasList, dis):    #判断点是否为已落子的邻近点 dis距离
    for i in range(1, dis+1):
        if (pos[0],pos[1]-1*i) in HasList or (pos[0],pos[1]+1*i) in HasList or (pos[0]-1*i,pos[1]) in HasList or (pos[0]+1*i,pos[1]) in HasList or (pos[0]-1*i,pos[1]-1*i) in HasList or (pos[0]-1*i,pos[1]+1*i) in HasList or (pos[0]+1*i,pos[1]-1*i) in HasList or (pos[0]+1*i,pos[1]+1*i) in HasList:
            return True     #是邻近点
        else:
            return False    #不是

def if_win(MyList, EnList):#判断胜负 1 ai胜 2 敌手胜 0 继续 
    for dis in range(8):
        if len(MyList) != 0:
            my_pos = MyList[-1]
            if getPoint(my_pos, dis, 1) in MyList and getPoint(my_pos, dis, 2) in MyList and getPoint(my_pos, dis, 3) in MyList and getPoint(my_pos, dis, 4) in MyList:
                return 1
        if len(EnList) != 0:
            en_pos = EnList[-1]
            if getPoint(en_pos, dis, 1) in EnList and getPoint(en_pos, dis, 2) in EnList and getPoint(en_pos, dis, 3) in EnList and getPoint(en_pos, dis, 4) in EnList:
                return 2
    return 0   #暂无胜负 棋局继续

def envalution(who, MyList, EnList, HasList, AlList):   #评价函数 这里的who指的是该出手的一方 最新一步是由对方下的
    Weight_AD = 2
    value_ai = 0   #ai权值初始化
    value_enermy = 0    #敌手权值初始化
    blank = list(set(AlList).difference(set(HasList)))
    if if_win(MyList,EnList) == 1:    #ai胜
        return LianWU
    elif if_win(MyList,EnList) == 2:  #敌手胜
        return -LianWU
    else:   #未结束
        for pos in reversed(MyList):  #计算ai权值
            for dis in range(8): 
                t = 1
                if who == 1:#ai先手
                    t = t * Weight_AD
                value_ai += Get(pos, MyList, EnList, AlList, blank, dis) * t
                
        for pos in reversed(EnList):  #计算敌手权值
            for dis in range(8):
                t = 1
                if who == 2:#敌手先手
                    t = t * Weight_AD
                value_enermy += Get(pos, EnList, MyList, AlList, blank, dis) * t
        return value_ai - value_enermy

m_offset = [(0,-1),(1,-1),(1,0),(1,1),(0,1),(-1,1),(-1,0),(-1,-1)]
def getPoint(pos, dis, offset):
    r = pos[0]
    c = pos[1]
    r = r + offset * m_offset[dis][1]
    c = c + offset * m_offset[dis][0]
    return (r,c)

def Get(pos, my_list, enermy_list, all_list, blank, dis):
    # 0 1 1110    活四1
    if getPoint(pos, dis, -1) in blank and getPoint(pos, dis, 1) in my_list and getPoint(pos, dis, 2) in my_list and getPoint(pos, dis, 3) in my_list and getPoint(pos, dis, 4) in blank:
        return HuoSI/2
    #2 1 1110   死四1
    if getPoint(pos, dis, -1) not in (my_list + blank) and getPoint(pos, dis, 1) in my_list and getPoint(pos, dis, 2) in my_list and getPoint(pos, dis, 3) in my_list and getPoint(pos, dis, 4) in blank:
        return SiSI
    #1 0111     死四2
    if getPoint(pos, dis, 1) in blank and getPoint(pos, dis, 2) in my_list and getPoint(pos, dis, 3) in my_list and getPoint(pos, dis, 4) in my_list:
        return SiSI
    #1 1011     死四3
    if getPoint(pos, dis, 1) in my_list and getPoint(pos, dis, 2) in blank and getPoint(pos, dis, 3) in my_list and getPoint(pos, dis, 4) in my_list:
        return SiSI/2
    #0 1 110    活三1
    if getPoint(pos, dis, -1) in blank  and getPoint(pos, dis, 1) in my_list and getPoint(pos, dis, 2) in my_list and getPoint(pos, dis, 3) in blank:
        return HuoSAN/2
    #0 1 0110   活三2
    if getPoint(pos, dis, -1) in blank  and getPoint(pos, dis, 1) in blank and getPoint(pos, dis, 2) in my_list and getPoint(pos, dis, 3) in my_list and getPoint(pos, dis, 4) in blank:
        return HuoSAN
    #0 1 112    死三1
    if getPoint(pos, dis, -1) in blank  and getPoint(pos, dis, 1) in my_list and getPoint(pos, dis, 2) in my_list and getPoint(pos, dis, 3) not in (my_list + blank):
        return SiSAN
    #0 1 0112   死三2
    if getPoint(pos, dis, -1) in blank  and getPoint(pos, dis, 1) in blank and getPoint(pos, dis, 2) in my_list and getPoint(pos, dis, 3) in my_list and getPoint(pos, dis, 4) not in (my_list + blank):
        return SiSAN
    #0 1 1012   死三3
    if getPoint(pos, dis, -1) in blank  and getPoint(pos, dis, 1) in my_list and getPoint(pos, dis, 2) in blank and getPoint(pos, dis, 3) in my_list and getPoint(pos, dis, 4) not in (my_list + blank):
        return SiSAN
    # 1 0011    死三4
    if getPoint(pos, dis, 1) in blank and getPoint(pos, dis, 2) in blank and getPoint(pos, dis, 3) in my_list and getPoint(pos, dis, 4) in my_list:
        return SiSAN
    # 1 0101    死三5
    if getPoint(pos, dis, 1) in blank and getPoint(pos, dis, 2) in my_list and getPoint(pos, dis, 3) in blank and getPoint(pos, dis, 4) in my_list:
        return SiSAN/2
    #20 1 1102  死三6
    if getPoint(pos, dis, -2) not in (my_list + blank) and getPoint(pos, dis, -1) in blank and getPoint(pos, dis, 1) in my_list and getPoint(pos, dis, 2) in my_list and getPoint(pos, dis, 3) in blank and getPoint(pos, dis, 4) not in (my_list + blank):
        return SiSAN/2
    #00 1 100   活二1
    if getPoint(pos, dis, -2) in blank and getPoint(pos, dis, -1) in blank and getPoint(pos, dis, 1) in my_list and getPoint(pos, dis, 2) in blank and getPoint(pos, dis, 3) in blank:
        return HuoER/2
    #0 1 010    活二2
    if getPoint(pos, dis, -1) in blank  and getPoint(pos, dis, 1) in blank and getPoint(pos, dis, 2) in my_list and getPoint(pos, dis, 3) in blank:
        return HuoER/2
    #0 1 0010   活二3
    if getPoint(pos, dis, -1) in blank  and getPoint(pos, dis, 1) in blank and getPoint(pos, dis, 2) in blank and getPoint(pos, dis, 3) in my_list and getPoint(pos, dis, 4) in blank:
        return HuoER/2
    #2 1 1000   死二1
    if getPoint(pos, dis, -1) not in (my_list + blank)  and getPoint(pos, dis, 1) in my_list and getPoint(pos, dis, 2) in blank and getPoint(pos, dis, 3) in blank and getPoint(pos, dis, 4) in blank:
        return SiER
    #2 1 0100   死二2
    if getPoint(pos, dis, -1) not in (my_list + blank)  and getPoint(pos, dis, 1) in blank and getPoint(pos, dis, 2) in my_list and getPoint(pos, dis, 3) in blank and getPoint(pos, dis, 4) in blank:
        return SiER
    #2 1 0010   死二3
    if getPoint(pos, dis, -1) not in (my_list + blank)  and getPoint(pos, dis, 1) in blank and getPoint(pos, dis, 2) in blank and getPoint(pos, dis, 3) in my_list and getPoint(pos, dis, 4) in blank:
        return SiER
    # 1 0001    死二4
    if getPoint(pos, dis, 1) in blank and getPoint(pos, dis, 2) in blank and getPoint(pos, dis, 3) in blank and getPoint(pos, dis, 4) in my_list:
        return SiER/2
    return 0