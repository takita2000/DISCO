
clc
clear

GDXNAME='GAMS_SOLVE_SC1_Results_DAM';

%  gams('retailer')
SUMDEMAND.name='SUMDEMAND';
SUMDEMAND.form='full';
SUMDEMAND.compress='true'; 
SUMDEMAND=rgdx(GDXNAME,SUMDEMAND);

SUMDA.name='SUMDA';
SUMDA.form='full';
SUMDA.compress='true'; 
SUMDA=rgdx(GDXNAME,SUMDA);

SUMPESS.name='SUMPESS';
SUMPESS.form='full';
SUMPESS.compress='false'; 
SUMPESS=rgdx(GDXNAME,SUMPESS);

SUMPG.name='SUMPG';
SUMPG.form='full';
SUMPG.compress='true'; 
SUMPG=rgdx(GDXNAME,SUMPG);

SUMIL.name='SUMIL';
SUMIL.form='full';
SUMIL.compress='false'; 
SUMIL=rgdx(GDXNAME,SUMIL);

% pf.name='pf';
% pf.form='full';
% pf.compress='true'; 
% pf=rgdx(GDXNAME,pf);

PD.name='PD';
PD.form='full';
PD.compress='true'; 
PD=rgdx(GDXNAME,PD);

TCOST.name='TCOST';
TCOST.form='full';
TCOST.compress='true'; 
TCOST=rgdx(GDXNAME,TCOST);

DACOST.name='DACOST';
DACOST.form='full';
DACOST.compress='true'; 
DACOST=rgdx(GDXNAME,DACOST);

PREDGCOST.name='PREDGCOST';
PREDGCOST.form='full';
PREDGCOST.compress='false'; 
PREDGCOST=rgdx(GDXNAME,PREDGCOST);

ILCOST .name='ILCOST';
ILCOST .form='full';
ILCOST .compress='true'; 
ILCOST =rgdx(GDXNAME,ILCOST );

PPDG.name='PDGG';
PPDG.form='full';
PPDG.compress='false'; 
PPDG=rgdx(GDXNAME,PPDG );

PPESS.name='PESSS';
PPESS.form='full';
PPESS.compress='false'; 
PPESS=rgdx(GDXNAME,PPESS );


PDG=[PPDG.val(22,38:61);PPDG.val(25,38:61)];
PESS=[PPESS.val(18,38:61);PPESS.val(33,38:61)];

save('ResultP_DAM_DA_RT')
