function [dv] = PVI_2(x,v)
    dv = [v(2);  (-2./x).*v(2) + (2./x.^2).*v(1)];
    %dv = [v(2); x.^2*v(1)];
end


