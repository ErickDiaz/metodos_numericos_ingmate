function [du] = pvi(x,y)
    du = [y(2); 1/8*(32+2*x.^3-y(1)*y(2))];
end