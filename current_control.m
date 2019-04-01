function mySys = current_control(Qcmd, Qgen, Pord, Vterm, params)
% Function returns the sys in state space form, to be concatenated with
% other subsystems of in the inverter
% Inputs: [Qcmd, Qgen, Pord]
    % Pord seems to be the raw power from PV panel, unclear what Qgen is
    % Vterm is a constant, but here treating as an input to the func
% Outputs: [Iqcmd, Ipcmd]

% Params that form the "boundary current" limits
Iqmin=params.Iqmin % not used yet
Iqmax=params.Iqmax % not used yet
Ipmax=params.Ipmax % not used yet
Kvi=params.Kvi
KQi=params.KQi

% See handwritten work for derivation of state space form from GE PV
% inverter paper "Solar Photovoltaic (PV) Plant Models in PSLF"
A=[0 0;...
    Kvi 0];
B=[KQi -KQi 0;...
    0 0 0];
C=[0 1];
D=[0 0 1/Vterm];

% naming is needed for concatenation
mySys=ss(A,B,C,D,'InputName',{'cur_Qcmd','cur_Qgen','cur_Pord'},'OutputName',{'Iqcmd','Ipcmd'});