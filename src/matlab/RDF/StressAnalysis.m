function [results] = StressAnalysis(datafile)
%analysis the data
% 
% clc
% clear all
% datafile = 'G:\MDPDcase\2.0.BubbleModel\Fr1_0.75_A40_B25\RDF\2.1RDF\Pdata.mat'
%% load the data from readata function
load(datafile)
%% get the average pressure of bubble and fluid
MinN=1;
[m,n] = size(Pressure);

for i = 1:m
    if(Pressure(i)<Pressure(MinN))
        MinN = i;
    end
end
BprN=1;
for i=MinN-1:-1:1
    if(Pressure(i)<Pressure(i+1))
        BprN=i
        break;
    end
end
FprN=1;
for i=MinN+1:m
    if(Pressure(i)<Pressure(i-1))
        FprN=i
        break;
    end
end
BPr=0;
nBPr=0;
for i=1:BprN
    BPr=BPr+Pressure(i)*nPGrid(i);
    nBPr=nBPr+nPGrid(i);
end
BPr=BPr/nBPr;

FPr=0;
nFPr=0;
for i=FprN:m
    FPr=FPr+Pressure(i)*nPGrid(i);
    nFPr=nFPr+nPGrid(i);
end
FPr=FPr/nFPr;

%exlude the small size average influence
Pm=0;
nPr=0;
Pr=0.0;
for i = 1:m
    if (PRadius(i)>1)
        break;
    end
    Pr=Pr++Pressure(i)*nPGrid(i);
    nPr=nPr+nPGrid(i);
    Pm=Pm+1;
end
Pr=Pr/nPr;
for i = 1:Pm
    Pressure(i)=Pr;
end
%% ouput the results and prepare for Plot
results = sprintf('%s%s',fpath,'Presults.mat');
save(results,'PRadius','Pressure','fpath','nPGrid','BPr','FPr');
end