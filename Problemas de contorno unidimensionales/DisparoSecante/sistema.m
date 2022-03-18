function [dy] = sistema(x,y)
%y''=(1/8)(32+2x^3-yy'), y_1=y, y_2=y'
%solec = y=x^2+16/x
    dy(1) = y(2);
    dy(2) = (1/8)*(32+(2*x.^3)-(y(1).*y(2)));
    dy = dy(:);
end

