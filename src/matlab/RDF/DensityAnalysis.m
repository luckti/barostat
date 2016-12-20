function [results]= DensityAnalysis(datafile)
% analysis the data
% 
% clc
% clear all
%% load the data from readata function
load(datafile)
%% Get the point of intersection between the BRDF and FRDF, 
%  then we can through the point to judge the liquid-vapour interface.
BrIn = interPoint(Radius,BRDF,FRDF);
%% Copute the bubble and fluid density depend the BrIn which contain the bubble radius
[m,n]=size(BrIn);
[i,j]=size(BRDF);
[k,l]=size(fpath);
datapath=fpath(1:l-9)
% ParaF = sprintf('%s%s',datapath,'RDFpara.dat');
ParaF = sprintf('%s%s',datapath,'ExtraPara.dat');
RDFPara = importdata(ParaF);
nSample = RDFPara.data(1,2);
%way one
%Bubble density
BFRho(1,1)=sum(RDF(1:BrIn(m,1),3),1)/(nSample*4*pi*(BrIn(m,2)^3)/3);
%Fluid density
BFRho(1,2)=sum(RDF((BrIn(m,1)+2):i,3),1)/...
            (nSample*4*pi*((Radius(i)^3)-(BrIn(m,2)^3))/3);
BFRho(1,3)=BFRho(1,2)/BFRho(1,1);

%way two
%Bubble density
BFRho(2,1)=RDF(ceil(BrIn(m,1)/2),2);
%Fluid density
BFRho(2,2)=RDF(ceil((BrIn(m,1)+i)/2),2);
BFRho(2,3)=BFRho(2,2)/BFRho(2,1);

%way three
%Bubble density
BFRho(3,1)=mean(RDF(1:BrIn(m,1)+1,2));
%Fluid density
BFRho(3,2)=mean(RDF((BrIn(m,1)+2):i,2));
BFRho(3,3)=BFRho(3,2)/BFRho(3,1);

%way four
k=0;
l=0;
for j=1:i
    if (k==0 & RDF(i+j,3)<10e4 & RDF(i+j,2)<0.01 ) k= j-1;end
    if (l==0 & RDF(2*i+j,3)>0) l= j-1;end
end

%way five
k=0;
l=0;
for j=1:i
    if (RDF(j,3)> RDF(i+j,3)) k= j-1;end
    if (l==0 & RDF(2*i+j,3)>0) l= j-1;end
end

%Bubble density
BFRho(4,1)=sum(RDF(1:l,3),1)/(nSample*4*pi*(Radius(l)^3)/3);
%Fluid density
BFRho(4,2)=sum(RDF((k+1):i,3),1)/(nSample*4*pi*((Radius(i)^3)-(Radius(k)^3))/3);
BFRho(4,3)=BFRho(4,2)/BFRho(4,1);
%% ouput the results and prepare for Plot
results = sprintf('%s%s',fpath,'results.mat');
save(results,'ARDF','BRDF','FRDF','RDF','Radius','BFRho','BrIn','fpath');
end