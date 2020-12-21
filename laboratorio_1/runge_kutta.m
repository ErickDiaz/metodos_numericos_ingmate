function [x, y] = runge_kutta(f, a, b, N, y0)
h = (b-a)/N;
x = a:h:b;
x = x(:);

y = zeros(N+1, length(y0));

y(1,:) = y0;

for k=1:N
    k1 = h*feval(f, x(k), y(k,:))';
    k2 = h*feval(f, x(k) + (h/2), y(k,:) + (k1/2))';
    k3 = h*feval(f, x(k) + (h/2), y(k,:) + (k2/2))';
    k4 = h*feval(f, x(k) + h, y(k,:) + k3)';
    y(k+1,:) = y(k,:) + (k1 + 2*k2 + 2*k3 + k4)/6;
    
    x(k) = a + k*h;
end
end