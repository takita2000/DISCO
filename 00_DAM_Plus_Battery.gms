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
;

PDTotal(t,s)=PDTotal(t,s)*1000;
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
4      100    500          200    200    1      25        10     10      0     0     1     1
14     100    500          200    200    1      25        10     40      0     0     1     1

;

*gdat(gg,pheads)=(gdat(gg,pheads))/1000/ Sbase;


*********************************************************

*** PHase 3 *********************************************
parameter BetaIL(t)
/
t1  60
t2  60
t3  60
t4  60
t5  60
t6  60
t7  60
t8  60
t9  60
t10 60
t11 60
t12 60
t13 60
t14 60
t15 60
t16 60
t17 60
t18 60
t19 60
t20 60
t21 60
t22 60
t23 60
t24 60
/

parameter TrMAX(pq)
/

2        500
3        500
4        500
5        500
6        500
7        500
8        500
9        500
10        500
11        500
12        500
13        500
14        500
15        500
16        500
17        500
18        500
19        500
20        500
21        500
22        500
23        500
24        500
25        500
26        500
27        500
28        500
29        500
30        500
31        500
32        500
33        500
/

*********************************************************


variable
zz        objective value
delta(i,t,s) angle of each bus
PF(i,j,t,s)  Active power flowing from bus i to bus j
P(i)     Net active power of each bus
*****Phase 2***********************************************
PG(g,t,s)    Active power generated from each bus


**********************************************************

***PH 3****************************************************
PDAIL(t,s)  sum of active power curtilement
PIL(pq,t,s)   active power curtilement in each load bus
;

*PG.up(gg,t,s)=gdat(gg,'pmax');
*PG.lo(gg,t,s)=gdat(gg,'pmin');
delta.fx(slack,t,s)=0;

binary variables v(gg,t,s)  ,y(gg,t,s),z(gg,t,s);
PF.up(i,j,t,s)$(conex(i,j))=branch(i,j,'limit') ;
PF.lo(i,j,t,s)$(conex(i,j))=-branch(i,j,'limit') ;
*** PHase2*************************
PG.fx(g,'t0',s)=0;
v.fx(gg,'t0',s)=0;
***********************************




;

equations
obj              objective function
powerflow(i,j,t,s)        powerflow
kcl              kcl in each node

*** Phase 2 *****************************
eq8_1
eq8_2
eq9
eq10
eq14
*****************************************

*** PH3 ADDING  INTERRUPTIBLE ***********
*eq7
*eq15
*eq16
*****************************************
;

obj.. zz=e=sum((t,s),prob(s)*lambdaDA(t,s)*PG('1',t,s))
+sum((t,gg,s),prob(s)*(gdat(gg,'a')*v(gg,t,s)+gdat(gg,'b')*y(gg,t,s)+gdat(gg,'c')*z(gg,t,s)+gdat(gg,'d')*PG(gg,t,s)))   ;
*+sum((t,s),BetaIL(t)*PDAIL(t,s))   ;
powerflow(i,j,t,s)$conex(i,j)..   PF(i,j,t,s)=e=(delta(i,t,s)-delta(j,t,s))*branch(i,j,'bij');
kcl(i,t,s).. sum(g$GB(i ,g),Pg(g,t,s))-PD(i,t,s)=e=+sum(j$conex(i, j),PF(i,j,t,s));

********PHase 2*************************************************
eq8_1(gg,t,s)$(ord(t) gt 1)..  PG(gg,t,s)=l=gdat(gg,'pmax')*v(gg,t,s) ;
eq8_2(gg,t,s)$(ord(t) gt 1)..  PG(Gg,t,s)=g=gdat(gg,'pmin')*v(gg,t,s) ;
eq9(gg,t,s)$(ord(t) gt 1).. PG(gg,t,s)-PG(gg,t-1,s)=l=gdat(gg,'rup');
eq10(gg,t,s)$(ord(t) gt 1)..     PG(gg,t-1,s)-PG(gg,t,s)=l=gdat(gg,'rdown');
eq14(gg,t,s)$(ord(t) gt 1)..     y(gg,t,s)-z(gg,t,s)=e=v(gg,t,s)-v(gg,t-1,s);
*********************************************************************

*** PH3*************************************************************
** Phase 4 **************************************
*eq7(pq,t,s)..  PD(pq,t,s)-sum(gg$GB(pq ,gg),Pg(gg,t,s)) =l= TrMAX(pq);
*eq15(pq,t,s).. PIL(pq,t,s) =l= 0.1*PD(pq,t,s);
*eq16(t,s).. sum(pq,PIL(pq,t,s))=e=PDAIL(t,s);
*************************************************



********************************************************************
option optcr=0
model DCPF /all/
solve DCPF minimizing zz using mip

parameter sumpg(t,s), sumpd(t,s)   ;
sumpg(t,s)= sum(g,PG.l(g,t,s));
sumpd(t,s)= sum(i,Pd(i,t,s)) ;

display sumpg , sumpd;

