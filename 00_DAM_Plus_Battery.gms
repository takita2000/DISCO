sets
i bus numbers  /1*3/
g(i) index of generators  /1*2/
pheads heads of generators /pmin,  pmax,   rdown,  rup /
GB(i,g)  /1.1 ,2.2/
alias (i,j)


parameter PD(i) Demand of each bus
/
1 0
2 3.4
3 1.9
/

table branch(i,j,*) Network technical characteristics
                 x        limit
1.2              0.1      10
1.3              0.2      10
2.3              0.3      10
;

branch(i , j , 'x' )$(branch(i,j,'x')=0)=branch(j,i,'x');
branch(i,j,'Limit')$(branch(i,j,'Limit')=0)=branch(j, i , 'Limit') ;
branch (i,j ,'bij')$branch (i, j ,'Limit') =1/ branch ( i ,j , 'x' ) ;


parameter conex   ;
conex (i,j)$(branch(i,j,'limit') and branch(j,i,'limit'))=1;
conex (i,j)$(conex(i,j))=1;

display conex
* PHASE 2 ***********************************************
table gdat(g,*) unit data
       pmin  pmax   rdown  rup    a      b         c      d       PG0   V0    MUP   MDN
2      1     8      2      2      1      25        10     80      0     0     1     1
;


variable
z        objective value
delta(i) angle of each bus
PF(i,j)  Active power flowing from bus i to bus j
P(i)     Net active power of each bus
PG(g)    Active power generated from each bus
;
PG.up('2')=2;
PG.lo('2')=0;
delta.fx('1')=0;
equations
obj              objective function
powerflow        powerflow
kcl              kcl in each node

;


obj.. z=e=100*PG('1')+20000*PG('2');
powerflow(i,j)$conex(i,j)..   PF(i,j)=e=(delta(i)-delta(j))*branch(i,j,'bij');
kcl(i).. sum(g$GB(i ,g),Pg(g))-PD(i)=e=+sum(j$conex(i, j),PF(i,j));



model DCPF /all/
solve DCPF minimizing z using lp





