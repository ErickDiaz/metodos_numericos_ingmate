function [dy] = sistema_ex(x,y)
    dy(1) = y(2);
    dy(2) = y(2)+2*(y(1)-log(x))^3-1/x;
    dy(3) = y(4);
    dy(4) = 6*(y(1)-log(x))^2*y(3)+y(4);
    dy = dy(:);
end