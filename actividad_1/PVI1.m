function [dy] = PVI1(x, y)
    dy = [y(2) ; 2*y(2)-5*y(1)];
end