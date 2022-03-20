function [puntos, solaprox, t, iter] = disparonewton(funcion, a, b, alfa, beta, N, tol, maxiter)
    h = (b-a)/(N+1);
    x = a:h:b;
    
    t1 = (beta - alfa)/(b-a);
    [x, y] = ode45(funcion, x, [alfa, t1, 0, 1]');
    
    yb1 = y(end,1);
    zb1 = y(end,3);
    
    iter = 1;
    incre = tol+1;
    
    while incre>tol && iter<maxiter
        t = t1 - (yb1-beta)/zb1;
        [x, y] = ode45(funcion, x, [alfa, t, 0, 1]');
        incre = abs(y(end, 1) - beta);
        
        iter = iter+1;
        t1 = t;
        yb1 = y(end,1);
        zb1 = y(end,3);
    end
    
    if incre<tol
        puntos = x;
        solaprox = y;
    else
        disp('se necesitan mas iteraciones')
    end
end
