clear
clc

nx = 6;
ny = 5;

x0 = 0;
x1 = 2;
y0 = 0;
y1 = 1;

maxiter = 500;
tol = 1e-10;

[U,x,y,iter,incre] = jacobi(@(x) x,@(x) x*exp(1),@(y) 0*y,@(y) 2*exp(y),@(y,x) x*exp(y),x0,x1,nx,y0,y1,ny,maxiter,tol)

surf(U)