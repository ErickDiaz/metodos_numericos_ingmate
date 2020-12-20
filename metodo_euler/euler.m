function [x,y] = euler(f, a, b, N, y0)
h= (b-a)/N;
x=a:h:b;
x=x(:);
y=zeros(N+1, 1);
y(1)=y0;

for k=1:N
    y(k+1)=y(k)+h*feval(f,x(k),y(k));
end
end

