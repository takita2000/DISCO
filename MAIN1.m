clear
clc

for t=1:24
    load(['results' num2str(t)])
   PD_DA_RT_DG_IL_Loss(t,1:6)=ResultP_PD_DA_RT_DG_IL_Loss;
   CTotal_CDA_CRT_CDG_CIL(t,1:5)=ResultCOST_Total_DA_RT_DG_IL;
    DG_P_ACTIVE(1:4,t)=PDG.val(39:42,1);
    Voltage(1:33,t)=V.val;
    
    
end
save('Total_Results','PD_DA_RT_DG_IL_Loss','CTotal_CDA_CRT_CDG_CIL','DG_P_ACTIVE','Voltage')


for i=1:24
PD_DA_RT_DG_IL_Loss(i,6)=abs(sum(PD_DA_RT_DG_IL_Loss(i,2:5))-PD_DA_RT_DG_IL_Loss(i,1));
end