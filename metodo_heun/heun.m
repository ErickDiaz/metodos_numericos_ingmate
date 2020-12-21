function [x,y] = heun(f, a, b, N, y0)
h= (b-a)/N;
x=a:h:b;
x=x(:);
y=zeros(N+1, 1);
y(1)=y0;

for k=1:N
    k1 = h * feval(f,x(k),y(k));
    k2 = h * feval(f,x(k+1),y(k)+k1);
    y(k+1) = y(k) + (k1+k2)/2;
end
end