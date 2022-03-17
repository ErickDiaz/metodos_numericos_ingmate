function [x, t, U] = calor_implicito(cc1,cc2,ci,a,b,nx,Tmax,nt,alfa)
% Metodo Implicito
% Parametros
% cc1:  Condicion de contorno 1, cualquier funcion
% cc2:  Condicion de contorno 1, cualquier funcion
% ci:   Funcion que describe la cond. incial
% a:    intervalo de variable espacial
% b:    Condicion de contorno 1, cualquier funcion
% nx:   Numero de subintervalos
% Tmax: Tiempo donde termina el studio
% nt:   Numero de subintervalos de la variable temporal
% alfa: Coeficiente de la ecuacion diferencial
    h= (b-a)/nx; x=a:h:b;
    k=Tmax/nt; t= 0:k:Tmax;

    U=zeros(nx+1,nt+1);
    U(1,:) = feval(cc1,t);
    U(end,:) =feval(cc2,t);
    U(:,1) =feval(ci,x);
    
    lambda = alfa^2*k/h^2;

    % Diagonal principal
    dp=(1+2*lambda)*ones(nx-1, 1);
    % Diagonal superior
    ds=-lambda*ones(nx-2, 1);
    % Diagonal ingerior
    di=ds;
    
    for j=2:nt+1
        d=U(2:nx, j-1);
        d(1)=d(1)+lambda*U(1, j-1);
        d(end)=d(end)+lambda*U(nx+1, j-1);
        z=Crout(dp,ds,di,d);
        U(2:nx, j)=z;
    end
end

