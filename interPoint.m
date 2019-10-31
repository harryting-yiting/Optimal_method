%% interio point method
% gradientDesent
% initialize
clear all;
r = 10;
a = 3;
alpha = 0.5;
x = 15;
flag = 1;
flag1 = 1;
k = 0;
ebs = 0.001;
ebs2 = 0.000001;
xtmp = 0;
m = 0
while flag1
    m = m+1;
    flag = 1;
    while flag
        k = k+1;
        fv = f_hat(x, r, a);
        dfv = df_hat(x,r,a);
        s = -dfv/norm(dfv);

        if norm(dfv) < ebs
            op_f = f(x);
            flag = 0;
        else
            lbda = -(dfv' *s)/ (s'*hf_hat(x,r,a) *s)
            xtmp = x;
            x = x + lbda*s;

        end
    end
    
    if abs(xtmp - x) < ebs2
        flag1 = 0;
    else
        r = r*alpha;
    end
end


%% objective function

function v = f(x)
    v = (1/2)*x^3;
end

%% contraint

function v = g(x,a)
    v = x -a;
end

%% formulated function

function v = f_hat(x,r,a)
    v = (1/2)*x^3 + r/(x-a);
end

%% f_hat jacobian
function v = df_hat(x,r,a)
    v = (3/2)*x^2 - r/((x-a)^2);
end
    
%% f_hat hessan
function v = hf_hat(x,r,a)
    v = 3*x + (2*r)/((x-a)^3);
end