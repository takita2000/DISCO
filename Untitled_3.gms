 OPTION LIMROW = 30 ;

set
** Phase 1 ************************************
i bus numbers  /1*33/
s scenarios    /1*4/
slack(i) slack bus /1/
load(i) load buses /2*33/
t time period   /t0*t24/
l backwardshift for DGs /1, 2 ,3/
g(i) index of generators  /4, 14/
pv(i) photovoltaic /10, 24, 27/
w(i) wind generation /33, 18, 21/
b(i) index of batteries  /10,17,20,30/
head1 line data        /Ft, react, resis , pfmax/
alias(i,j)
***********************************************


* PARAMETERS************************************
Scalar SBase System base in MVA / 10 /;
Scalar VBase System base voltage in kV /12.66/;
** Phase 1 **************************************
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

scalar PMaxSub /6/



*************************************************
** Phase 2 **************************************
Table LineData(i,j,head1)
           FT        react         Pfmax
1.2         1        0.0477        10
2.3         1        0.2511        10
3.4         1        0.1864        10
4.5         1        0.1941        10
5.6         1        0.707         10
6.7         1        0.6188        10
7.8         1        0.2351        10
8.9         1        0.74          10
9.10        1        0.74          10
10.11       1        0.065         10
11.12       1        0.1238        10
12.13       1        1.155         10
13.14       1        0.7129        10
14.15       1        0.526         10
15.16       1        0.545         10
16.17       1        1.721         10
17.18       1        0.574         10
2.19        1        0.1565        10
19.20       1        1.3554        10
20.21       1        0.4784        10
21.22       1        0.9373        10
3.23        1        0.3083        10
23.24       1        0.7091        10
24.25       1        0.7011        10
6.26        1        0.1034        10
26.27       1        0.1447        10
27.28       1        0.9337        10
28.29       1        0.7006        10
29.30       1        0.2585        10
30.31       1        0.963         10
31.32       1        0.3619        10
32.33       1        0.5302        10
Parameter R(i,j,head1);
R(i,j,"react") = Linedata(i,j,"react")*SBase/(VBase*VBase) ;
R(j,i,"react")$(R(i,j,"react") gt 0) = R(i,j,"react") ;

R(i,j,"ft")= LineData(i,j,"FT");
R(j,i,"ft")$(R(i,j,"ft") gt 0) = R(i,j,"ft") ;

R(i,j,"pfmax")= LineData(i,j,"pfmax");
R(j,i,"pfmax")$(R(i,j,"pfmax") gt 0) = R(i,j,"pfmax") ;

Parameter Pdem0(i)
*-----Active power demand data here--------------;
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
10        60
11        45
12        60
13        60
14        120
15        60
16        60
17        60
18        90
19        90
20        90
21        90
22        90
23        90
24        420
25        420
26        60
27        60
28        60
29        120
30        200
31        150
32        210
33        60
/
Parameter Qdem0(i)
*-----Reactive power demand data here------------;
/
1        0
2        60
3        40
4        80
5        30
6        20
7        100
8        100
9        20
10        20
11        30
12        35
13        35
14        80
15        10
16        20
17        20
18        40
19        40
20        40
21        40
22        40
23        50
24        200
25        200
26        25
27        25
28        20
29        70
30        60
31        70
32        100
33        40

/
Parameter Pdem1(i), QDem1(i), TPdem, LW(i), PD(i,t,s);
Pdem1(i)= Pdem0(i)/(1000*SBase);
Qdem1(i)= Qdem0(i)/(1000*SBase);
TPdem = sum(i, Pdem1(i));
LW(i)= Pdem1(i)/TPdem;
PD(i,t,s)=LW(i)*PDtotal(t,s);



*************************************************

** Phase 3 **************************************

table gdat(g,*) unit data
       pmin  pmax   rdown  rup    a      b         c      d       PG0   V0    MUP   MDN
4      0.1   0.8    0.2    0.2    1      25        10     80      0     0     1     1
14     0.1   0.8    0.2    0.2    1      25        10     80      0     0     1     1

