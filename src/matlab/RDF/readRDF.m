function [outfile]= readRDF(infile)
%Read data file into RDF

fidin=fopen(infile,'r'); % open orignal input data file
[k,l]=size(infile);
fpath=infile(1:l-7);

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
cell=textscan(tempstr,'%f %f %f\n');
RDF=zeros(nline,3);
RDF(1:nline,1)=cell{1};
RDF(1:nline,2)=cell{2};
RDF(1:nline,3)=cell{3};

fclose(fidin);
%% serparate the data RDF to bubble, fluid and all particles RDF
[m,n]=size(RDF)
m=m/3;
Radius = RDF(1:m,1);
BRDF=RDF((m+1):(2*m),2);
FRDF=RDF((2*m+1):(3*m),2);
ARDF=RDF(1:m,2);

[k,l]=size(fpath);
datapath=fpath(1:l-9);
% ParaF = sprintf('%s%s',datapath,'RDFpara.dat');
ParaF = sprintf('%s%s',datapath,'ExtraPara.dat');
RDFPara = importdata(ParaF);
nSample = RDFPara.data(1,2);
i =1;
Nps=0;
while (Radius(i)<1)
    Nps=Nps+RDF(i,3);
    i=i+1;
end
RNps=Nps/(nSample*4*pi*(Radius(i-1)^3)/3);
for j=1:i-1
    BRDF(j)= RNps;
    ARDF(j)= RNps;
end
%plot(Radius,ARDF,Radius,BRDF,Radius,FRDF)

%% Save the data for next step
outfile = sprintf('%s%s',fpath,'data.mat');
save(outfile,'ARDF','BRDF','FRDF','RDF','Radius','fpath');
end

