function [x, y] = AB4_sist(f, a, b, N, y0)
    h = (b-a)/N;
    x = a:h:b;
    x = x(:);
    
    %orden 4
    
    y = zeros(N+1, length(y0));
    y(1,:) = y0;
    
    for k=1:N
        k1 = feval(f, x(k), y(k,:))';
        k2 = feval(f, x(k) + (h/2), y(k,:) + (h/2)*k1)';
        k3 = feval(f, x(k) + (h/2), y(k,:) + (h/2)*k2)';
        k4 = feval(f, x(k+1), y(k,:) + h*k3)';
        y(k+1,:) = y(k,:) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
    end
    
    for k = 4:N
        ff(k,:) = feval(f, x(k), y(k,:));
        y(k+1,:) = y(k,:) + (h/24)*(55*ff(k,:) - 59*ff(k-1,:) +37*ff(k-2,:) - 9*ff(k-3,:));
    end
end

%[x1,y1] = AB4_sist('problema1',0,20,200,[2, 0]);
%[x2,y2] = AB4_sist('problema1',0,20,400,[2, 0]);
%[x3,y3] = AB4_sist('problema1',0,20,800,[2, 0]);
%error21 = abs(y2(1:2:end,:)-y1);
%error23 = abs(y3(1:2:end,:)-y2);


