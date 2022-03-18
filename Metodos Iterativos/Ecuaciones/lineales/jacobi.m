function [x,iter,v] = jacobi(A,b,x0,tol,maxiter)
    % Cambiando a vector columna
    b = b(:);
    x0 = x0(:);

    % Diagonal inferior
    L = tril(A,-1);
    % Diagonal Superio
    U = triu(A,1);
    % Diagonal principal
    D = diag(A);
    iD = diag(1./D);
    
    iter = 1;
    incre = tol+1;
    
    v = [];
    
    while iter<maxiter && incre>tol
        x = -iD*(L+U)*x0+iD*b;

        %Incre con error relativo
        incre = norm(x-x0,inf)/norm(x,inf);
        
        v = [v,incre];
        
        iter = iter+1;
        x0 = x; %incre = norm(b-a*x);
    end
    
    if incre>tol
        disp('se necesitan mas iteraciones')
    else
        disp('Solucion encontrada')
        disp("iteraciones")
        disp(iter)
        disp("incre")
        disp(incre)
    end
end