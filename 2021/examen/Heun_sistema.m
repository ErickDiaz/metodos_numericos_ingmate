function [x,y] = Heun_sistema(f,a,b,N,y0)
%%% ejecutar: [x,y] = Heun('funcion',0,3,64,1)
%%% f: funcion
%%% a y b: extremos del intervalo
%%% N:numero de subintervalos
%%% y0: condicion inicial

%%% Error local del método: Orden 3
%%% Error global del método: Orden 2

    %%%....................................................................
    %%% paso de integracion
    h = (b-a)/N;
    
    %%% vector de nodos
    x = a:h:b;
    x = x(:);
    
    %%% vector solucion en a
    y = zeros(N+1, length(y0));%longitud y0 para sistema de ecuaciones
    y(1,:) = y0;
    
    for k=1:N
        k1 = h*feval(f, x(k), y(k,:))';
        k2 = h*feval(f, x(k+1), y(k,:) + k1)';
        y(k+1,:) = y(k,:) + (k1 + k2)/2; 
    end
    %%%....................................................................
end