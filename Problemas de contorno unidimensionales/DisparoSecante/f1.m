function [du] = f1(r,u)
    du = [u(2); (-1/2)*u(2)-4];
end