function GAMS_To_MATLAB_RT(t,PREDGCOST)
clc
GDXNAME='GAMS_SOLVE';

%  gams('retailer')
realPRT.name='realPRT';
realPRT.form='full';
realPRT.compress='true'; 
realPRT=rgdx(GDXNAME,realPRT);

QRT.name='QRT';
QRT.form='full';
QRT.compress='true'; 
QRT=rgdx(GDXNAME,QRT);

V.name='V';
V.form='full';
V.compress='true'; 
V=rgdx(GDXNAME,V);

PDG.name='PDG';
PDG.form='full';
PDG.compress='false'; 
PDG=rgdx(GDXNAME,PDG);

PD.name='Demand';
PD.form='full';
PD.compress='true'; 
PD=rgdx(GDXNAME,PD);

SUMPG.name='SUMPG';
SUMPG.form='full';
SUMPG.compress='true'; 
SUMPG=rgdx(GDXNAME,SUMPG);

SUMIL.name='SUMIL';
SUMIL.form='full';
SUMIL.compress='true'; 
SUMIL=rgdx(GDXNAME,SUMIL);

PIL.name='PIL';
PIL.form='full';
PIL.compress='true'; 
PIL=rgdx(GDXNAME,PIL);

PDA_STAR.name='PDA_STAR';
PDA_STAR.form='full';
PDA_STAR.compress='true'; 
PDA_STAR=rgdx(GDXNAME,PDA_STAR);

COSTRT.name='COSTRT';
COSTRT.form='full';
COSTRT.compress='true'; 
COSTRT=rgdx(GDXNAME,COSTRT);

DGCOST.name='COSTDGRT';
DGCOST.form='full';
DGCOST.compress='true'; 
DGCOST=rgdx(GDXNAME,DGCOST);



ILCOST.name='ILCOST';
ILCOST.form='full';
ILCOST.compress='true'; 
ILCOST=rgdx(GDXNAME,ILCOST);

loss.name='loss';
loss.form='full';
loss.compress='true'; 
loss=rgdx(GDXNAME,loss);

lambdaDA=[
    40
44
42
43
42
45
48
50
55
55.1
62.5
64
62
55.5
56
56.5
56
56
52
50
48
42
42.5
40
];
PREDGCOSTT=PREDGCOST.val(38:61);
DACOST=lambdaDA(t)*PDA_STAR.val;
TotalCost=DACOST+COSTRT.val+DGCOST.val+ILCOST.val;
ResultP_PD_DA_RT_DG_IL_Loss=[PD.val, PDA_STAR.val-0.5*loss.val realPRT.val SUMPG.val SUMIL.val 0.5*loss.val];
ResultCOST_Total_DA_RT_DG_IL=[TotalCost DACOST, COSTRT.val, DGCOST.val+PREDGCOSTT(t), ILCOST.val ];

save(['results' num2str(t)], 'ResultP_PD_DA_RT_DG_IL_Loss', 'ResultCOST_Total_DA_RT_DG_IL','QRT','V','PDG','PIL')
