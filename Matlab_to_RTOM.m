function Matlab_to_RTOM(PDA_STAR,PDTotal,LambdaRT,PK1,PILDA_STAR,v_star, PESS_STAR, PPW, PPPV)
guel = @(s,v) strcat(s,strsplit(num2str(v)));

PQ=33;
NDG=[4,14];
NBAT=[10,17,20,30];
PDA_STARp.name='PDA_STAR';                  
PDA_STARp.val = PDA_STAR;
PDA_STARp.type='parameter';

PDTotalp.name='PDTotal';                  
PDTotalp.val = PDTotal;
PDTotalp.type='parameter';

LambdaRTp.name='LambdaRT';                  
LambdaRTp.val = LambdaRT;
LambdaRTp.type='parameter';
% 
% v_STARp.name='v_STAR';                  
% v_STARp.val = v_STAR;
% v_STARp.type='parameter';
% v_STARp.uels = {1:PQ};
% v_STARp.form = 'full';
% 
% y_STARp.name='y_STAR';                  
% y_STARp.val = y_STAR;
% y_STARp.type='parameter';
% y_STARp.uels = {1:PQ};
% y_STARp.form = 'full';
% 
% 
% z_STARp.name='z_STAR';                  
% z_STARp.val = z_STAR;
% z_STARp.type='parameter';
% z_STARp.uels = {1:PQ};
% z_STARp.form = 'full';
% 
PK1p.name='PK1';                  
PK1p.val = PK1;
PK1p.type='parameter';
PK1p.uels =guel('g',NDG) ;
PK1p.form = 'full';

PILDA_STARp.name='PILDA_STAR';                  
PILDA_STARp.val = PILDA_STAR;
PILDA_STARp.type='parameter';

v_starp.name='v_star';                  
v_starp.val = v_star;
v_starp.type='parameter';
v_starp.uels =guel('g',NDG) ;
v_starp.form = 'full';

% 
% 
% P_Peakp.name='P_Peak';               
% P_Peakp.val = P_Peak;
% P_Peakp.type='parameter';
% P_Peakp.uels = {1:In};
% P_Peakp.form = 'full';
% 
% Q_Peakp.name='Q_Peak';                   
% Q_Peakp.val = Q_Peak;
% Q_Peakp.type='parameter';
% Q_Peakp.uels = {1:In};
% Q_Peakp.form = 'full';
% 
% S_INVERTERp.name='S_INVERTER';                  
% S_INVERTERp.val = S_INVERTER;
% S_INVERTERp.type='parameter';
% S_INVERTERp.uels = {1:In};
% S_INVERTERp.form = 'full';
% 
% P_Solar_Timep.name='Psolar_time';                  
% P_Solar_Timep.val = Psolar_time;
% P_Solar_Timep.type='parameter';
% P_Solar_Timep.uels = {1:Tn};
% P_Solar_Timep.form = 'full';



PESS_STARp.name='PESS_STAR';                  
PESS_STARp.val = PESS_STAR;
PESS_STARp.type='parameter';
PESS_STARp.uels =guel('b',NBAT) ;
PESS_STARp.form = 'full';


PWp.name='PPW';                  
PWp.val = PPW;
PWp.type='parameter';

PPVp.name='PPPV';                  
PPVp.val = PPPV;
PPVp.type='parameter';


wgdx('MATLAB_TO_RTOM',  PDA_STARp,PDTotalp,LambdaRTp,PK1p,PILDA_STARp,v_starp, PESS_STARp, PWp, PPVp);