sets
i bus numbers  /1*3/
g(i) index of generators  /3/
pheads heads of generators /pmin,  pmax,   rdown,  rup /

alias (i,j)


parameter PD(i) Demand of each bus
/
1 0
2 3.4
3 1.9

/

Table LineData(i,j,*)     Data of each line
                 react
1.2              0.1
1.3              0.2
2.3              0.3

;
LineData(i,j,'react')$(ord(i)>ord(j))=LineData(j,i,'react');

parameter con(i,j)       conectivity of two buses
/
1.2 yes
1.3 yes
2.3 yes
/;
con(i,j)$(ord(i)>ord(j))=con(j,i);


* PHASE 2 ***********************************************
table gdat(g,*) unit data
       pmin  pmax   rdown  rup    a      b         c      d       PG0   V0    MUP   MDN
3      1     8      2      2      1      25        10     80      0     0     1     1

variable
z        objective value
delta(i) angle of each bus
PF(i,j)  Active power flowing from bus i to bus j
P(i)     Net active power of each bus
PG(i)    Active power generated from each bus
;
PG.fx('2')=2;
*PG.fx('3')=0;
PG.up(g)=gdat(g,'pmax');
PG.lo(g)=gdat(g,'pmin');
delta.fx('1')=0;
equations
obj              objective function
powerflow        powerflow
kcl              kcl in each node
Netpower         Net power in each node
;


obj.. z=e=100*PG('1')+20*PG('1')+10000*PG('3');
powerflow(i,j)$(ord(i) ne  ord(j))..   PF(i,j)=e=(delta(i)-delta(j))/ LineData(i,j,'react')   ;
kcl(i).. P(i)=e=sum(j$con(i,j),pF(i,j))  ;
Netpower(i).. P(i)=e=PG(i)-PD(i);


model DCPF /all/
solve DCPF minimizing z using lp





parameter sumpg, sumpd   ;
sumpg= sum(i,PG.l(i));

sumpd= sum(i,Pd(i)) ;


display sumpg , sumpd;

