sets
i bus numbers  /1*33/
slack(i) slack bus /1/
pq(i) pq buses    /2*33/
Gen(i) index of generators /4,14 /

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
                    react         con       limit
1.2                 0.0470        yes       1000
2.3                 0.2511        yes       1000
3.4                 0.1864        yes       1000
4.5                 0.1941        yes       1000
5.6                 0.7070        yes       1000
6.7                 0.6188        yes       1000
7.8                 0.2351        yes       1000
8.9                 0.7400        yes       1000
9.10                0.7400        yes       1000
10.11               0.0650        yes       1000
11.12               0.1238        yes       1000
12.13               1.1550        yes       1000
13.14               0.7129        yes       1000
14.15               0.5260        yes       1000
15.16               0.5450        yes       1000
16.17               1.7210        yes       1000
17.18               0.5740        yes       1000
2.19                0.1565        yes       1000
19.20               1.3554        yes       1000
20.21               0.4784        yes       1000
21.22               0.9373        yes       1000
3.23                0.3083        yes       1000
23.24               0.7091        yes       1000
24.25               0.7011        yes       1000
6.26                0.1034        yes       1000
26.27               0.1447        yes       1000
27.28               0.9337        yes       1000
28.29               0.7006        yes       1000
29.30               0.2585        yes       1000
30.31               0.9630        yes       1000
31.32               0.3619        yes       1000
32.33               0.5302        yes       1000
;
LineData(i,j,'react')$(LineData(i,j,'react')=0)=LineData(i,j,'react');
LineData(i,j,'con')$(LineData(i,j,'con')=0)=LineData(i,j,'con');
LineData(i,j,'Limit')$(LineData(i,j,'Limit')=0)=LineData(i,j,'Limit') ;


parameter conex(i, j) ;
conex(i,j)$(LineData(i,j,'con') and LineData (i, j,'con'))=1;
conex(i,j)$(conex(i ,j))=1;


LineData(i,j,'react')=LineData(i,j,'react')/Zbase;
LineData(i,j,'Limit')=(LineData(i,j,'Limit')/1000)/ Sbase;
* PHASE 2 ***********************************************
table gdat(g,*) unit data
       pmin  pmax   rdown  rup    a      b         c      d       PG0   V0    MUP   MDN
4      100   1000   200    200    1      25        10     80      0     0     1     1
14     100   1000   200    200    1      25        10     80      0     0     1     1

;

gdat(g,pheads)=(gdat(g,pheads)/1000)/ Sbase;
display gdat

Set GB( i ,Gen) connectivity index of each generating unit to each bus
/ 4.g4, 14.g14 / ;
*********************************************************



variable
z        objective value
delta(i) angle of each bus
Pij(i,j)  Active power flowing from bus i to bus j
P(i)     Net active power of each bus
PG(i)    Active power generated from each bus
;

PG.fx(pq)=0;
PG.up(g)=gdat(g,'pmax');
PG.lo(g)=gdat(g,'pmin');
delta.fx(slack)=0;


display PG.up


equations
obj              objective function
powerflow(i,j)        powerflow
kcl              kcl in each node
Netpower         Net power in each node

* PHASE 2 **********************************************


*******************************************************
;


obj.. z=e=1000*PG('1')+100*PG('14')+10*PG('4');
powerflow(i,j)$(conex(i,j))..   Pij(i,j)=e=(delta(i)-delta(j))/ LineData(i,j,'react')   ;
kcl(i).. P(i)=e=sum(j$LineData(i,j,'con') ,pF(i,j))  ;
Netpower(i).. P(i)=e=+sum(Gen$GB(i ,Gen), Pg(Gen))  -PD(i);


const2 ( bus , t ) . . +sum( Gen$GB ( bus , Gen ) , Pg ( Gen , t ) )
WD ( t , ’ d ’ )BusData ( bus , ’pd ’ ) / Sbase=e=+sum( node$conex (node , bus ) ,Pij ( bus , node , t ) ) ;
* PHASE 2 **********************************************


*******************************************************

model DCPF /all/
solve DCPF minimizing z using lp


parameters   PF_actual(i,j), P_actual(i),  PG_actual(i);
PF_actual(i,j)=PF.l(i,j)*Sbase;
P_actual(i)=P.l(i)*Sbase ;
PG_actual(i)=PG.l(i)*Sbase;



parameter sumpg, sumpd   ;
sumpg= sum(i,PG.l(i));
sumpd= sum(i,Pd(i)) ;





display PF_actual, P_actual,  PG_actual , sumpg , sumpd;


