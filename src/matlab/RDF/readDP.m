function [infile,outfile] = readDP(fpath)
%UNTITLED Summary of this function goes here


fname = 'DensityPress.dat';

[k,l]=size(fpath);
datapath=fpath(1:l-9);
infile = sprintf('%s%s%s',datapath,'output\',fname);

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
cell=textscan(tempstr,'%d %f %f %f %f %f %f %d %d %d %d\n');

Density(:,1)=cell{2};
Density(:,2)=cell{3};
Density(:,3)=cell{4};
Press(:,1)=cell{5};
Press(:,2)=cell{6};
Press(:,3)=cell{7};
Ln(:,1)=cell{8};
Ln(:,2)=cell{9};
Ln(:,3)=cell{10};
Ln(:,4)=cell{11};

fclose(fidin);
%% Save the data for next step
outfile = sprintf('%s%s',fpath,'DPdata.mat');
save(outfile,'Density','Press','Ln','fpath');


end

