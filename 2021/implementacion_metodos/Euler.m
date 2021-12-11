function [x, y] = Euler(f, a, b, N, y0)

% Calculo del paso h
h=(b-a)/N

% Obtencion del vector de nodos x
x=a:h:b;

%Inicializacion del vector solucion y en a
x=x(:);  %transformando x a columna
y=zeros(N+1,1)
y(1)=y0;

for k=1:N
    y(k+1)=y(k) + h*feval(f, x(k), y(k));
end
end

