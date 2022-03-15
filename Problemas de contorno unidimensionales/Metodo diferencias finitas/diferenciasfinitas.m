function [x,y] = diferenciasfinitas(p,q,r,a,b,N,alfa,beta)
% Diferencias finitas lineales, orden 2, cond Dirichlet
%[x,y] = diferenciasfinitas('p','q','r',1,2,9,1,2)

h = (b-a)/(N+1);
x = a:h:b;
x = x(:);
X = x(2:end-1);


px = feval(p,X);
qx = feval(q,X);
rx = feval(r,X);

% Diagonales
dp = 2 + (h^2)*qx;
ds = -1 + (h/2)*px(1:end-1);
di = -1 - (h/2)*px(2:end);

% Terminos independientes
d = -(h^2)*rx;
d(1) = d(1) + (1+(h./2).*px(1)).*alfa;
d(end) = d(end) + (1-(h./2).*px(end)).*beta;

y = Crout(dp,ds,di,d);
y = [alfa ; y ; beta];
end


function y = p(x)
    y = -2./x;
end

function y = q(x)
    y = 2./(x.^2);
end

function y = r(x)
    y = sin(log(x))./(x.^2);
end