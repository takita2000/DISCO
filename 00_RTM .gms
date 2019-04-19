option limrow=30;

sets
i bus number /i1*i33/
load(i) PQ busese in the grid /i2*i33/
slack(i) substation bus   /i1/
l levels of IL contracts /1*5/
g        index of DG units /g18, g22 , g33/
b        index of DG units /b25/
g2i(g,i) units to nodes /g18.i18, g22.i22, g33.i33/
b2i(b,i) units to nodes /b25.i25/;
alias(i,j)

** PARAMETERS *******************************************************************************************
Scalar SBase System base in MVA / 10 /;
Scalar VBase System base voltage in kV /12.66/;
**PASE 1****************************************************
Parameter
LambdaRT  price in treal time market
LambdaQRT reactive power price in RT Market /1/
PDA_STAR  Purchased Day_Ahead active power from DAY ahead optimization Level
PDTotal   Real time Demand
PK1    previous state of DG Units
PILDA_STAR Interupted load factor
v_star(g) state of DG Unit if on 1 OW 0
PESS_STAR(b) amaunt of charge or decharge of battery
;




$GDXIN MATLAB_TO_RTOM
$LOAD  PDA_STAR PDTotal LambdaRT PK1 PILDA_STAR  v_star   PESS_STAR
$GDXIN



Table LDat(i,j,*)
              FT               cap           yl                  thel
i1.i2         1                10            1551.693579         2.669617687
i2.i3         1                10            290.2394355         2.67041663
i3.i4         1                10            390.9782786         2.670426389
i4.i5         1                10            375.4834822         2.670388513
i5.i6         1                10            148.4333098         2.429521006
i6.i7         1                10            248.4124003         1.864656276
i7.i8         1                10            214.3328705         2.822417666
i8.i9         1                10            126.6327783         2.518531498
i9.i10        1                10            130.559539          2.584446464
i10.i11       1                10            775.6364864         2.822049601
i11.i12       1                10            407.2989647         2.822160488
i12.i13       1                10            85.97630897         2.474961855
i13.i14       1                10            179.3881279         2.220432548
i14.i15       1                10            202.9938045         2.414360293
i15.i16       1                10            173.7781599         2.510777691
i16.i17       1                10            74.69150787         2.21364015
i17.i18       1                10            172.6478784         2.476612497
i2.i19        1                10            708.6823389         2.37974903
i19.i20       1                10            79.31624466         2.408152626
i20.i21       1                10            255.0145887         2.278758754
i21.i22       1                10            136.6631796         2.218342677
i3.i23        1                10            293.9031328         2.542014795
i23.i24       1                10            140.3549359         2.473274245
i24.i25       1                10            140.5561329         2.47214197
i6.i26        1                10            704.9192861         2.670378985
i26.i27       1                10            503.4924411         2.670739585
i27.i28       1                10            113.751413          2.41897455
i28.i29       1                10            150.5896139         2.424930096
i29.i30       1                10            281.9677145         2.670378985
i30.i31       1                10            117.2336125         2.362080189
i31.i32       1                10            336.8608067         2.279897589
i32.i33       1                10            254.7927412         2.142332824
i1.i1                                        1551.693579         -0.471974967
i2.i2                                        2529.155992         -0.552058854
i3.i3                                        973.4289957         -0.5098431
i4.i4                                        766.4617607         -0.471184819
i5.i5                                        520.8366972         -0.539239633
i6.i6                                        1043.421435         -0.678355939
i7.i7                                        410.9917392         -0.836273472
i8.i8                                        337.2986302         -0.431753437
i9.i9                                        257.052682          -0.589600302
i10.i10                                      903.0509637         -0.353579035
i11.i11                                      1182.935449         -0.319504873
i12.i12                                      489.0208714         -0.379290963
i13.i13                                      263.4852503         -0.838907318
i14.i14                                      380.5926256         -0.818191581
i15.i15                                      376.3368589         -0.682764741
i16.i16                                      246.1698418         -0.719767261
i17.i17                                      245.540485          -0.744138133
i18.i18                                      172.6478784         -0.664980156
i19.i19                                      787.9698107         -0.758984927
i20.i20                                      333.824693          -0.832171024
i21.i21                                      391.5153928         -0.883911595
i22.i22                                      136.6631796         -0.923249977
i23.i23                                      434.0336696         -0.621791048
i24.i24                                      280.9110238         -0.668884952
i25.i25                                      140.5561329         -0.669450683
i26.i26                                      1208.411708         -0.471063423
i27.i27                                      614.311669          -0.516997558
i28.i28                                      264.3398776         -0.719225351
i29.i29                                      429.6051268         -0.556492981
i30.i30                                      395.2778597         -0.561330877
i31.i31                                      453.8008014         -0.840486546
i32.i32                                      590.281487          -0.920921882
i33.i33                                      254.7927412         -0.99925983
;
Ldat(i,j,'yl')$(ord(i) gt ord(j))=Ldat(j,i,'yl');
Ldat(i,j,'thel')$(ord(i) gt ord(j))=Ldat(j,i,'thel');
Ldat(i,j,'cap')$(ord(i) gt ord(j))=Ldat(j,i,'cap');

