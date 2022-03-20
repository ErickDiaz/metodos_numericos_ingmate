function [x, y, t, iter, incre] = disparonewton_ex(funcion, a, b, alfa, beta, N, tol, maxiter)
    h = (b-a)/(N+1);
    x = a:h:b;
    
    t1 = (beta - alfa)/(b-a);
    [x, y] = ode45(funcion, x, [alfa, t1, a, b]');
    
    yb1 = y(end,2);
    zb1 = y(end,4);
    
    iter = 1;
    incre = tol+1;
    
    while incre>tol && iter<maxiter
        t = t1 - (yb1-beta)/zb1;
        [x, y] = ode45(funcion, x, [alfa, t, a, b]');
        incre = abs(y(end, 2) - beta);
        
        iter = iter+1;
        t1 = t;
        yb1 = y(end,2);
        zb1 = y(end,4);
    end
    
    if incre<tol
        disp("Exito!")
        disp('Iteraciones')
        disp(iter)
    else
        disp('se necesitan mas iteraciones')
    end
end
