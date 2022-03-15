function [puntos, solaprox, t, iter] = disparosecante_nodirichlet(f, a, b, alfa, beta, N, tol, maxiter)

    h = (b-a)/(N+1);
    x = a:h:b;
    
    % primer disparo
    t0=1;
    [x,y] = ode45(f, x, [alfa, t0]');
    yb0 = y(end, 1); 
    ypb0 = y(end, 2); 
    
    % segundo disparo
    t1 = 2;
    [x, y] = ode45(f, x, [alfa, t1]');
    yb1 = y(end,1);
    ypb1 = y(end, 2);
    
    iter = 1;
    incre = (yb1-ypb1-beta);
    
    while incre>tol && iter<maxiter
        t = t1 - ((t1-t0)*(yb1-ypb1-beta))./(yb1-ypb1-yb0+ypb0);
        [x, y] = ode45(f, x, [alfa, t]');

        t0 = t1; t1 = t;
        ypb0=ypb1; yb0=yb1;
        ypb1=y(end,2);  yb1=y(end,1);
        
        incre = (yb1-ypb1-beta);
        iter = iter + 1;
    end
    
    if incre<tol
        puntos = x;
        solaprox = y;
    else
        disp('se necesitan mas iteraciones')
    end
end
