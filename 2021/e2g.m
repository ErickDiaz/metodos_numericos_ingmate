function [sol] = e2g(a, b ,c)
sol1 = (-b + sqrt(b^2-4*a*c)) / (2*a);
sol2 = (-b - sqrt(b^2-4*a*c)) / (2*a);
sol = [sol1, sol2]
end