;
parameter GI(i)
/
22    1
25    1
/
*************************************************

** Phase 4 **************************************
BetaIL(t)
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
TrMAX(load)
/

2        2
3        2
4        2
5        2
6        2
7        2
8        2
9        2
10        2
11        2
12        2
13        2
14        2
15        2
16        2
17        2
18        2
19        2
20        2
21        2
22        2
23        2
24        2
25        2
26        2
27        2
28        2
29        2
30        2
31        2
32        2
33        2
/
*************************************************

** Phase 5 **************************************
parameter prob(s)
/
1  0.25
2  0.25
3  0.25
4  0.25


/
*************************************************

** Phase 6 **************************************
table bdat(b,*) battery  data
       EtaCh  EtaDch   PchMAX   PdchMAX   SoC0      SoCMax    SoCMin
10     0.95   0.95     0.1      0.1       0.15      0.95      0.05
17     0.95   0.95     0.1      0.1       0.15      0.95      0.05
20     0.95   0.95     0.1      0.1       0.15      0.95      0.05
30     0.95   0.95     0.1      0.1       0.15      0.95      0.05
parameter BI(i)
/
10    1
17    1
30    1
/
*************************************************

** Phase 6 **************************************
Table PW(w,t,s) wind power generation
                       1             2             3             4
(18,21,33).t1          0             0             0             0
(18,21,33).t2         0.02           0.02          0.02          0.02
(18,21,33).t3         14.67          14.67         14.67         14.67
(18,21,33).t4         166            166           166           166
(18,21,33).t5         16.44          16.44         16.44         16.44
(18,21,33).t6         7.08           7.08          7.08          7.08
(18,21,33).t7         166            166           166           166
(18,21,33).t8         0              0             0             0
(18,21,33).t9         43.88          43.88         43.88         43.88
(18,21,33).t10        48.42          48.42         48.42         48.42
(18,21,33).t11        22.89          22.89         22.89         22.89
(18,21,33).t12        27.96          27.96         27.96         27.96
(18,21,33).t13        69.62          69.62         69.62         69.62
(18,21,33).t14        36.43          36.43         36.43         36.43
(18,21,33).t15        26.18          26.18         26.18         26.18
(18,21,33).t16        1.58           1.58          1.58          1.58
(18,21,33).t17        24.01          24.01         24.01         24.01
(18,21,33).t18        4.97           4.97          4.97          4.97
(18,21,33).t19        166            166           166           166
(18,21,33).t20        85.46          85.46         85.46         85.46
(18,21,33).t21        0.01           0.01          0.01          0.01
(18,21,33).t22        166            166           166           166
(18,21,33).t23        166            166           166           166
(18,21,33).t24        0.66           0.66          0.66          0.66

Table PPV(pv,t,s) wind power generation
                     1        2        3        4
(10,24,27).t1        0        0        0        0
(10,24,27).t2        0        0        0        0
(10,24,27).t3        0        0        0        0
(10,24,27).t4        0        0        0        0
(10,24,27).t5        0        0        0        0
(10,24,27).t6        0        0        0        0
(10,24,27).t7        0        0        7.42     0
(10,24,27).t8        1.73     5.95     3.71     1.73
(10,24,27).t9        50.6     52.01    13.51    50.6
(10,24,27).t10       60.12    51.28    64.13    60.12
(10,24,27).t11       115.74   110.72   45.41    115.74
(10,24,27).t12       163.48   88.09    86.8     163.48
(10,24,27).t13       146.21   77.34    53.23    146.21
(10,24,27).t14       21.2     75.94    4.09     21.2
(10,24,27).t15       128.57   71.41    20.03    128.57
(10,24,27).t16       0        0        0        0
(10,24,27).t17       0        0        0        0
(10,24,27).t18       0        0.03     0        0
(10,24,27).t19       0        0        0        0
(10,24,27).t20       0        0        0        0
(10,24,27).t21       0        0        0        0
(10,24,27).t22       0        0        0        0
(10,24,27).t23       0        0        0        0
(10,24,27).t24       0        0        0        0

