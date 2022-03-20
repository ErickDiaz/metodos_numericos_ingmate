function [dy] = PVI(t, y)
    dy = [y(2); y(3); (4*t^2*y(2))+(t*exp(t^2))-33*t^4-t*y(1)+18];
end