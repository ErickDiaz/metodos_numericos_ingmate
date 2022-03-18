.
function [x,t,U] = explicito(cc1,cc2,ci,a,b,nx,Tmax,nt,alfa)
% Parabolico explicito
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
    format long

    h=(b-a)/nx; x=a:h:b; x=x(:);
    k=Tmax/nt; t=0:k:Tmax;
    U=zeros(nx+1,nt+1);

    U(1,:)=feval(cc1, t);
    U(end,:)=feval(cc2, t);
    U(:,1)=feval(ci,x);

    lambda=k*alfa^2/h^2;

    if lambda<=1/2
        disp('Metodo estable'), lambda
    else
        disp('Metodo inestable'), lambda
    end

    for j=1:nt
        for i=2:nx
            U(i,j+1)=(1-2*lambda)*U(i,j)+lambda*(U(i+1,j)+U(i-1,j));
        end
    end
end