function [x,y, t, iter, incre] = disparo_secante(pvi, a, b, N, alfa, beta, maxiter, tol)

    %Vector de nodos
    h = (b-a)/N;
    x = a:h:b;
    x = x(:);

    t0=beta;
    t1=(beta-alfa)/(b-a);

    [x, y0] = RungeKutta_sistema(pvi, a, b, N, [alfa, t0]);
    yb0 = y0(end,1);

    [x, y1] = RungeKutta_sistema(pvi, a, b, N, [alfa, t1]);
    yb1 = y1(end,1);

    iter = 1;
    incre = tol+1;

    while iter<maxiter && incre>tol
        t=t1-((yb1-beta)*(t1-t0))/(yb1-yb0);

        [x, y1] = RungeKutta_sistema(pvi, a, b, N, [alfa, t]);
        yb0 = yb1;
        t0 = t1;
        t1 = t;
        yb1 = y1(end,1);

        iter = iter + 1;
        incre = abs(yb1-beta); 
    end

    if incre>tol
        disp('Necesito mas iteraciones');
    else
        y = y1;
        disp('Completado!');
        disp('Total iteraciones:');
        disp(iter);
    end
end