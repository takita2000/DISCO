sets
i bus numbers  /1*33/
slack(i) slack bus /1/
pq(i) pq buses    /2*33/
g(i) index of generators /1, 4 , 14/
t time period   /t0*t24/
s scenarios    /1*4/
gg(g) pq bus with generators /4, 14/
bb(i) pq bus with generators /10, 17, 20, 30/
ww(i) pq bus with wind generation /33, 18, 21/
pv(i) pq bus with pv generation   /10, 24, 27/
IL(i) pq bus with IL capability   /2*33/
pheads heads of generators /pmin,  pmax,   rdown,  rup /
GB(i,g)  /1.1, 4.4 , 14.14/
BatB(i,bb) /10.10, 17.17, 20.20, 30.30/
WB(i,ww) / 18.18, 21.21, 33.33 /
PVB(i,pv)/ 10.10, 24.24, 27.27   /
ILB(i,IL) /2.2,3.3,4.4,5.5,6.6,7.7,8.8,9.9,10.10,11.11,12.12,13.13,14.14,15.15,
16.16,17.17,18.18,19.19,20.20,21.21,22.22,23.23,24.24,25.25,26.26,27.27,28.28,
29.29,30.30,31.31,32.32,33.33/
display ILB
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
** Phase 6 **************************************
table bdat(bb,*) battery  data
       EtaCh  EtaDch   PchMAX   PdchMAX   SoC0      SoCMax    SoCMin
10     0.95   0.95     50       50        0.15      0.95      0.05
17     0.95   0.95     50       50        0.15      0.95      0.05
20     0.95   0.95     50       50        0.15      0.95      0.05
30     0.95   0.95     50       50        0.15      0.95      0.05
*************************************************

*** PHASE 7 *************************************
Table PW(ww,t,s) wind power generation
                      1             2             3             4
 (18,21,33).t1        000.00        000.00        000.00        000.00
 (18,21,33).t2        000.02        000.02        000.02        000.02
 (18,21,33).t3        014.67        014.67        014.67        014.67
 (18,21,33).t4        166.00        166.00        166.00        166.00
 (18,21,33).t5        016.44        016.44        016.44        016.44
 (18,21,33).t6        007.08        007.08        007.08        007.08
 (18,21,33).t7        166.00        166.00        166.00        166.00
 (18,21,33).t8        000.00        000.00        000.00        000.00
 (18,21,33).t9        043.88        043.88        043.88        043.88
(18,21,33).t10        048.42        048.42        048.42        048.42
(18,21,33).t11        022.89        022.89        022.89        022.89
(18,21,33).t12        027.96        027.96        027.96        027.96
(18,21,33).t13        069.62        069.62        069.62        069.62
(18,21,33).t14        036.43        036.43        036.43        036.43
(18,21,33).t15        026.18        026.18        026.18        026.18
(18,21,33).t16        001.58        001.58        001.58        001.58
(18,21,33).t17        024.01        024.01        024.01        024.01
(18,21,33).t18        004.97        004.97        004.97        004.97
(18,21,33).t19        166.00        166.00        166.00        166.00
(18,21,33).t20        085.46        085.46        085.46        085.46
(18,21,33).t21        000.01        000.01        000.01        000.01
(18,21,33).t22        166.00        166.00        166.00        166.00
(18,21,33).t23        166.00        166.00        166.00        166.00
(18,21,33).t24        000.66        000.66        000.66        000.66


Table PPV(pv,t,s) wind power generation
                      1             2             3             4
 (10,24,27).t1        000.00        000.00        000.00        000.00
 (10,24,27).t2        000.00        000.00        000.00        000.00
 (10,24,27).t3        000.00        000.00        000.00        000.00
 (10,24,27).t4        000.00        000.00        000.00        000.00
 (10,24,27).t5        000.00        000.00        000.00        000.00
 (10,24,27).t6        000.00        000.00        000.00        000.00
 (10,24,27).t7        000.00        000.00        007.42        000.00
 (10,24,27).t8        001.73        005.95        003.71        001.73
 (10,24,27).t9        050.60        052.01        013.51        050.60
