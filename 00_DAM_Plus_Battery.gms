sets
i bus numbers  /1*33/
slack(i) slack bus /1/
pq(i) pq buses    /2*33/
g(i) index of generators /1, 4 , 14/
t time period   /t0*t24/
s scenarios    /1*4/
gg(g) pq bus with generators /4, 14/
pheads heads of generators /pmin,  pmax,   rdown,  rup /
GB(i,g)  /1.1, 4.4 , 14.14/
alias (i,j)


table lambdaDA(t,s)
           1            2            3            4
 t1        29.83        29.83        29.83        29.83
 t2        30.99        30.99        30.99        30.99
 t3        28.5         28.5         28.5         28.5
 t4        34.33        34.33        34.33        34.33
 t5        34.37        34.37        34.37        34.37
 t6        35.78        35.78        35.78        35.78
 t7        34.87        34.87        34.87        34.87
 t8        35.88        35.88        35.88        35.88
 t9        37.21        37.21        37.21        37.21
t10        47.23        47.23        47.23        47.23
t11        43.42        43.42        43.42        43.42
t12        39.63        39.63        39.63        39.63
t13        39.05        39.05        39.05        39.05
t14        44.5         44.5         44.5         44.5
t15        43.33        43.33        43.33        43.33
t16        50.85        50.85        50.85        50.85
t17        55.27        55.27        55.27        55.27
t18        58.94        58.94        58.94        58.94
t19        57.89        57.89        57.89        57.89
t20        49.91        49.91        49.91        49.91
t21        51.43        51.43        51.43        51.43
t22        48.55        48.55        48.55        48.55
t23        36.43        36.43        36.43        36.43
t24        39.02        39.02        39.02        39.02

Table PDTotal(t,s)
           1           2           3            4
 t1        2.88        2.88        2.88        2.7
 t2        2.6         2.6         2.6         2.72
 t3        2.65        2.65        2.65        2.59
 t4        2.39        2.39        2.39        2.77
 t5        2.95        2.95        2.95        2.76
 t6        3.2         3.2         3.2         2.98
 t7        3.42        3.42        3.42        3.22
 t8        3.37        3.37        3.37        3.4
 t9        3.43        3.43        3.43        3.51
t10        3.56        3.56        3.56        3.65
t11        3.64        3.64        3.64        3.53
t12        3.72        3.72        3.72        3.6
t13        3.58        3.58        3.58        3.46
t14        3.59        3.59        3.59        3.51
t15        3.62        3.62        3.62        3.52
t16        3.55        3.55        3.55        3.44
t17        3.57        3.57        3.57        3.61
t18        3.49        3.49        3.49        3.53
t19        3.66        3.66        3.66        3.51
t20        3.49        3.49        3.49        3.42
t21        3.43        3.43        3.43        3.39
t22        3.37        3.37        3.37        3.5
t23        3.17        3.17        3.17        3.18
t24        3.05        3.05        3.05        2.95

scalar PMaxSub /3/

parameter PDem0(i) Demand of each bus   in kw
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

Parameter Pdem1(i), TPdem, LW(i), PD(i,t,s);
TPdem = sum(i, Pdem0(i));
LW(i)= Pdem0(i)/TPdem;
PD(i,t,s)=LW(i)*PDtotal(t,s);


table branch(i,j,*) Network technical characteristics
                    x                   limit
1.2                 0.0470              100000
2.3                 0.2511              100000
3.4                 0.1864              100000
4.5                 0.1941              100000
5.6                 0.7070              100000
6.7                 0.6188              100000
7.8                 0.2351              100000
8.9                 0.7400              100000
9.10                0.7400              100000
10.11               0.0650              100000
11.12               0.1238              100000
12.13               1.1550              100000
13.14               0.7129              100000
14.15               0.5260              100000
15.16               0.5450              100000
16.17               1.7210              100000
17.18               0.5740              100000
2.19                0.1565              100000
19.20               1.3554              100000
20.21               0.4784              100000
21.22               0.9373              100000
3.23                0.3083              100000
23.24               0.7091              100000
24.25               0.7011              100000
6.26                0.1034              100000
26.27               0.1447              100000
27.28               0.9337              100000
28.29               0.7006              100000
29.30               0.2585              100000
30.31               0.9630              100000
31.32               0.3619              100000
32.33               0.5302              100000
;

branch(i , j , 'x' )$(branch(i,j,'x')=0)=branch(j,i,'x');
branch(i,j,'Limit')$(branch(i,j,'Limit')=0)=branch(j, i , 'Limit') ;
branch (i,j ,'bij')$branch (i, j ,'Limit') =1/ branch ( i ,j , 'x' ) ;
parameter conex   ;
conex (i,j)$(branch(i,j,'limit') and branch(j,i,'limit'))=1;
conex (i,j)$(conex(i,j))=1;


parameter prob(s)
/
1  0.25
2  0.25
3  0.25
4  0.25
/

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
delta(i,t,s) angle of each bus
PF(i,j,t,s)  Active power flowing from bus i to bus j
P(i)     Net active power of each bus
PG(g,t,s)    Active power generated from each bus
;

PG.up(gg,t,s)=gdat(gg,'pmax');
PG.lo(gg,t,s)=gdat(gg,'pmin');
delta.fx(slack,t,s)=0;


PF.up(i,j,t,s)$(conex(i,j))=branch(i,j,'limit') ;
PF.lo(i,j,t,s)$(conex(i,j))=-branch(i,j,'limit') ;



equations
obj              objective function
powerflow(i,j,t,s)        powerflow
kcl              kcl in each node
;

obj.. z=e=sum((t,s),prob(s)*lambdaDA(t,s)*PG('1',t,s));
powerflow(i,j,t,s)$conex(i,j)..   PF(i,j,t,s)=e=(delta(i,t,s)-delta(j,t,s))*branch(i,j,'bij');
kcl(i,t,s).. sum(g$GB(i ,g),Pg(g,t,s))-PD(i,t,s)=e=+sum(j$conex(i, j),PF(i,j,t,s));

model DCPF /all/
solve DCPF minimizing z using lp

parameter sumpg(t,s), sumpd(t,s)   ;
sumpg(t,s)= sum(g,PG.l(g,t,s));
sumpd(t,s)= sum(i,Pd(i,t,s)) ;

display sumpg , sumpd;


