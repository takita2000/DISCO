sets
i bus numbers  /1*3/
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
LineData(j,i,*)=LineData(i,j,*)

parameter con(i,j)       conectivity of two buses
/
1.2 yes
1.3 yes
2.3 yes
2.1 yes
3.1 yes
3.2 yes
/;


variable
z        objective value
delta(i) angle of each bus
PF(i,j)  Active power flowing from bus i to bus j
P(i)     Net active power of each bus
PG(i)    Active power generated from each bus
;
PG.fx('2')=2;
PG.fx('3')=0;
delta.fx('1')=0;
equations
obj              objective function
powerflow        powerflow
kcl              kcl in each node
Netpower         Net power in each node
;


obj.. z=e=1;
powerflow(i,j)$(ord(i) ne  ord(j))..   PF(i,j)=e=(delta(i)-delta(j))/ LineData(i,j,'react')   ;
kcl(i).. P(i)=e=sum(j$con(i,j),pF(i,j))  ;
Netpower(i).. P(i)=e=PG(i)-PD(i);


model DCPF /all/
solve DCPF maximizing z using lp






