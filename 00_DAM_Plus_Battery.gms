sets
i bus numbers  /1*33/
slack(i) slack bus /1/
pq(i) pq buses    /2*33/
alias (i,j)


parameter PD(i) Demand of each bus
/
1        0
2        100
3        90
4        120
5        60
6        60
7        200
8        200
9        60
10       60
11       45
12       60
13       60
14       120
15       60
16       60
17       60
18       90
19       90
20       90
21       90
22       90
23       90
24       420
25       420
26       60
27       60
28       60
29       120
30       200
31       150
32       210
33       60

/

Table LineData(i,j,*)     Data of each line
                    react         con
1.2                 0.0470        yes
2.3                 0.2511        yes
3.4                 0.1864        yes
4.5                 0.1941        yes
5.6                 0.7070        yes
6.7                 0.6188        yes
7.8                 0.2351        yes
8.9                 0.7400        yes
9.10                0.7400        yes
10.11               0.0650        yes
11.12               0.1238        yes
12.13               1.1550        yes
13.14               0.7129        yes
14.15               0.5260        yes
15.16               0.5450        yes
16.17               1.7210        yes
17.18               0.5740        yes
2.19                0.1565        yes
19.20               1.3554        yes
20.21               0.4784        yes
21.22               0.9373        yes
3.23                0.3083        yes
23.24               0.7091        yes
24.25               0.7011        yes
6.26                0.1034        yes
26.27               0.1447        yes
27.28               0.9337        yes
28.29               0.7006        yes
29.30               0.2585        yes
30.31               0.9630        yes
31.32               0.3619        yes
32.33               0.5302        yes
;

LineData(i,j,'react')$(ord(i)>ord(j))=LineData(j,i,'react');
LineData(i,j,'con')$(ord(i)>ord(j))=LineData(j,i,'con');



variable
z        objective value
delta(i) angle of each bus
PF(i,j)  Active power flowing from bus i to bus j
P(i)     Net active power of each bus
PG(i)    Active power generated from each bus
;
PG.fx(pq)=0;
delta.fx(slack)=0;
equations
obj              objective function
powerflow        powerflow
kcl              kcl in each node
Netpower         Net power in each node
;


obj.. z=e=1;
powerflow(i,j)$(LineData(i,j,'con'))..   PF(i,j)=e=(delta(i)-delta(j))/ LineData(i,j,'react')   ;
kcl(i).. P(i)=e=sum(j$LineData(i,j,'con') ,pF(i,j))  ;
Netpower(i).. P(i)=e=PG(i)-PD(i);


model DCPF /all/
solve DCPF maximizing z using lp






