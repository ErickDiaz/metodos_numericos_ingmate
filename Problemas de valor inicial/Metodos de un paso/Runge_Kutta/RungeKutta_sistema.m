function [x, y] = RungeKutta_sistema(f, a, b, N, y0)
%%% ejecutar: [x,y] = Heun('funcion',0,3,64,1)
%%% f: funcion
%%% a y b: extremos del intervalo
%%% N:numero de subintervalos
%%% y0: condicion inicial

%%% Error local del método: Orden 3
%%% Error global del método: Orden 2

    format long
    
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
        k1  = feval(f, x(k), y(k,:))';
        k2 = feval(f, x(k) + (h/2), y(k,:) + (h/2)*k1)';
        k3 = feval(f, x(k) + (h/2), y(k,:) + (h/2)*k2)';
        k4 = feval(f, x(k+1), y(k,:) + h*k3)';
        y(k+1,:) = y(k,:) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
    end
    %%%....................................................................
end