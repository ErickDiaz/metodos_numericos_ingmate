function [x,iter,v] = Jacobi(A,b,x0,tol,maxiter,solex)
L=tril(A, -1);
U=triu(A, 1);
D=diag(A);
iD=diag(1./D);

iter=1;
incre=tol+1;
v=[];
while iter<maxiter && incre>tol
    
	x=-iD*(L+U)*x0+iD*b;
	incre=norm(x-x0, inf);
	v=[v, incre];
	iter=iter+1;
	x0=x;
end

if incre>tol
	disp('Se necesitan mas interaciones');
end	
end