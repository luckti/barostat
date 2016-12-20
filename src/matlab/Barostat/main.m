clc
clear all
%% list of comparing file 
%nfile=11;
% method one
% for i=1:nfile
% [fname,fpath]=uigetfile({'*.plt;*.dat','All data Files';...
%     '*.*','All Files' });   %chose the input data file location
% cellfile{i} = fpath;
% cellfile{i,2}= fname;
% end
%% %MDPD
% 
%  cellfile={...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent_sameFree\6.0.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.2\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent_sameFree\6.1.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.3\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent_sameFree\6.2.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.375\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent_sameFree\6.3.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.5\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent_sameFree\6.4.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.6\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent_sameFree\6.5.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.75\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent_sameFree\6.6.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp1.0\data\Barostat\'...
% %     }

% cellfile={...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent_sameFree\5.0.Fr1.0_B25_rho6_DPD_lp0.2\data\Barostat\'...
%     ,'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent_sameFree\5.1.Fr1.0_B25_rho6_DPD_lp0.3\data\Barostat\'...
%     ,'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent_sameFree\5.2.Fr1.0_B25_rho6_DPD_lp0.375\data\Barostat\'...
%     ,'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent_sameFree\5.3.Fr1.0_B25_rho6_DPD_lp0.5\data\Barostat\'...
%     ,'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent_sameFree\5.4.Fr1.0_B25_rho6_DPD_lp0.6\data\Barostat\'...
%     ,'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent_sameFree\5.5.Fr1.0_B25_rho6_DPD_lp0.75\data\Barostat\'...
%     ,'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent_sameFree\5.6.Fr1.0_B25_rho6_DPD_lp1.0\data\Barostat\'...
%     }

% method two
% compare lpercent

