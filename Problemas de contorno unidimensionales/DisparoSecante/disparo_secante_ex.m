function [x,y, t, iter, incre] = disparo_secante_ex(pvi, a, b, N, alfa, beta, maxiter, tol)
    %Vector de nodos
    h = (b-a)/(N+1);
    x = a:h:b;
    x = x(:);

    t0=0.5;
    t1=0.25;

    [x, y0] = RungeKutta_sistema(pvi, a, b, N, [alfa, t0]);
    yb0 = y0(end,1);
    ypb0 = y0(end,2);

    [x, y1] = RungeKutta_sistema(pvi, a, b, N, [alfa, t1]);
    yb1 = y1(end,1);
    ypb1 = y1(end,2);

    iter = 1;
    incre = abs(ypb1-beta);

    while iter<maxiter && incre>tol
        t=t1-((ypb1-beta)*(t1-t0))/(ypb1-ypb0);

        [x, y1] = RungeKutta_sistema(pvi, a, b, N, [alfa, t]);
        yb0 = yb1; ypb0=ypb1;
        t0 = t1;t1 = t;
        yb1 = y1(end,1);
        ypb1 = y1(end,2);

        iter = iter + 1;
        incre = abs(ypb1-beta); 
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