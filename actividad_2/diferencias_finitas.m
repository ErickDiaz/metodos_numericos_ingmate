function [x,y,iter,v] = diferencias_finitas(p,r,a,b,N,alfa,beta,tol,maxiter)


h = (b-a)/(N);
x = a:h:b;
X = a+h:h:b;

qx = -1.*ones(1, length(X));
diagonal_principal = 2+(h^2.*qx);

px = feval(p, X);
diagonal_superior = -1+(h/2*px(1:end-1));
diagonal_inferior = -1-(h/2*px(2:end));
diagonal_inferior(end) = -2;

rx = feval(r, X);
d = -(h^2).*rx;
d(1) = d(1) + (1+(h./2).*px(1)).*alfa;
d(end) = d(end) + (1-(h/2).*px(end)).*2.*h.*beta;
d = d(:);

% Creando matriz A
A = zeros(length(x));
A = diag(diagonal_principal) + diag(diagonal_superior,1) ...
    + diag(diagonal_inferior,-1);

% Inicializando Jacobi
x0 = zeros(length(X),1);
solex=log(x)
[y,iter,v] = Jacobi(A,d,x0,tol,maxiter, solex(2:end))
y = [alfa ; y ];
x = x(:);

end



function [y] = p(x)
    y = -1./x;
end


function [y]  = r(x)
    y = log(x);
end
