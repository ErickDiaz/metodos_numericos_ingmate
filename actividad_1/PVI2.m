function [du] = PVI2(t, u)
du = [u(2); 4*cos(t)-8*t*sin(t)-u(1)+2*u(3)-10*t; u(4); 5*t-2*(t^2)*cos(t)-t*u(4)+u(1)];
end