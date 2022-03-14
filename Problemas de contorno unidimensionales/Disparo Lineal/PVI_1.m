function [du] = PVI_1(x,u)
    du = [u(2); (-2./x).*u(2) + (2./x.^2).*u(1) + sin(log(x))./x.^2];
    %du=[u(2); x.^2*u(1)-x.^6-x.^4+12*x.^2+2];
end

