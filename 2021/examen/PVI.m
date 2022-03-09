function [du] = PVI(t, u)
    du = [u(2) 3.*exp(t).*(cos(t)-sin(t))-u(1)-u(4) u(4) u(4)-u(3)];
    du = du(:);
end

