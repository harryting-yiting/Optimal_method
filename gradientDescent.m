%% gradient descent method

% initialize
x = [-1.2;1];
fv = fc(x);
dfv = df(x);
k = 0;
s = -dfv/norm(dfv);
ebs = 0.001;
flag = 1;
alpha = 0;
xk = [x];
fvk = [fv];
while(flag)
        k = k+1;
        fv = fc(x);
        fvk = [fvk;fv];
        dfv = df(x);
        s = -dfv/norm(dfv);
        
    if (norm(dfv) < ebs)
        flag = 0;

    else
        alpha = -(dfv'*s) / (s'*hf(x)*s);
        x = x + alpha*s;

        xk = [xk,x];
    end
end


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
% %% objective function
% function v = fc(x)
%     v = x(1)^2 + x(2)^2 - x(1)*x(2) - 10*x(1) - 4*x(2) + 60;
% end
% 
% %% objective gradient
% function v = df(x)
%     v = [(2*x(1) - x(2) -10); (2*x(2) - x(1) - 4)];
% end
% 
% %% objective Hession
% function v = hf(x)
%     v = [2, -1; -1, 2];
% end
