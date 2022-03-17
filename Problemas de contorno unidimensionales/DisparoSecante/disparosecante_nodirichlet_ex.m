function [x, y, t, incre, iter] = disparosecante_nodirichlet_ex(f, a, b, alfa, beta, N, tol, maxiter)

    h = (b-a)/(N+1);
    x = a:h:b;

    t0=beta;
    t1=(beta-alfa)/(b-a);
    
    % primer disparo
    [x,y] = RungeKutta_sistema(f, a, b, N, [alfa, t0]);
    yb0 = y(end, 1); 
    ypb0 = y(end, 2); 
    
    % segundo disparo
    [x, y] = RungeKutta_sistema(f, a, b, N, [alfa, t1]);
    yb1 = y(end,1);
    ypb1 = y(end, 2);
    
    iter = 1;
    incre = abs(yb1-2*ypb1-beta);
    
    while incre>tol && iter<maxiter
        t = t1 - ((t1-t0)*(yb1-2*ypb1-beta))/(yb1-2*ypb1-yb0+2*ypb0);
        [x, y1] = RungeKutta_sistema(f, a, b, N, [alfa, t]);

        t0 = t1; t1 = t;
        ypb0=ypb1; yb0=yb1;
        ypb1=y1(end,2);  yb1=y1(end,1);
        
        incre = abs(yb1-2*ypb1-beta);
        iter = iter + 1;
    end
    
    if incre<tol
        disp('Completado!');
        disp('Total iteraciones:');
        disp(iter);
        y = y1;
    else
        disp('se necesitan mas iteraciones')
    end
end