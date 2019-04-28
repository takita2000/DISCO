sets
i bus numbers  /1*33/
slack(i) slack bus /1/
pq(i) pq buses    /2*33/
g(pq) index of generators  /4, 14/
pheads heads of generators /pmin,  pmax,   rdown,  rup /
alias (i,j)

scalar BASE_MVA /100/;
scalar BASE_KV /12.66/;

scalars
Vbase
Sbase
Zbase
;
Vbase = BASE_KV * 10**3;
Sbase = BASE_MVA * 10**6;
Zbase = Vbase**2 / Sbase;

parameter PD(i) Demand of each bus   in kw
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

/ ;

PD(i)=(PD(i)/1000)/ Sbase;


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

LineData(i,j,'react')=LineData(i,j,'react')/Zbase;

* PHASE 2 ***********************************************
table gdat(g,*) unit data
       pmin  pmax   rdown  rup    a      b         c      d       PG0   V0    MUP   MDN
4      100   800    200    200    1      25        10     80      0     0     1     1
14     100   800    200    200    1      25        10     80      0     0     1     1

;

gdat(g,pheads)=(gdat(g,pheads)/1000)/ Sbase;
display gdat
*********************************************************


variable
z        objective value
delta(i) angle of each bus
PF(i,j)  Active power flowing from bus i to bus j
P(i)     Net active power of each bus
PG(i)    Active power generated from each bus
;
PG.fx(pq)=0;
PG.up(g)=gdat(g,'pmax');
PG.lo(g)=gdat(g,'pmin');
delta.fx(slack)=0;









equations
obj              objective function
powerflow        powerflow
kcl              kcl in each node
Netpower         Net power in each node

* PHASE 2 **********************************************


*******************************************************
;


obj.. z=e=1000*PG('1');
powerflow(i,j)$(LineData(i,j,'con'))..   PF(i,j)=e=(delta(i)-delta(j))/ LineData(i,j,'react')   ;
kcl(i).. P(i)=e=sum(j$LineData(i,j,'con') ,pF(i,j))  ;
Netpower(i).. P(i)=e=PG(i)-PD(i);

* PHASE 2 **********************************************


*******************************************************

model DCPF /all/
solve DCPF minimizing z using lp

********* return actual values *******************************
parameters   PF_actual(i,j), P_actual(i),  PG_actual(i);
PF_actual(i,j)=PF.l(i,j)*Sbase;
P_actual(i)=P.l(i)*Sbase ;
PG_actual(i)=PG.l(i)*Sbase;

***************************************************






parameter sumpg, sumpd   ;
sumpg= sum(i,PG_actual(i));

sumpd= sum(i,Pd(i)) ;




display PF_actual, P_actual,  PG_actual , sumpg , sumpd;