(10,24,27).t10        060.12        051.28        064.13        060.12
(10,24,27).t11        115.74        110.72        045.41        115.74
(10,24,27).t12        163.48        088.09        086.80        163.48
(10,24,27).t13        146.21        077.34        053.23        146.21
(10,24,27).t14        021.20        075.94        004.09        021.20
(10,24,27).t15        128.57        071.41        020.03        128.57
(10,24,27).t16        000.00        000.00        000.00        000.00
(10,24,27).t17        000.00        000.00        000.00        000.00
(10,24,27).t18        000.00        000.03        000.00        000.00
(10,24,27).t19        000.00        000.00        000.00        000.00
(10,24,27).t20        000.00        000.00        000.00        000.00
(10,24,27).t21        000.00        000.00        000.00        000.00
(10,24,27).t22        000.00        000.00        000.00        000.00
(10,24,27).t23        000.00        000.00        000.00        000.00
(10,24,27).t24        000.00        000.00        000.00        000.00

*************************************************

variable
zz        objective value
delta(i,t,s) angle of each bus
PF(i,j,t,s)  Active power flowing from bus i to bus j
P(i)     Net active power of each bus
*****Phase 2***********************************************
PG(g,t,s)    Active power generated from each bus


** Phase 6 **************************************
SoC(bb,t,s)    state of charge of batteries
Pdch(bb,t,s)   discharge power of batteries
Pch(bb,t,s)    charge power of batteries
PESS(bb,t,s)   power exchange of the battery
x(bb,t,s)      binary variable if 1 charge if 0 discharge

*************************************************
**********************************************************



***PH 3****************************************************
PDAIL(t,s)  sum of active power curtilement
PIL(IL,t,s)   active power curtilement in each load bus
;

binary variables v(gg,t,s)  ,y(gg,t,s),z(gg,t,s);
positive variable PDA(t,s),PIL(IL,t,s),Pdch(bb,t,s), Pch(bb,t,s)  , SoC(bb,t,s);

PG.up(gg,t,s)=gdat(gg,'pmax');
PG.lo(gg,t,s)=gdat(gg,'pmin');
delta.fx(slack,t,s)=0;
PF.up(i,j,t,s)$(conex(i,j))=branch(i,j,'limit') ;
PF.lo(i,j,t,s)$(conex(i,j))=-branch(i,j,'limit') ;
*** PHase2*************************
PG.fx(g,'t0',s)=0;
v.fx(gg,'t0',s)=0;
SoC.fx(bb,'t24',s)=bdat(bb,'SOC0');
Soc.lo(bb,t,s)=bdat(bb,'SOCMIN');
PESS.fx(bb,'t0',s)=0;
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
eq7
*eq15
eq16
*****************************************

** Phase 6 **************************************
eq41
eq41_1
eq42
eq43
eq44
eq47
*************************************************
;

obj.. zz=e=sum((t,s),prob(s)*lambdaDA(t,s)*PG('1',t,s))
+sum((t,gg,s),prob(s)*(gdat(gg,'a')*v(gg,t,s)+gdat(gg,'b')*y(gg,t,s)+gdat(gg,'c')*z(gg,t,s)+gdat(gg,'d')*PG(gg,t,s)))
+sum((t,s),BetaIL(t)*PDAIL(t,s))   ;
powerflow(i,j,t,s)$conex(i,j)..   PF(i,j,t,s)=e=(delta(i,t,s)-delta(j,t,s))*branch(i,j,'bij');
kcl(i,t,s).. sum(g$GB(i ,g),Pg(g,t,s))+sum(ww$WB(i ,ww),PW(ww,t,s))+sum(pv$PVB(i ,pv),PPV(pv,t,s))
+sum(bb$BatB(i,bb),PESS(bb,t,s))+sum(IL$ILB(i ,IL),PIL(IL,t,s))-PD(i,t,s)=e=+sum(j$conex(i, j),PF(i,j,t,s));

