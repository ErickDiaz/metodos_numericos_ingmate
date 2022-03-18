function [sol,iter,incre1,incre2,acoc] = Newton_(f,x0,tol,maxiter)
    incre1 = tol+1;
    incre2 = incre1;
    iter = 0;

    while incre1 + incre2 > tol && iter < maxiter

        [fx,dfx] = feval(f,x0);
        x1 = x0 - fx/dfx;
        
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
        disp('Solucion encontrada')
        sol = x0;
        disp("iteraciones")
        disp(iter)
        disp("incre")
        disp(incre)
        
    end
    
    % ACOC orden de convergencia teorico
    acoc = log(I(3:end)./I(2:end-1))./log(I(2:end-1)./I(1:end-2));
    acoc = vpa(acoc,5);
    incre1 = vpa(incre1,5);
    incre2 = vpa(incre2,5);
end

% [sol,iter,incre1,incre2,acoc] = Newton('fun1', .5, 1e-12, 40)
    
% digits 200
% [sol,iter,incre1,incre2,acoc] = MI_Newton('fun1', vpa(.5), 1e-12, 40)
