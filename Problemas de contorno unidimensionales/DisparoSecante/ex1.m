function [dy] = ex1(x,y)
dy = [y(2); y(2) + 2*(y(1)-log(x))^3 - (1/x)];
end