Table Busdat(i,*)
*-----Active power demand data here--------------;
           Pdem0        Qdem0      Vmin         Vmax
i1         0            0          1            1
i2         100          60         1            1
i3         90           40         1            1
i4         120          80         1            1
i5         60           30         1            1
i6         60           20         1            1
i7         200          100        1            1
i8         200          100        1            1
i9         60           20         1            1
i10        60           20         1            1
i11        45           30         1            1
i12        60           35         1            1
i13        60           35         1            1
i14        120          80         1            1
i15        60           10         1            1
i16        60           20         1            1
i17        60           20         1            1
i18        90           40         1            1
i19        90           40         1            1
i20        90           40         1            1
i21        90           40         1            1
i22        90           40         1            1
i23        90           50         1            1
i24        420          200        1            1
i25        420          200        1            1
i26        60           25         1            1
i27        60           25         1            1
i28        60           20         1            1
i29        120          70         1            1
i30        200          60         1            1
i31        150          70         1            1
i32        210          100        1            1
i33        60           40         1            1
;
Busdat(i,'vmin')=Busdat(i,'vmin')*0.8;
Busdat(i,'vmax')=Busdat(i,'vmax')*1.1;

Parameter Pdem1(i), QDem1(i), TPdem, LW(i),LWQ(i), PD(i),QD(i), PHI;
Pdem1(i)= Busdat(i,'Pdem0')/(1000*SBase);
Qdem1(i)= Busdat(i,'Qdem0')/(1000*SBase);
TPdem = sum(i, Pdem1(i));
LW(i)= Pdem1(i)/TPdem;
LWQ(i)= Qdem1(i)/TPdem;
PD(i)=LW(i)*PDtotal;
QD(i)=LWQ(i)*PDtotal ;
PHI(load)=arctan(QD(load)/PD(load));

*PHASE 2***********************************************************
table gdat(g,*) unit data
       pmin  pmax  qmin  qmax   t      s      a       b      c
*      (MW)  (MW)            (MW/h) (MW/h) ($) ($) ($)  ($/MWh)
g18    0.1   0.5   0     0.35   0.2    0.2    0.005   35     15
g22    0.1   0.4   0     0.2    0.2    0.2    0.003   50     20
*g25    0.1   0.4   0     0.25   0.2    0.2    0.004   65     50
g33    0.1   0.5   0     0.5    0.2    0.2    0.002   40     25
;

**PASE 3****************************************************
TABLE lambdaIL(load,l) Price of the IL contracting blocks
    1    2       3       4       5
