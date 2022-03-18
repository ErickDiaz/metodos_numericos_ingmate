function [x,iter,incre] = gauss_seidel(A,b,x0,tol,maxiter)
    %Adaptacion b y X0 a vector columna
    b = b(:);
    x0 = x0(:); 
    x = x0;

    %Descomponer matriz en A = D+L+U
    L = tril(A,-1);         %Matriz Diagonal Inferior
    U = triu(A,1);          %Matriz Diagonal Superior   
    D = diag(diag(A));      %Matriz Diagonal Principal
    
    B = L+D;

    iter = 1;
    incre = tol+1;
    while iter<maxiter && incre>tol
        d = b-U*x0;

        % Resolviendo el sistema Bx=d
        x(1) = d(1)/B(1,1); % Primer componente
        for j=2:length(d)
            x(j) = (d(j)-B(j,1:j-1)*x(1:j-1))/B(j,j);
        end

        %Incre con error relativo
        incre = norm(x-x0,inf)/norm(x,inf);

        iter = iter+1;      %Incremento iteraciones
        x0 = x;             %Actualizar variables
    end
    
    if(incre>tol)
        disp("Se necesitan mas iteraciones");
    else
        disp("Solucion encontrada")
        disp(iter)
        disp("Incre")
        disp(incre)
    end
end
