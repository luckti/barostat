function [] = output(DRdata,PRdata)
%output the ending results we need
%TEST CODE:
% clc
% clear all
% DRdata
% PRdata
%% load the data file 
load(DRdata); %load density radius data file
load(PRdata); %load pressure radius data file
%% plot the figure of results
%plot the density results
figure
plot(Radius,ARDF,Radius,BRDF,Radius,FRDF)
    
[m,n]=size(BrIn);
for i = 1:m
    hold on
    plot(BrIn(i,2),BrIn(i,3),'r.','markersize',10)  %plot the interpoint 
end
[j,k]=size(Density);
Bhline1=refline(0,BFRho(4,1));
Fhline1=refline(0,BFRho(4,2));
Bhline2=refline(0,Density(j,1));
Fhline2=refline(0,Density(j,2));
set(Bhline1,'LineStyle','--','Color','k');
set(Fhline1,'LineStyle','--','Color','k');
set(Bhline2,'LineStyle','-.','Color','k');
set(Fhline2,'LineStyle','-.','Color','k');

%plot the pressure radical distribution function
figure
plot(PRadius,Pressure) %,PRadius,SurTensor,PRadius,SP)
[j,k]=size(Press);
Bhline1=refline(0,BPr);
Fhline1=refline(0,FPr);
Bhline2=refline(0,Press(j,1));
Fhline2=refline(0,Press(j,2));
set(Bhline1,'LineStyle','--','Color','r');
set(Fhline1,'LineStyle','--','Color','r');
set(Bhline2,'LineStyle','-.','Color','r');
set(Fhline2,'LineStyle','-.','Color','r');

%% output the density and pressure relationship
RhoRfile=sprintf('%s%s',fpath,'RhoR.plt');
RhoR=fopen(RhoRfile,'w');

fprintf(RhoR,'Variables= "r","<greek>r</greek>"\nZONE  T="(%5.3f,%5.3f)"\nF = POINT\n',BrIn(m,2),BrIn(m,3));
[m,n]=size(BrIn);
fprintf(RhoR,'%5.3f %10.6f\n',BrIn(m,2),BrIn(m,3));

[m,n]=size(Radius);
fprintf(RhoR,'Variables= "r","<greek>r</greek>"\nZONE T="<greek>r</greek><sub>B1</sub> = %5.3f "\nF = POINT\n',BFRho(4,1));
for i=1:m
    fprintf(RhoR,'%5.3f %10.6f\n',Radius(i),BFRho(4,1));
end
fprintf(RhoR,'Variables= "r","<greek>r</greek>"\nZONE T="<greek>r</greek><sub>F1</sub> = %5.3f "\nF = POINT\n',BFRho(4,2));
for i=1:m
    fprintf(RhoR,'%5.3f %10.6f\n',Radius(i),BFRho(4,2));
end

[j,k]=size(Density);
fprintf(RhoR,'Variables= "r","<greek>r</greek>"\nZONE T="<greek>r</greek><sub>B2</sub> = %5.3f "\nF = POINT\n',Density(j,1));
for i=1:m
    fprintf(RhoR,'%5.3f %10.6f\n',Radius(i),Density(j,1));
end
fprintf(RhoR,'Variables= "r","<greek>r</greek>"\nZONE T="<greek>r</greek><sub>F2</sub> = %5.3f "\nF = POINT\n',Density(j,2));
for i=1:m
    fprintf(RhoR,'%5.3f %10.6f\n',Radius(i),Density(j,2));
end

fprintf(RhoR,'Variables= "r","<greek>r</greek>"\nZONE T="<greek>r</greek>"\nF = POINT\n');
for i=1:m
    if(Radius(i)<1)fprintf(RhoR,'#'); end
    fprintf(RhoR,'%5.3f %10.6f\n',Radius(i),ARDF(i));
end
fprintf(RhoR,'Variables= "r","<greek>r</greek>"\nZONE T="<greek>r</greek><sub>B</sub>"\nF = POINT\n');
for i=1:m
    if(Radius(i)<1)fprintf(RhoR,'#'); end
    fprintf(RhoR,'%5.3f %10.6f\n',Radius(i),BRDF(i));
end
fprintf(RhoR,'Variables= "r","<greek>r</greek>"\nZONE T="<greek>r</greek><sub>F</sub>"\nF = POINT\n');
for i=1:m
    fprintf(RhoR,'%5.3f %10.6f\n',Radius(i),FRDF(i));
end

%% output the surface tension and pressure relationship
PrRfile=sprintf('%s%s',fpath,'PrR.plt');
PrR=fopen(PrRfile,'w');

[m,n]=size(PRadius);
fprintf(PrR,'Variables= "r","P"\nZONE  T="P<sub>B1</sub> = %5.3f "\nF = POINT\n',BPr);
for i=1:m
    fprintf(PrR,'%5.3f %10.6f\n',PRadius(i),BPr);
end
fprintf(PrR,'Variables= "r","P"\nZONE  T="P<sub>F1</sub> = %5.3f "\nF = POINT\n',FPr);
for i=1:m
    fprintf(PrR,'%5.3f %10.6f\n',PRadius(i),FPr);
end

[j,k]=size(Press);
fprintf(PrR,'Variables= "r","P"\nZONE  T="P<sub>B2</sub> = %5.3f "\nF = POINT\n',Press(j,1));
for i=1:m
    fprintf(PrR,'%5.3f %10.6f\n',PRadius(i),Press(j,1));
end
fprintf(PrR,'Variables= "r","P"\nZONE  T="P<sub>F2</sub> = %5.3f "\nF = POINT\n',Press(j,2));
for i=1:m
    fprintf(PrR,'%5.3f %10.6f\n',PRadius(i),Press(j,2));
end


fprintf(PrR,'Variables= "r","P"\nZONE  T="P"\nF = POINT\n');
for i=1:m
    if(PRadius(i)<1) 
        fprintf(PrR,'#'); 
    end
    fprintf(PrR,'%5.3f %10.6f\n',PRadius(i),Pressure(i));
end

%% output the important value
endfile=sprintf('%s%s',fpath,'end.txt');
enddata=fopen(endfile,'w');
fprintf(enddata,'BubbleSize\n');
[i,n]=size(BrIn);
fprintf(enddata,'%10.6f %10.6f\n',BrIn(i,2),BrIn(i,3));
fprintf(enddata,'dpDenstiy\n');
[j,k]=size(Density);
fprintf(enddata,'%10.6f %10.6f %10.6f\n',Density(j,1),Density(j,2),Density(j,3));
fprintf(enddata,'dpPressure\n');
[j,k]=size(Press);
fprintf(enddata,'%10.6f %10.6f %10.6f %10.6f\n',Press(j,1),Press(j,2),(Press(j,1)-Press(j,2)),SurTs(1));
fprintf(enddata,'Denstiy\n');
fprintf(enddata,'%10.6f %10.6f %10.6f\n',BFRho(4,1),BFRho(4,2),BFRho(4,3));
fprintf(enddata,'Pressure\n');
fprintf(enddata,'%10.6f %10.6f %10.6f %10.6f\n',BPr,FPr,(BPr-FPr),SurTs(2));
end

