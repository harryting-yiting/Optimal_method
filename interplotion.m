
%% Question 5-2
clear all;
xa = 0;
xc = 2;
xb = 1;
ebs = 0.05;

fa = f(xa);
fb = f(xb);
fc = f(xc);
f0 = 0;
flag = 1;
error = 1;
n = 0;

while(flag && error)
A =  2*((xa-xb)*fc + (xb-xc)*fa + (xc-xa)*fb);
A
n = n+1
if A ==0
   fprintf("error");
   error = 0;
else
    x0 = (1/A) * ((xb^2 - xc^2)*fa + (xc^2 - xa^2)*fb + (xa^2 - xb^2)*fc);
    f0 = f(x0);
    if abs(f0-fb) < ebs
        
        if f0 <= fb
            flag = 0;
        else
            x0 = xb;
            f0 = fb;
            flag = 0;
        end
    else
        if (x0-xb) <0
            
            if (f0-fb) == 0
                xa = x0;
                xc = xb;
                fa = f0;
                fc = fb;
                xb = (xa+xc)/2;
                fb = f(xb);
                
            elseif (f0-fb) >0
                xa =x0;
                fa = f0;
            else
                xc = xb;
                xb = x0;
                fc = fb;
                fb = f0;
            end
        else
            if (f0 - fb) == 0
                xa = xb;
                xc = x0;
                fa = fb;
                fc = f0;
                xb= (xa+xb)/2;
                fb = f(xb);
                
            elseif f0-fb>0
                xc = x0;
                fc = f0;
            else
                xa = xb;
                xb = x0;
                fa = fb;
                fb = f0;
            end
        end
    end
end
end

    
%% objective function
function Q = f(n)
    Q = exp(n) - 15*n;
end