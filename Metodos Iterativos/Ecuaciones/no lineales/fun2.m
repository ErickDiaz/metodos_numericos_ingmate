function [f,df] = fun2(x)
    %Para obtener la derivada:
    %syms x
    %diff (x*exp(x^2)-sin(x^2)+5+3*cos(x))
    
    %si no tenemos estimacion inicial:
    %ezplot('x*exp(x^2)-sin(x^2)+5+3*cos(x)')
    
    f = x*exp(x^2)-sin(x^2)+5+3*cos(x);
    df = exp(x^2)+x*exp(x^2) - cos(x^2)*2*x - 3*sin(x);
end

