function [f,df] = funcion1(x)
    f = x^2-sin(x);
    df = 2*x-cos(x);
end

