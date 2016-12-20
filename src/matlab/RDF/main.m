clc
clear all

%% Compute the density and bubble radius
[fname,fpath]=uigetfile({'*.plt;*.dat','All data Files';...
    '*.*','All Files' });   %chose the input data file location
RDFile = sprintf('%s%s',fpath,fname);

[k,l]=size(fpath);
datapath=fpath(1:l-9)

[data] = readRDF(RDFile);
 
results = DensityAnalysis(data);

load(results);

%% Compute the pressure and surface tension
[PRDFile,Pdata] = readPRDF(fpath);

Presults = StressAnalysis(Pdata);

load(Presults);

%% Compute together for surface tension
[DPFile,DPdata] = readDP(fpath);
load(DPdata);

[m,n]=size(BrIn);

[j,k]=size(Press);
Density(j,1)=(Density(j,1)+Density(j-1,1))/2;
Density(j,2)=(Density(j,2)+Density(j-1,2))/2;
Press(j,1)=(Press(j,1)+Press(j-1,1))/2;
Press(j,2)=(Press(j,2)+Press(j-1,2))/2;
SurTs(1)=(Press(j,1)-Press(j,2))*BrIn(m,2)/2;   %get the surface tension

SurTs(2)=(BPr-FPr)*BrIn(m,2)/2;   %get the surface tension

save(Presults,'PRadius','Pressure','fpath','nPGrid','BPr','FPr','SurTs','Press');
save(results,'ARDF','BRDF','FRDF','RDF','Radius','BFRho','BrIn','Density','Ln','fpath');
%% output the last result 

output(results,Presults);

% %% second part
% [k,l]=size(fpath);
% fpath=fpath(1:l-5);
% RDFile = sprintf('%s%s%s',fpath,'RDF2\',fname)
% 
% [data] = readRDF(RDFile);
%  
% results = DensityAnalysis(data);
% 
% load(results);
% 
% %% Compute the pressure and surface tension
% [PRDFile,Pdata] = readPRDF(fpath);
% 
% Presults = StressAnalysis(Pdata);
% 
% load(Presults);
% 
% %% Compute together for surface tension
% [DPFile,DPdata] = readDP(fpath);
% load(DPdata);
% 
% [m,n]=size(BrIn);
% 
% [j,k]=size(Press);
% Density(j,1)=(Density(j,1)+Density(j-1,1))/2;
% Density(j,2)=(Density(j,2)+Density(j-1,2))/2;
% Press(j,1)=(Press(j,1)+Press(j-1,1))/2;
% Press(j,2)=(Press(j,2)+Press(j-1,2))/2;
% SurTs(1)=(Press(j,1)-Press(j,2))*BrIn(m,2)/2;   %get the surface tension
% 
% SurTs(2)=(BPr-FPr)*BrIn(m,2)/2;   %get the surface tension
% 
% save(Presults,'PRadius','Pressure','fpath','nPGrid','BPr','FPr','SurTs','Press');
% save(results,'ARDF','BRDF','FRDF','RDF','Radius','BFRho','BrIn','Density','Ln','fpath');
% %% output the last result 
% 
% output(results,Presults);

%% Third part
[k,l]=size(fpath);
fpath=fpath(1:l-5);
RDFile = sprintf('%s%s%s',fpath,'RDF3\',fname);

[data] = readRDF(RDFile);
 
results = DensityAnalysis(data);

load(results);

%% Compute the pressure and surface tension
[PRDFile,Pdata] = readPRDF(fpath);

Presults = StressAnalysis(Pdata);

load(Presults);

%% Compute together for surface tension
[DPFile,DPdata] = readDP(fpath);
load(DPdata);

[m,n]=size(BrIn);

[j,k]=size(Press);
Density(j,1)=(Density(j,1)+Density(j-1,1))/2;
Density(j,2)=(Density(j,2)+Density(j-1,2))/2;
Press(j,1)=(Press(j,1)+Press(j-1,1))/2;
Press(j,2)=(Press(j,2)+Press(j-1,2))/2;
SurTs(1)=(Press(j,1)-Press(j,2))*BrIn(m,2)/2;   %get the surface tension

SurTs(2)=(BPr-FPr)*BrIn(m,2)/2;   %get the surface tension

save(Presults,'PRadius','Pressure','fpath','nPGrid','BPr','FPr','SurTs','Press');
save(results,'ARDF','BRDF','FRDF','RDF','Radius','BFRho','BrIn','Density','Ln','fpath');
%% output the last result 

output(results,Presults);





