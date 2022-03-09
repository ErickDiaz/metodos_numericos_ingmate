function [dz] = funcion1(t,z)
    x = z(1);
    y = z(2);
    dz = [3*x + 2*y - (2*t.^2+1)*exp(2*t); 4*x + y + (t.^2+2*t-4)*exp(2*t)];
end