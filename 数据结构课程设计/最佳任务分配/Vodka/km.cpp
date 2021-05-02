#include "km.h"

KM::KM()
{

}
KM ans;
bool ifok=true;
const int inf=2e9+7;
bool KM::Find(int v)
{
    /*used[v] = true;
    for (int i = 1; i <= matrix[v].size(); i++)
    {
        int u = matrix[v][i];
        int w = matchx[u];
        if (w < 0 || !used[w] && Find(w))
        {
            matchx[v] = u;
            matchy[u] = v;
            return true;
        }
    }
    return false;*/
    for (int i = 1; i < matrix[v].size(); i++)
    {
        if (matrix[v][i] < 0 && !used[i])
        {
            used[i] = true;
            if (matchy[i] == 0 || Find(matchy[i]))
            {
                matchy[i] = v;
                matchx[v] = i;
                return true;
            }
        }
    }
    return false;
}

bool KM::xyl()//分配
{
    for (int m = 0; m <= tn; m++)
    {
        matchx.push_back(0);
    }
    for (int n = 0; n <= pn; n++)
    {
        matchy.push_back(0);
    }
    int step = 0;
    for (int k = 1; k <= tn; k++)
    {
        memset(used, false, sizeof(used));
        if (Find(k) == true)
        {
            step++;
            //cout << step;
        }

    }
    if (step != tn)
        return false;
    else
        return true;
}

bool KM::dfs(int x)
{
    visx[x]=1;
    for(int i=1; i<=pn; i++)
    {
        if(numx[x]+numy[i] == matrix[x][i])
        {
            if(!visy[i])
            {
                visy[i]=1;
                if(!matchy[i] || dfs(matchy[i]))
                {
                    matchy[i]=x;
                    matchx[x]=i;
                    return 1;
                }

            }
        }
        else  //计算当前的最小减少点标
            slack[i]=min(slack[i],numx[x]+numy[i]-matrix[x][i]);
    }
    return 0;
}

double KM::_km()
{

    for(int i=1; i<=tn; i++)  //点标初始化
    {
        numx[i] = -inf;
    }
    memset(numy,0,sizeof(numy));
    for(int i=0; i<=tn; i++)
        matchx[i]=0;
    for(int i=0; i<=pn; i++)
        matchy[i]=0;

    for(int i=1; i<=tn; i++)     //给每一个点的初始化点标
        for(int j=1; j<=pn; j++)
            if(matrix[i][j]<0)
                numx[i] = max(numx[i],matrix[i][j]);
            else matrix[i][j]=-inf;

    for(int i=1; i<=tn; i++)
    {
        while(1)
        {
            for(int i=1; i<=105; i++)
            {
                slack[i] = inf;
            }
            memset(visx,0,sizeof(visx));
            memset(visy,0,sizeof(visy));

            if(dfs(i))
                break;

            d = inf;

            for(int j=1; j<=pn; j++)
            {
                if(!visy[j])
                {
                    d=min(d,slack[j]);
                }
            }

            for(int j=1; j<=max(tn,pn); j++)
            {
                if(visy[j])
                    numy[j]+=d;
                if(visx[j])
                    numx[j]-=d;
            }

        }
    }

    mincost = 0;
    for(int i=1; i<=tn; i++)
    {
        mincost += matrix[i][matchx[i]];
    }
    mincost = -mincost;

    for(int i=1; i<=tn; i++)
        cout<<"第"<<matchx[i]<<"个人配第"<<i<<"项课题"<<endl;

    cout<<"一共需要"<<mincost<<"yuan"<<endl;


    return mincost;
}


bool KM::inputinit(){
    for(int i=0;i<105;i++){
        matrix[i].clear();
    }
    matchx.clear();
    matchy.clear();
    tn=pn=0;
    pname.clear();
    tname.clear();
}
