
%% intialize

clear all;
a = 0.2;
b = 1;
ebs = 0.03;

l1 = a + 0.382*(b-a);
l2 = a + 0.618*(b-a);
lm = 0;
f1 = f(l1);
f2 = f(l2);

n = 0;
while abs(b-a) > ebs
    
    n = n+1;
    
    if f1 < f2
        b = l2;
        l1 = a + 0.382*(b-a);
        l2 = a + 0.618*(b-a);
        f1 = f(l1);
        f2 = f(l2);
    else
        a = l1;
        l1 = a + 0.382*(b-a);
        l2 = a + 0.618*(b-a);
        f1 = f(l1);
        f2 = f(l2);
    end
    f1
    f2
end

lm = (l1+l2)/2;
%% objective function

function Q = f(n)
    Q = n + 20/n;
end
