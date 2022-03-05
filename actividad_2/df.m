%[x,y,iter,v] = df('p','r',1,2,10,0,1/2,1e-6,5000);
function [x,y,iter,v] = df(p,r,a,b,N,alfa,beta,tol,maxiter)

h = (b-a)/(N);
x = a:h:b;
X = [a+h:h:b];

px = feval(p,X);
qx = -1.*ones(1,length(X));
rx = feval(r,X);

dp = 2+(h^2).*qx;
ds = -1+(h/2).*px(1:end-1);
di = -1-(h/2).*px(2:end);
di(end) = -2;

d = -(h^2).*rx;
d(1) = d(1) + (1+(h./2).*px(1)).*alfa;
d(end) = d(end) + (1-(h/2).*px(end)).*2.*h.*beta;
d = d(:);

mat = zeros(length(x));
mat = diag(dp) + diag(ds,1) + diag(di,-1);
init = zeros(length(X),1);

[y,iter,v] = jacobi(mat,d,init,tol,maxiter);

y = [alfa ; y];
x = x(:);
end

function [x,iter,v] = jacobi(A,b,x0,tol,maxiter)
    L = tril(A,-1);
    U = triu(A,1);
    D = diag(A);
    iD = diag(1./D);
    
    iter = 1;
    incre = tol+1;
    
    v = [];
    
    while iter<maxiter && incre>tol
        x = -iD*(L+U)*x0+iD*b;
        incre = norm(x-x0,inf); %incre = norm(b-a*x);
        v = [v,incre];
        iter = iter+1;
        x0 = x;
    end
    
    if incre>tol
        disp('se necesitan mas iteraciones')
    end
end

function y = p(x)
    y = -1./x;
end

function y = r(x)
    y = log(x);
end

