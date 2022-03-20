function [sol,iter,incre,acoc, I] = Traub(f,x0,tol,maxiter)
    incre = tol+1;
    iter = 0;
    I=[];
    while incre > tol && iter < maxiter

        [fx,dfx] = feval(f,x0);
        y = x0 - fx/dfx;

        [fy] = feval(f,y);
        x1 = y - fy/dfx;
  
        %Actualizar variables
        [fx1,dfx1] = feval(f,x1);
        incre = abs(x1-x0);

        iter = iter + 1;
        I(iter) = vpa(incre,6);
        
        incre = incre + abs(fx1);
        x0 = x1;
    end
    
    if iter >= maxiter
        disp('Se necesitan mas iterados, no converge con este numero maximo de iteraciones');
    else
        disp('Solucion encontrada')
        sol = x0;
        disp("iteraciones")
        disp(iter)
        
    end

    % ACOC orden de convergencia teorico
    acoc = vpa(log(I(3:end)./I(2:end-1))./log(I(2:end-1)./I(1:end-2)),6);
end

