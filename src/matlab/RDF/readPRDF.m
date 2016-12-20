function [infile,outfile]= readPRDF(fpath)
%Read data file into PRDF
%TEST CODE:
% clc
% clear all
% fpath = 'G:\MDPDcase\2.0.BubbleModel\Fr1_0.75_A40_B25\RDF\2.1RDF\';

fname = 'PRDF.plt';
infile = sprintf('%s%s',fpath,fname);
fidin=fopen(infile,'r'); % open orignal input data file

tempstr='';
nline=0;

while ~feof(fidin)% judge whether we ger the end of the input file
  tline=fgetl(fidin); % read one line 
  if ~isempty(tline) %  judge whether the is empty one
    [m,n]=size(tline);
    flag=1;
    for i=1:n ;% judge whether the line have char?except ?? E e and space?
      if ~(tline(i)==' '|tline(i)=='-'|tline(i)=='.'|tline(i)=='E'...
          |tline(i)=='e'|tline(i)=='+'...
          |(double(tline(i))>=48&&double(tline(i))<=57))
        flag=0;
        break;
      end
    end
    if flag==1; % if the line is the numerical line write the data
      tempstr = sprintf('%s%s\n',tempstr,tline);
      nline=nline+1;
    end
  end
end
cell=textscan(tempstr,'%f %f %f %f %f\n');

PRadius=cell{1};
Pressure=cell{2};
SurTensor=cell{3};
nPGrid=cell{4};
SP=cell{5};

fclose(fidin);
%% Save the data for next step
outfile = sprintf('%s%s',fpath,'Pdata.mat');
save(outfile,'PRadius','Pressure','SurTensor','nPGrid','SP','fpath');
end


