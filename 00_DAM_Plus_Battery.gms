sets
i bus numbers  /1*33/
slack(i) slack bus /1/
pq(i) pq buses    /2*33/
g(i) index of generators /1, 4 , 14/
gg(g) pq bus with generators /4, 14/
pheads heads of generators /pmin,  pmax,   rdown,  rup /
GB(i,g)  /1.1, 4.4 , 14.14/
alias (i,j)

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



table branch(i,j,*) Network technical characteristics
                    x                   limit
1.2                 0.0470              1000
2.3                 0.2511              1000
3.4                 0.1864              1000
4.5                 0.1941              1000
5.6                 0.7070              1000
6.7                 0.6188              1000
7.8                 0.2351              1000
8.9                 0.7400              1000
9.10                0.7400              1000
10.11               0.0650              1000
11.12               0.1238              1000
12.13               1.1550              1000
13.14               0.7129              1000
14.15               0.5260              1000
15.16               0.5450              1000
16.17               1.7210              1000
17.18               0.5740              1000
2.19                0.1565              1000
19.20               1.3554              1000
20.21               0.4784              1000
21.22               0.9373              1000
3.23                0.3083              1000
23.24               0.7091              1000
24.25               0.7011              1000
6.26                0.1034              1000
26.27               0.1447              1000
27.28               0.9337              1000
28.29               0.7006              1000
29.30               0.2585              1000
30.31               0.9630              1000
31.32               0.3619              1000
32.33               0.5302              1000
;

branch(i , j , 'x' )$(branch(i,j,'x')=0)=branch(j,i,'x');
branch(i,j,'Limit')$(branch(i,j,'Limit')=0)=branch(j, i , 'Limit') ;
branch (i,j ,'bij')$branch (i, j ,'Limit') =1/ branch ( i ,j , 'x' ) ;


parameter conex   ;
conex (i,j)$(branch(i,j,'limit') and branch(j,i,'limit'))=1;
conex (i,j)$(conex(i,j))=1;



* PHASE 2 ***********************************************
table gdat(gg,*) unit data
       pmin   pmax         rdown  rup    a      b         c      d       PG0   V0    MUP   MDN
4      100    500          200    200    1      25        10     80      0     0     1     1
14     100    500          200    200    1      25        10     80      0     0     1     1

;

*gdat(gg,pheads)=(gdat(gg,pheads))/1000/ Sbase;

display PD , GDAT
*********************************************************


variable
z        objective value
delta(i) angle of each bus
PF(i,j)  Active power flowing from bus i to bus j
P(i)     Net active power of each bus
PG(g)    Active power generated from each bus
;

PG.up(gg)=gdat(gg,'pmax');
PG.lo(gg)=gdat(gg,'pmin');
delta.fx(slack)=0;



equations
obj              objective function
powerflow(i,j)        powerflow
kcl              kcl in each node


;

obj.. z=e=10*PG('1')+PG('4')+1*PG('14');
powerflow(i,j)$conex(i,j)..   PF(i,j)=e=(delta(i)-delta(j))*branch(i,j,'bij');
kcl(i).. sum(g$GB(i ,g),Pg(g))-PD(i)=e=+sum(j$conex(i, j),PF(i,j));
;


model DCPF /all/
solve DCPF minimizing z using lp


parameters   PF_actual(i,j), P_actual(i),  PG_actual(i);
PF_actual(i,j)=PF.l(i,j);
PG_actual(g)=PG.l(g);


parameter sumpg, sumpd   ;
sumpg= sum(g,PG.l(g));
sumpd= sum(i,Pd(i)) ;





display PF_actual,  PG_actual , sumpg , sumpd;


