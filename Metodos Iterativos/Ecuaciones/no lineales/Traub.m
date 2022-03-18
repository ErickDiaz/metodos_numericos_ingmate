function [sol,iter,incre,acoc] = Traub(f,x0,tol,maxiter)
    incre = tol+1;
    iter = 0;
    I=[];
    while incre > tol && iter < maxiter

        [fx,dfx] = feval(f,x0);
        y = x0 - fx/dfx;

        [fy] = feval(f,y);
        x1 = y - fy/dfx;
  
        %Actualizar variables
        incre = abs(x1-x0);

        iter = iter + 1;
        I(iter) = incre;
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
end

