function [sol,iter,incre1,incre2,acoc] = Halley(f,x0,tol,maxiter)
% [sol,iter,incre1,incre2,acoc] = MI_Newton('fun1', .5, 1e-12, 40)
    
% digits 200
% [sol,iter,incre1,incre2,acoc] = MI_Newton('fun1', vpa(.5), 1e-12, 40)

    incre1 = tol+1;
    incre2 = incre1;
    iter = 0;
    
    %while incre1 > tol && incre2 > tol && iter < maxiter
    while incre1 + incre2 > tol && iter < maxiter
    %while incre2 > tol && iter < maxiter
        [fx,dfx,d2fx] = feval(f,x0);
        
        Lf = fx*d2fx/dfx^2;
        x1 = x0-fx/dfx*(1+(Lf/(2-Lf)));
        
        %Actualizar variables
        incre1 = abs(x1-x0);
        
        fx1 = feval(f,x1);
        incre2 = abs(fx1);
        
        iter = iter + 1;
        I(iter) = incre1;
        x0 = x1;
    end
    
    if iter >= maxiter
        disp('Se necesitan mas iterados, no converge con este numero maximo de iteraciones');
    else
        sol = x0;
        disp('¡Bien Hecho!');
    end
    
    acoc = log(I(3:end)./I(2:end-1))./log(I(2:end-1)./I(1:end-2));
    
    acoc = vpa(acoc,5);
    incre1 = vpa(incre1,5);
    incre2 = vpa(incre2,5);
end


