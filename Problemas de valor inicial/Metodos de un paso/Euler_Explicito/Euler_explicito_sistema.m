function [x, y] = Euler_explicito_sistema(f, a, b, N, y0)
%%% ejecutar: [x,y] = Euler('funcion',0,3,64,1)
%%% f: funcion
%%% a y b: extremos del intervalo
%%% N:numero de subintervalos
%%% y0: condicion inicial

%%% Error local del método: Orden 2
%%% Error global del método: Orden 1

    %%%....................................................................
    %%% paso de integracion
    h = (b-a)/N;
    
    %%% vector de nodos
    x = a:h:b;
    x = x(:);
    
    %%% vector solucion en a
    y = zeros(N+1, length(y0));
    y(1,:) = y0;
    
    for k=1:N
        y(k+1,:) = y(k,:) + h*feval(f,x(k),y(k,:))';
    end
    %%%....................................................................
end

