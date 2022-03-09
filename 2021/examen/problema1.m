function [du] = problema1(t, u)
    du = [u(2) 3.*e(t).*(cos(t)-sin(t))-u(1)-u(4) u(4) u(4)-u(3)];
    du = du(:);
end