*************************************************
variables
**  Phase 1 *************************************
zz objective value
PDA(t,s) active power purchase from Day ahead market

*************************************************

** Phase 2 **************************************
Pf(i,j,t,s)   power from line i to line j
delta(i,t,s)  angle of bus voltages
*************************************************

** Phase 3 **************************************
PDG(g,t,s)   active power generation of DG units
v(g,t,s) this variable is 1 if unit g is on in hour t
y(g,t,s)     binary variable 1 if turn on 0 OW
z(g,t,s)     binary variable 1 if turn off 0 OW
*************************************************
*************************************************

** Phase 4 **************************************
PDAIL(t,s)  sum of active power curtilement
PIL(load,t,s)   active power curtilement in each load bus
*************************************************

** Phase 5 **************************************

*************************************************

** Phase 6 **************************************
SoC(b,t,s)    state of charge of batteries
Pdch(b,t,s)   discharge power of batteries
Pch(b,t,s)    charge power of batteries
PESS(b,t,s)   power exchange of the battery
x(b,t,s)      binary variable if 1 charge if 0 discharge

*************************************************


positive variable PDA(t,s),PIL(load,t,s),Pdch(b,t,s), Pch(b,t,s)  , SoC(b,t,s)
binary variables v(g,t,s), y(g,t,s), z(g,t,s) ,x(b,t,s)
;
v.fx(g,'t0',s)=0;
PDG.fx(g,'t0',s)=0;
SoC.fx(b,'t24',s)=bdat(b,'SOC0');
Soc.lo(b,t,s)=bdat(b,'SOCMIN');
PESS.fx(b,'t0',s)=0;
equations
**  Phase 1 *************************************
eq1
eq6
**************************************************
** Phase 2 **************************************
eq2
eq3_1
eq3_2
eq4_00
eq4
eq5
*************************************************

** Phase 3 **************************************
eq8_1
eq8_2
eq14
eq9
eq10
*************************************************

** Phase 4 **************************************
eq7
eq15
eq16
*************************************************

** Phase 6 **************************************
eq41
eq41_1
eq42
eq43
eq44
eq47
*************************************************

;
**  Phase 1 *************************************
eq1.. zz =e= sum((t,s),prob(s)*lambdaDA(t,s)*PDA(t,s))
+sum((t,g,s),prob(s)*(gdat(g,'a')*v(g,t,s)+gdat(g,'b')*y(g,t,s)+gdat(g,'c')*z(g,t,s)+gdat(g,'d')*PDG(g,t,s)))
+sum((t,s),BetaIL(t)*PDAIL(t,s));
eq6(t,s).. PDA(t,s) =l=PMaxSub;

**************************************************

** Phase 2 **************************************
eq2(t,i,j,s)$R(i,j,'Ft')..  Pf(i,j,t,s) =e=(1/R(i,j,'react'))*(delta(i,t,s)-delta(j,t,s));
eq3_1(t,i,j,s)$R(i,j,'Ft')..    Pf(i,j,t,s) =g= -R(i,j,"pfmax") ;
eq3_2(t,i,j,s)$R(i,j,'Ft')..    Pf(i,j,t,s) =l= R(i,j,"pfmax");
eq4_00(t,i,j,s)..             pf(i,j,t,s)=e= -pf(j,i,t,s);
eq4(t,load,s)..             sum(g,PDG(g,t,s))$GI(load)+sum(b,PESS(b,t,s))$BI(load)+PIL(load,t,s)-sum(j$R(load,j,'Ft'),pf(load,j,t,s)) =e= PD(load,t,s);
eq5(t,slack,s)..            PDA(t,s)-sum(j$R(slack,j,'Ft'),pf(slack,j,t,s)) =e=0;
*************************************************

** Phase 3 **************************************

