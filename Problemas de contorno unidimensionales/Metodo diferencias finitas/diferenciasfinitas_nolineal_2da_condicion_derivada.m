function [X,Y,iter,incr] = diferenciasfinitas_nolineal_2da_condicion_derivada(f,fy,fz,a,b,alfa,beta,N,maxiter,tol)
    % [X,Y,iter,incr] = diferenciasfinitas_nolineal_2da_condicion_derivada(@(x,y,z) z+2*(y-log(x)).^3-1./x , @(x,y,z) 6.*(y-log(x)).^2, @(x,y,z) 1 + 0.*x + 0.*y + 0.*z, 2, 3, 1 + log(2), 2/9, 10, 100, 1e-5)

    % N es el numero de subintervalos
    h = (b-a)/(N);
    
    X = a:h:b;
    x = X(2:end);
    
    Y = 1.5.*ones(1,N+1);
    y = Y(2:end);
    
    incr = tol+1;
    iter=0;
    
    while incr>tol && iter<maxiter
        z = (Y(3:end) - Y(1:end-2))/(2*h);
        z = [z, beta];
        
        fe = feval(f,x,y,z);
        fye = feval(fy,x,y,z);
        fze = feval(fz,x,y,z);
        
        %central
        a = 2+h^2*fye;
        %superior
        b = -1+h/2*fze(1:N-1);
        %inferior
        c = -1-h/2*fze(2:N);
        c(end)=-2;
        
        d = diff(Y,2)-h^2*fe(1:end-1);
        %d = Y(3:end)-2*Y(2:end-1)+Y(1:end-2)
        d = [d,2*Y(end-1)-2*Y(end)+2*h*beta-h^2*fe(end)];
        
        v = Crout(a,b,c,d);
        y = y + v';
        disp(y)
        Y = [alfa y];
        
        incr = max(abs(v));
        iter = iter+1;
    end
end