i2  20   25      30      35      40
i3  20   25      30      35      40
i4  20   25      30      35      40
i5  20   25      30      35      40
i6  20   25      30      35      40
i7  20   25      30      35      40
i8  20   25      30      35      40
i9  20   25      30      35      40
i10 20   25      30      35      40
i11 20   25      30      35      40
i12 20   25      30      35      40
i13 20   25      30      35      40
i14 20   25      30      35      40
i15 20   25      30      35      40
i16 10   25      30      35      40
i17 10   25      30      35      40
i18 10   25      30      35      40
i19 10   25      30      35      40
i20 10   25      30      35      40
i21 20   25      30      35      40
i22 20   25      30      35      40
i23 20   25      30      35      40
i24 20   25      30      35      40
i25 20   25      30      35      40
i26 20   25      30      35      40
i27 20   25      30      35      40
i28 20   25      30      35      40
i29 20   25      30      35      40
i30 20   25      30      35      40
i31 20   25      30      35      40
i32 20   25      30      35      40
i33 20   25      30      35      40
;
lambdaIL(load,l)=lambdaIL(load,l)*2;
TABLE PILmax(load,l) Upper limit of the IL contracting blocks
    1        2         3            4           5
i2  0.1      0.1       0.1          0.1         0.1
i3  0.1      0.1       0.1          0.1         0.1
i4  0.1      0.1       0.1          0.1         0.1
i5  0.1      0.1       0.1          0.1         0.1
i6  0.1      0.1       0.1          0.1         0.1
i7  0.1      0.1       0.1          0.1         0.1
i8  0.1      0.1       0.1          0.1         0.1
i9  0.1      0.1       0.1          0.1         0.1
i10 0.1      0.1       0.1          0.1         0.1
i11 0.1      0.1       0.1          0.1         0.1
i12 0.1      0.1       0.1          0.1         0.1
i13 0.1      0.1       0.1          0.1         0.1
i14 0.1      0.1       0.1          0.1         0.1
i15 0.1      0.1       0.1          0.1         0.1
i16 0.1      0.1       0.1          0.1         0.1
i17 0.1      0.1       0.1          0.1         0.1
i18 0.1      0.1       0.1          0.1         0.1
i19 0.1      0.1       0.1          0.1         0.1
i20 0.1      0.1       0.1          0.1         0.1
i21 0.1      0.1       0.1          0.1         0.1
i22 0.1      0.1       0.1          0.1         0.1
i23 0.1      0.1       0.1          0.1         0.1
i24 0.1      0.1       0.1          0.1         0.1
i25 0.1      0.1       0.1          0.1         0.1
i26 0.1      0.1       0.1          0.1         0.1
i27 0.1      0.1       0.1          0.1         0.1
i28 0.1      0.1       0.1          0.1         0.1
i29 0.1      0.1       0.1          0.1         0.1
i30 0.1      0.1       0.1          0.1         0.1
i31 0.1      0.1       0.1          0.1         0.1
i32 0.1      0.1       0.1          0.1         0.1
i33 0.1      0.1       0.1          0.1         0.1

;

************************************************************

**PASE 4****************************************************



************************************************************

**PASE 5****************************************************

************************************************************

** PHASE 6 *************************************************

************************************************************

***********************************************************************************************************



** VARIABLES *******************************************************************************************
variables
**PASE 1****************************************************
CF objective function value
PRT active power purchase from real time market
QRT Reactive power purchase from real time market
PDG(g) active power generation of DG unots
QDG(g) Reactive power generation of DG
Pn(i) power flow from bus i to bus j
Qn(i) reactive power flow from bus i to bus j
v(i)    voltage of each bus
delta(i) angle of each bus



************************************************************

**PASE 2****************************************************

************************************************************

**PASE 3****************************************************
PILL(load,l)
PIL(load)
QIL(load)
************************************************************

**PASE 4****************************************************


************************************************************

**PASE 6****************************************************

************************************************************

;
***********************************************************************************************************
v.lo(i)=Busdat(i,'Vmin');
v.up(i)=Busdat(i,'Vmax');
v.fx('i1')=1.00;
delta.lo(i)=-pi;
delta.up(i)= pi;
delta.fx('i1')=0;
positive variable PILL(load,l)


** EQuations *******************************************************************************************

equations
**PASE 1****************************************************
eq17
eq18
eq19
eq20
eq21
eq22
eq23
************************************************************

