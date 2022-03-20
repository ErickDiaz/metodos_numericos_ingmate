function [f,df] = p2_eq(x)
    f = x.^3 -2*x -exp(-x);
    df = 3*x.^2 - 2 +exp(-x);
end