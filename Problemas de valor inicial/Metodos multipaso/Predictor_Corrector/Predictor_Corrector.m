function [x, y] = Predictor_Corrector(f, a, b, N, y0)
    h = (b-a)/N;
    x = [a:h:b];
    x = x(:);
    
    y = zeros(N+1, length(y0));
    y(1,:) = y0
    
    for k=1:3
        ff(k) = feval(f, x(k), y(k,:));
        k1 = ff(k)';
        k2 = feval(f, x(k) + (h/2), y(k) + (h/2)*k1)';
        k3 = feval(f, x(k) + (h/2), y(k) + (h/2)*k2)';
        k4 = feval(f, x(k+1), y(k) + h*k3)';
        y(k+1,:) = y(k) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
    end
    
    for k = 4:N
        ff(k) = feval(f, x(k), y(k,:));
        
        ypred(k+1,:) = y(k,:) + (h/24)*(55*ff(k) - 59*ff(k-1) +37*ff(k-2) -9*ff(k-3));
        y(k+1,:) = y(k,:) + (h/24)*(ff(k-2) - 5*ff(k-1) + 19*ff(k) + 9*ypred(k+1,:));
    end
end