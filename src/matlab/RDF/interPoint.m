function [xp] = interPoint(x,y1,y2)
%UNTITLED Summary of this function goes here
%  we will get the intersection point between (x,y1) and (x,y2)

n=size(x);
j=1;
for i =1:n-1
    if (((y1(i)-y2(i))*(y1(i+1)-y2(i+1)))<=0)        
        if((y1(i)-y2(i))==0)
            xp(j,1)= i;
            xp(j,3)=y1(i);
            xp(j,2)=x(i);
        else
            ty11 =y1(i);
            ty12 =y1(i+1);
            ty21 =y2(i);
            ty22 =y2(i+1);
            while (abs(ty11-ty21)>=1e-12)
                ty1=(ty11+ty12)/2;
                ty2=(ty21+ty22)/2;
                if (((ty11-ty21)*(ty1-ty2))<=0)
                    ty12 =ty1;
                    ty22 =ty2;
                else
                    ty11 =ty1;
                    ty21 =ty2;
                end
            end  
            xp(j,1)= i;
            xp(j,3)= (ty11+ty21)/2;
            xp(j,2)= x(i)-((x(i)-x(i+1))*(y2(i)-xp(j,3))/(y2(i)-y2(i+1)));
        end
        j=j+1;
    end
    %if(j==3) break; end
end

end