% cellfile={'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.6.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.0\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\2.1.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.1\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.5.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.2\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\2.2.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.3\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.4.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.4\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\2.3.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.5\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.3.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.6\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\2.4.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.7\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.2.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.8\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\2.5.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.9\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.1.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp1.0\data\Barostat\'}
% %compare tau
% cellfile={'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.2.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.8\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.01.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.8_tau100\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.02.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.8_tau1000\data\Barostat\'}
% %compare tau 
% cellfile={'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.6.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.0\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.6.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.0_tau100\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.6.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.0_tau1000\data\Barostat\'}
% %compare BStep
% cellfile={'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.2.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.8\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.7.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.8_BS10\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.7.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.8_BS50\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.8.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.8_BS100\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\4.8.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.8_BS200\data\Barostat\'}

%% %DPD
% cellfile={...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.6.Fr1.0_B25_rho6_DPD_lp0.0\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\1.1.Fr1.0_B25_rho6_DPD_lp0.1\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.5.Fr1.0_B25_rho6_DPD_lp0.2\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\1.2.Fr1.0_B25_rho6_DPD_lp0.3\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.4.Fr1.0_B25_rho6_DPD_lp0.4\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\1.3.Fr1.0_B25_rho6_DPD_lp0.5\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.3.Fr1.0_B25_rho6_DPD_lp0.6\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\1.4.Fr1.0_B25_rho6_DPD_lp0.7\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.2.Fr1.0_B25_rho6_DPD_lp0.8\data\Barostat\'...
% %    ,'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\1.5.Fr1.0_B25_rho6_DPD_lp0.9\data\Barostat\'...
% %     ,'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.1.Fr1.0_B25_rho6_DPD_lp1.0\data\Barostat\'
%      }
%compare tau
% cellfile={'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.2.Fr1.0_B25_rho6_DPD_lp0.8\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.01.Fr1.0_B25_rho6_DPD_lp0.8_tau100\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.02.Fr1.0_B25_rho6_DPD_lp0.8_tau1000\data\Barostat\'}
%compare tau 
% cellfile={'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.6.Fr1.0_B25_rho6_DPD_lp0.0\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.6.Fr1.0_B25_rho6_DPD_lp0.0_tau100\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.6.Fr1.0_B25_rho6_DPD_lp0.0_tau1000\data\Barostat\'}
% % %compare BStep
% cellfile={...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.2.Fr1.0_B25_rho6_DPD_lp0.8\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.7.Fr1.0_B25_rho6_DPD_lp0.8_BS50\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.8.Fr1.0_B25_rho6_DPD_lp0.8_BS100\data\Barostat\',...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.8.Fr1.0_B25_rho6_DPD_lp0.8_BS200\data\Barostat\'}
% %   'G:\MDPD\MDPDcase\1.6.CGbarostat\xyzcomponent\oBb_lpercent\3.7.Fr1.0_B25_rho6_DPD_lp0.8_BS10\data\Barostat\',...

% %% MDPD bubble 
% cellfile={...
%     'G:\MDPD\MDPDcase\1.6.CGbarostat\7.15.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.6_tau10_JP50_FD20\data\Barostat\'...
%     ,'G:\MDPD\MDPDcase\1.6.CGbarostat\7.21.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.0_tau10_JP50_FD20\data\Barostat\'...
%     ,'G:\MDPD\MDPDcase\1.6.CGbarostat\7.31.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.8_tau10_JP50_FD20\data\Barostat\'...
%     }

%
cellfile={...
    'G:\MDPD\MDPDcase\1.6.CGbarostat\8.51.Fr1.0_0.75_A-40_B25_rho6_MDPD_lp0.6_tau10_jum_df0.01_a10\data\Barostat\'...
     }
%% output into the plt file
pltfile=sprintf('%s%s','TrhoPcom.plt');
plt=fopen(pltfile,'w');
fprintf(plt,'Variables= "compareVar","rtime","P","DP","rho","Drho","T","DT","mu","Dmu"\n');

Tpltfile=sprintf('%s%s','Heatcom.plt');
Tplt=fopen(Tpltfile,'w');
fprintf(Tplt,'Variables= "compareVar","T","DT","Tmax","Heatime"\n');
[i,nfile]=size(cellfile);
for i=1:nfile
%% read original file TrhoP.plt, fpatch is the patch of TrhoP.plt.
% The matrix TrhoP each colum is "time","T","rho","P","mu","tau",orderly.
%[TrhoPF,fpath]=readTrhoP(cellfile{i},'TrhoP.plt');  
TrhoPF= sprintf('%s%s',cellfile{i},'TrhoP.mat');
load(TrhoPF);
%% Read data file into ExtraPara.dat
[ParaF]= readPara(cellfile{i});
load(ParaF);
%% find the barostat end time
[j,AStep]=size(time);
Nend=JStep;
for j = JStep:AStep
    if(P(j)>= JPress) Nend=j;break;end
%    if (abs(P(i)-JPress)/JPress) < 0.1 Nrtime=i;break;end
end
rtime=time(Nend)-time(JStep); % obtain the real rising time
%% get each variable:Mean/Standard Deviation
Tmstd=zeros(3,2);
Pmstd=zeros(3,2);
rhomstd=zeros(3,2);
mumstd=zeros(3,2);

% for P - pressure
Pmstd(1,1)= mean(P(1:JStep),2);
Pmstd(1,2)= std(P(1:JStep),0,2);
Pmstd(2,1)= mean(P(JStep:AStep),2);
Pmstd(2,2)= std(P(JStep:AStep),0,2);
Pmstd(3,1)= mean(P(Nend:AStep),2);
Pmstd(3,2)= std(P(Nend:AStep),0,2);

% for rho - density
rhomstd(1,1)= mean(rho(1:JStep),2);
rhomstd(1,2)= std(rho(1:JStep),0,2);
rhomstd(2,1)= mean(rho(JStep:AStep),2);
rhomstd(2,2)= std(rho(JStep:AStep),0,2);
rhomstd(3,1)= mean(rho(Nend:AStep),2);
rhomstd(3,2)= std(rho(Nend:AStep),0,2);

% for T - temperature
Tmstd(1,1)= mean(T(1:JStep),2);
Tmstd(1,2)= std(T(1:JStep),0,2);
Tmstd(2,1)= mean(T(JStep:AStep),2);
Tmstd(2,2)= std(T(JStep:AStep),0,2);
Tmstd(3,1)= mean(T(Nend:AStep),2);
Tmstd(3,2)= std(T(Nend:AStep),0,2);

% for mu - scale factor
mumstd(1,1)= mean(mu(1:JStep),2);
mumstd(1,2)= std(mu(1:JStep),0,2);
mumstd(2,1)= mean(mu(JStep:AStep),2);
mumstd(2,2)= std(mu(JStep:AStep),0,2);
mumstd(3,1)= mean(mu(Nend:AStep),2);
mumstd(3,2)= std(mu(Nend:AStep),0,2);

%% Find the time of adiabatic heating time
% for T - temperature
Tmax=0;
for k=JStep:AStep
    if(T(k)>= Tmax) Tmax=T(k);end
    if(T(k)>=(Tmstd(3,1)+Tmstd(1,2)))Nend=k;end
end
Heatime=time(Nend)-time(JStep); % obtain the real rising time
%% output into the plt file
fprintf(plt,'%9.4f %9.4f %9.4f %9.4f %9.4f %9.4f %9.4f %9.4f %9.4f %9.4f\n',...
    lpercent,rtime,...
    Pmstd(3,1),Pmstd(3,2),...
    rhomstd(3,1),rhomstd(3,2),...
    Tmstd(3,1),Tmstd(3,2),...
    mumstd(3,1),mumstd(3,2));
fprintf(Tplt,'%9.4f %9.4f %9.4f %9.4f %9.4f\n',...
    lpercent,...
    Tmstd(2,1),Tmstd(2,2),...
    Tmax,Heatime);
i
%% save for loading again
sFile= sprintf('%s%s',cellfile{i},'TrhoPA.mat');
save(sFile);
end
%% close the files
fclose(plt);
fclose(Tplt);

%% repeatly without changing the data
pltfile=sprintf('%s%s','TrhoPcom.plt');
plt=fopen(pltfile,'w');
fprintf(plt,'Variables= "compareVar","rtime","P","DP","rho","Drho","T","DT","mu","Dmu"\n');

Tpltfile=sprintf('%s%s','Heatcom.plt');
Tplt=fopen(Tpltfile,'w');
fprintf(Tplt,'Variables= "compareVar","Te","T","DT","Tmax","Heatime"\n');
[i,nfile]=size(cellfile);
for i=1:nfile
    sFile= sprintf('%s%s',cellfile{i},'TrhoPA.mat');
    load(sFile);
% Find the time of adiabatic heating time
% for T - temperature
Tmax=0;
for k=JStep:AStep
    if(T(k)>= Tmax) Tmax=T(k);Nend=k;end
end
Tm = mean(T((AStep-5000):AStep)/Tmax,2)
Tstd = std(T((AStep-5000):AStep)/Tmax,0,2)
% for k=JStep:AStep
% % if((abs(T(k)/Tmax))>=(Tm+5*Tstd))Nend=k;end
% 
% if((abs(T(k)/Tmax))<=(Tm+5*Tstd))Nend=k;break;end
% 
% end
Heatime=time(Nend)-time(JStep); % obtain the real rising time
Nheat=Nend;
AHe=(trapz(time(JStep:Nheat),T(JStep:Nheat))/(time(Nheat)-time(JStep))-Tmstd(1,1));%/(time(Nheat)-time(JStep));

% figure
% plot(time(JStep:Nheat)-time(JStep),T(JStep:Nheat),'-')
% % T(Nend)
% plot(time(Nend)-time(JStep),T(Nend),'r.','markersize',10)
% plot(time(JStep:AStep)-time(JStep),0,'r.')
% hold on
% plot(time(JStep:AStep)-time(JStep),T(JStep:AStep),'-')

% output into the plt file
fprintf(plt,'%9.4f %9.4f %9.4f %9.4f %9.4f %9.4f %9.4f %9.4f %9.4f %9.4f\n',...
    lpercent,rtime,...
    Pmstd(3,1),Pmstd(3,2),...
    rhomstd(3,1),rhomstd(3,2),...
    Tmstd(3,1),Tmstd(3,2),...
    mumstd(3,1),mumstd(3,2));
fprintf(Tplt,'%9.4f %9.4f %9.4f %9.4f %9.4f %9.4f\n',...
    lpercent,AHe,...
    Tmstd(2,1),Tmstd(2,2),...
    Tmax,Heatime);
i
end
% close the files
fclose(plt);
fclose(Tplt);

%% computing the computation region size
[m,n]=size(mu);
region=zeros(m,n);
for i=1:JStep
    region(i)=26.5053;
end
for i=JStep:n-1
    region(i+1)=region(i)*mu(i+1);
end
%%
region(JStep)*0.6
region(JStep+500)*0.6
region(JStep+1000)*0.6
region(JStep+10000)*0.6
region(JStep+10150)*0.6
region(JStep+10300)*0.6
