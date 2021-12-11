function [dy] = pvi2(t, z)
u1 = z(1);
u2 = z(2);
v1 = z(3);
v2 = z(4);
dy=[u2; 4*cos(t)-(8*t*sin(t))-u1+2*v1-10*t;...
    v2; 5*t-2*(t^2)*cos(t)-t*v2+u1];
end