********PHase 2*************************************************
eq8_1(gg,t,s)$(ord(t) gt 1)..  PG(gg,t,s)=l=gdat(gg,'pmax')*v(gg,t,s) ;
eq8_2(gg,t,s)$(ord(t) gt 1)..  PG(Gg,t,s)=g=gdat(gg,'pmin')*v(gg,t,s) ;
eq9(gg,t,s)$(ord(t) gt 1).. PG(gg,t,s)-PG(gg,t-1,s)=l=gdat(gg,'rup');
eq10(gg,t,s)$(ord(t) gt 1)..     PG(gg,t-1,s)-PG(gg,t,s)=l=gdat(gg,'rdown');
eq14(gg,t,s)$(ord(t) gt 1)..     y(gg,t,s)-z(gg,t,s)=e=v(gg,t,s)-v(gg,t-1,s);
*********************************************************************

*** PH3*************************************************************
** Phase 4 **************************************
eq7(pq,t,s)..  PD(pq,t,s)-sum(IL$ILB(pq ,IL),PIL(IL,t,s))-sum(gg$GB(pq ,gg),Pg(gg,t,s)) =l= TrMAX(pq);
*eq15(pq,t,s).. PIL(IL,t,s) =l= 0.1*PD(pq,t,s);
eq16(t,s).. sum(IL,PIL(IL,t,s))=e=PDAIL(t,s);
*************************************************


** Phase 6 **************************************
eq41(bb,t,s)$(ord(t) gt 1)..  SoC(bb,t,s)  =e= SoC(bb,t-1,s)-Pdch(bb,t,s)/(300*bdat(bb,'EtadCh'))+(Pch(bb,t,s)/300)*bdat(bb,'EtaCh');
eq41_1(bb,t,s)$(ord(t) eq 1)..  SoC(bb,t,s)  =e= bdat(bb,'SoC0') -Pdch(bb,t,s)/300+Pch(bb,t,s)/300;
eq42(bb,t,s)..                PESS(bb,t,s) =e= Pdch(bb,t,s)-Pch(bb,t,s);
eq43(bb,t,s)..                Pch(bb,t,s)  =l= x(bb,t,s)*bdat(bb,'PchMAX');
eq44(bb,t,s)..                Pdch(bb,t,s) =l= (1-x(bb,t,s))*bdat(bb,'PdchMAX');
eq47(bb,t,s)..                SoC(bb,t,s)=l=bdat(bb,'SoCMAX');
*************************************************

********************************************************************
option optca=0;
option optcr=0;
model DCPF /all/
solve DCPF minimizing zz using mip


parameter SUMDemand(t);
SUMDemand(t)=sum(s,prob(s)*PDtotal(t,s));

parameter SUMDA;
SUMDA(t)=sum(s,prob(s)*PG.l('1',t,s));

parameter SUMPG(t);
SUMPG(t)=sum((gg,s),prob(s)*PG.l(gg,t,s));

parameter SUMPESS(t);
SUMPESS(t)=sum((bb,s),prob(s)*PESS.l(bb,t,s));

parameter SUMIL;
SUMIL(t)=sum(s,prob(s)*PDAIL.l(t,s));

parameter DACOST(t);
DACOST(t)=sum(s, prob(s)*lambdaDA(t,s)*PG.l('1',t,s)) ;

parameter PREDGCOST(t);
PREDGCOST(t)=sum((gg,s),prob(s)*(gdat(gg,'a')*v.l(gg,t,s)+gdat(gg,'b')*y.l(gg,t,s)+gdat(gg,'c')*z.l(gg,t,s))) ;

parameter ILCOST(t);
ILCOST(t)=sum(s,prob(s)*PDAIL.l(t,s)*BetaIL(t)) ;

parameter TCOST;
TCOST(t)=DACOST(t)+ ILCOST(t)+ PREDGCOST(t);

parameter PDGG(gg,t);
PDGG(gg,t)=sum(s,prob(s)*PG.l(gg,t,s));

parameter PESSS(bb,t);
PESSS(bb,t)=sum(s,prob(s)*PESS.l(bb,t,s));

display SUMDEMAND, SUMDA, SUMPG, SUMPESS, SUMIL, pf.l ,PD ,lambdaDA  , TCOST, DACOST , PREDGCOST ,ILCOST


$set matout "'GAMS_SOLVE_SC1_Results_DAM.gdx' SUMDEMAND, SUMDA, SUMPG,SUMPESS, SUMIL, pf ,PD ,lambdaDA  , TCOST, DACOST , PREDGCOST ,ILCOST, PDGG, PESSS, v  ";
execute_unload %matout%;


