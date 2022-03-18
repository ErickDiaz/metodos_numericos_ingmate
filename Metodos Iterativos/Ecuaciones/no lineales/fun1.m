function [f,df] = fun1(x)
    f = x*exp(x) - x^2 - cos(x);
    df = exp(x) - 2*x + sin(x) + x*exp(x);
end

