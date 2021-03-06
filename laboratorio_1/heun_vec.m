function [x,y, y_filter] = heun_vec(f, a, b, N, y0, x_filter)
h = (b-a)/N;
x = a:h:b;
x = x(:);
y = zeros(N+1, length(y0));
y(1,:) = y0;

y_filter = zeros(length(x_filter), length(y0));
filter_index = 1;

for k=1:N
    k1 = h * feval(f,x(k),y(k,:))';
    k2 = h * feval(f,x(k+1),y(k,:)+k1)';
    y(k+1,:) = y(k,:) + (k1+k2)/2;
    
    % Filtrando valores de y con un vector( x_filter)
    if ismember(x(k), x_filter)
        y_filter(filter_index, :) = y(k,:);
        filter_index = filter_index + 1;
    end
end
end