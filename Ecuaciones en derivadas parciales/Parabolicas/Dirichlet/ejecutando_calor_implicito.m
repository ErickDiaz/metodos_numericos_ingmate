clear
clc

h = 0.1;
k = 0.0005;
I = 0;
L = 1;
T = 0.5;
A = 1;

[U] = calor_implicito(@(t) 0*t,@(t) 0*t,@(x) sin(pi*x),I,L,L/h,T,T/k,A);

mesh(U)

%t = T;
%x = 0:h:L;
%solex = exp(-pi^2*t)*sin(pi*x);
%error = abs(solex' - U(:,end))
%plot(error)