**PASE 2****************************************************
eq28
eq30
eq33_1
eq33_2
eq34_1
eq34_2
************************************************************

**PASE 3****************************************************
eq38
eq39_1
eq40
eq41
************************************************************

**PASE 4****************************************************

************************************************************     ..


**PASE 4****************************************************


************************************************************

;


**PASE 1****************************************************
eq17..      CF=e=LambdaRT*(PRT-PDA_STAR)+sum(g,gdat(g,'a')*PDG(g)**2+gdat(g,'b')*PDG(g)+gdat(g,'c'))
+sum(load,sum(l,PILL(load,l)*lambdaIL(load,l)))+LambdaQRT*QRT;


eq18(i)..  pn(i)=e=sum(j,v(i)*v(j)*Ldat(i,j,'yl')*cos(delta(i)-delta(j)-Ldat(i,j,'thel')));
eq19(i)..  qn(i)=e=sum(j,v(i)*v(j)*Ldat(i,j,'yl')*sin(delta(i)-delta(j)-Ldat(i,j,'thel')));

eq20(load)..  sum(g$g2i(g,load),PDG(g))+PIL(load)+sum(b$b2i(b,load),PESS_STAR(b))+PIL(load)-PD(load)=e=pn(load);
eq21(load)..  sum(g$g2i(g,load),QDG(g))+QIL(load)-QD(load)=e=qn(load);
eq22(slack)..  PRT=e=pn(slack);
eq23(slack)..  QRT=e=qn(slack);
***********************************************************

**PASE 2****************************************************
eq28(g)..  PDG(g)-PK1(g)=l=gdat(g,'s');
eq30(g)..  PK1(g)-PDG(g)=l=gdat(g,'t');
eq33_1(g)..  PDG(g)=g= gdat(g,'pmin')*v_star(g);
eq33_2(g)..  PDG(g)=l= gdat(g,'pmax')*v_star(g);
eq34_1(g)..  QDG(g)=g= gdat(g,'Qmin')*v_star(g);
eq34_2(g)..  QDG(g)=l= gdat(g,'Qmax')*v_star(g);
***********************************************************

**PASE 3****************************************************
eq38(load)..     PIL(load) =e=  sum(l,PILL(load,l));
eq39_1(load,l).. PILL(load,l)=l=PILmax(load,l);
eq40(load)..     QIL(load) =e= tan(PHI(load))*PIL(load);
eq41..           sum(load,PIL(load))=e=PILDA_STAR;
************************************************************

**PASE 4****************************************************

************************************************************



**PASE 6****************************************************

************************************************************



***********************************************************************************************************


model  RTOM  /all/
solve RTOM minimizing CF using nlp

parameter Demand;
Demand=sum(load,PD(load))

parameter RealPRT;
realPRT=PRT.l-PDA_STAR;

parameter SUMPG;
SUMPG=sum(g,PDG.l(g))

parameter SUMIL;
SUMIL=SUM(load,PIL.l(load));

parameter COSTRT;
COSTRT=lambdaRT*realPRT;

parameter COSTDGRT;
COSTDGRT=sum(g,gdat(g,'a')*PDG.l(g)**2+gdat(g,'b')*PDG.l(g)+gdat(g,'c'));

parameter ILCOST;
ILCOST=sum(load,sum(l,PILL.l(load,l)*lambdaIL(load,l)))

parameter Loss;
loss=PDA_STAR+realPRT+SUMPG+SUMIL-Demand;

display Demand,PDA_STAR, realPRT, SUMPG, SUMIL, loss, PIL.l, PDG.l, PD , pk1, COSTRT , COSTDGRT,ILCOST,v.l




*$set matout "'GAMS_SOLVE_SC1_RTM_1.gdx' Demand, SUMDA, SUMPG, SUMIL, pf ,PD ,lambdaDA  , TCOST, DACOST  ,, PDG ";
$set matout "'GAMS_SOLVE.gdx' Demand, PDA_STAR, realPRT,SUMPG,SUMIL, loss, COSTRT, COSTDGRT, ILCOST,PDG,PIL, v,QRT  ";
execute_unload %matout%;
