%Irving–Kirkwood approach to measure interfacial tension

clear all
[fname,fpath]=uigetfile({'*.plt;*.dat','All data Files';...
    '*.*','All Files' });   %chose the input data file location
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
cell=textscan(tempstr,'%f %f %f %f %f %f %f %f %f\n');
STtrs=zeros(nline,9);
for i=1:9
STtrs(1:nline,i)=cell{i};
end

hnline = ceil(nline/2);
ST(1)=trapz(STtrs(1:50,1),STtrs(1:50,9));
ST(2)=trapz(STtrs(51:101,1),STtrs(51:101,9));
ST(3)=trapz(STtrs(:,1),STtrs(:,9))/2;
ST(4)=(ST(1)+ST(2))/2;
ST