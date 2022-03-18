function [f,df,d2f] = fun2_2_derivadas(x)
    %Para obtener la derivada:
    %syms x
    %diff (x*exp(x^2)-sin(x^2)+5+3*cos(x))
    
    %si no tenemos estimacion inicial:
    %ezplot('x*exp(x^2)-sin(x^2)+5+3*cos(x)')
    
    f = atan(x);
    df = 1/(x^2 + 1);
    d2f = -(2*x)/(x^2 + 1)^2;
end