eq8_1(g,t,s)$(ord(t) gt 1)..  PDG(g,t,s)=l=gdat(g,'pmax')*v(g,t,s) ;
eq8_2(g,t,s)$(ord(t) gt 1)..  PDG(g,t,s)=g=gdat(g,'pmin')*v(g,t,s) ;
eq9(g,t,s)$(ord(t) gt 1).. PDG(g,t,s)-PDG(g,t-1,s)=l=gdat(g,'rup');
eq10(g,t,s)$(ord(t) gt 1)..     PDG(g,t-1,s)-PDG(g,t,s)=l=gdat(g,'rdown');
eq14(g,t,s)$(ord(t) gt 1)..     y(g,t,s)-z(g,t,s)=e=v(g,t,s)-v(g,t-1,s);

*************************************************

** Phase 4 **************************************
eq7(load,t,s)..  PD(load,t,s)-sum(g,PDG(g,t,s))$GI(load)-sum(b,PESS(b,t,s))$BI(load)-PIL(load,t,s) =l= TrMAX(load);
eq15(load,t,s).. PIL(load,t,s) =l= 0.1*PD(load,t,s);
eq16(t,s).. sum(load,PIL(load,t,s))=e=PDAIL(t,s);
*************************************************

** Phase 6 **************************************
eq41(b,t,s)$(ord(t) gt 1)..  SoC(b,t,s)  =e= SoC(b,t-1,s)-Pdch(b,t,s)/bdat(b,'EtadCh')+Pch(b,t,s)*bdat(b,'EtaCh');
eq41_1(b,t,s)$(ord(t) eq 1)..  SoC(b,t,s)  =e= bdat(b,'SoC0') -Pdch(b,t,s)+Pch(b,t,s);
eq42(b,t,s)..                PESS(b,t,s) =e= Pdch(b,t,s)-Pch(b,t,s);
eq43(b,t,s)..                Pch(b,t,s)  =l= x(b,t,s)*bdat(b,'PchMAX');
eq44(b,t,s)..                Pdch(b,t,s) =l= (1-x(b,t,s))*bdat(b,'PdchMAX');
eq47(b,t,s)..                SoC(b,t,s)=l=bdat(b,'SoCMAX');
*************************************************

option optca=0;
option optcr=0;

model DAOM  /all/
solve DAOM using mip minimizing zz



parameter SUMDemand(t);
SUMDemand(t)=sum(s,prob(s)*PDtotal(t,s));

parameter SUMDA;
SUMDA(t)=sum(s,prob(s)*PDA.l(t,s));

parameter SUMPG(t);
SUMPG(t)=sum((g,s),prob(s)*PDG.l(g,t,s));

parameter SUMPESS(t);
SUMPESS(t)=sum((b,s),prob(s)*PESS.l(b,t,s));

parameter SUMIL;
SUMIL(t)=sum(s,prob(s)*PDAIL.l(t,s));

parameter DACOST(t);
DACOST(t)=sum(s, prob(s)*lambdaDA(t,s)*PDA.l(t,s)) ;

parameter PREDGCOST(t);
PREDGCOST(t)=sum((g,s),prob(s)*(gdat(g,'a')*v.l(g,t,s)+gdat(g,'b')*y.l(g,t,s)+gdat(g,'c')*z.l(g,t,s))) ;

parameter ILCOST(t);
ILCOST(t)=sum(s,prob(s)*PDAIL.l(t,s)*BetaIL(t)) ;

parameter TCOST;
TCOST(t)=DACOST(t)+ ILCOST(t)+ PREDGCOST(t);

parameter PDGG(g,t);
PDGG(g,t)=sum(s,prob(s)*PDG.l(g,t,s));

parameter PESSS(b,t);
PESSS(b,t)=sum(s,prob(s)*PESS.l(b,t,s));

display SUMDEMAND, SUMDA, SUMPG, SUMPESS, SUMIL, pf.l ,PD ,lambdaDA  , TCOST, DACOST , PREDGCOST ,ILCOST


$set matout "'GAMS_SOLVE_SC1_Results_DAM.gdx' SUMDEMAND, SUMDA, SUMPG,SUMPESS, SUMIL, pf ,PD ,lambdaDA  , TCOST, DACOST , PREDGCOST ,ILCOST, PDGG, PESSS, v  ";
execute_unload %matout%;