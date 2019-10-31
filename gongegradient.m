%% gradient descent method

% initialize
x =  [-1.2;1];
p = -df(x);
ebs = 0.001;
k = 0;
n = 100;
flag = 1;
xs = x;
b = 0;
xk = [x];
while(flag)
    k
    dfv = df(x);
    lmbda = -dfv'*p / (p'*hf(x)*p);
    xtmp = x;
    x = x + lmbda*p;
    xk = [xk,x];
    if abs(dfv) < ebs
        xs = x;
        flag= 0
    else
        if k == n
            p = df(x);
            k = 0;
        else
            b = (norm(df(x))^2 - df(x)'*df(xtmp)) / norm(df(xtmp));
            p = -df(x) + b*p;
            k = k+1;
        end
    end
end
fv = fc(xs)

%% objective function
function v = fc(x)
    % v = x(1)^2 + x(2)^2 - x(1)*x(2) - 10*x(1) - 4*x(2) + 60;
    v = 100*(x(2) -x(1)^3)^2 + (1-x(1))^2;
end

%% objective gradient
function v = df(x)
    v = [-600*(x(2) -x(1)^3)*x(1)^2 - 2*(1-x(1)); 200*(x(2) - x(1)^3)];
end

%% objective Hession
function v = hf(x)
    v = [(-1200 *x(2)*x(1) +3000*x(1)^4 +2) , -600*x(1)^2;...
        -600*x(1)^2, 200]
end
