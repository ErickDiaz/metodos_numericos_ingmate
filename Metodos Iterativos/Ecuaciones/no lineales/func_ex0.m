function [f,df] = func_ex0(x)
    f = x.*exp(x)-x.^2-cos(x);
    df = exp(x)+x.*exp(x)-2.*x+sin(x);
end