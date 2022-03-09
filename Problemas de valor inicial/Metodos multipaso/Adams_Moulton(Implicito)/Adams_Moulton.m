function [x,y] = Adams_Moulton( f,a,b,n,y0 )

    h = (b-a)/n;
    x = a:h:b;
    y = zeros(n+1,1);
    y(1) = y0;

    for k = 1:2
        ff(k) = feval(f,x(k),y(k));

        k1 = ff(k);
        k2 = feval(f,x(k)+h/2,y(k)+h*k1/2);
        k3 = feval(f,x(k)+h/2,y(k)+h*k2/2);
        k4 = feval(f,x(k+1),y(k)+h*k3);
        y(k+1) = y(k)+h*(k1+2*k2+2*k3+k4)/6;
    end

    for k = 3:n
        % estimacion por Newton de y(k+1)
        ex = 1; iter = 0;
        tol = 1e-6;
        maxiter = 10;
        
        y1 = y(k); %estimación inicial
        fk = feval(f,x(k),y(k));
        fkm1 = feval(f,x(k-1),y(k-1));
        fkm2 = feval(f,x(k-2),y(k-2));
        
        [ffun,dffun] = feval(f,x(k+1),y1);
        fx=y1-y(k)-h/24*(19*fk-5*fkm1+fkm2+9*ffun);
        efx = norm(fx);
        
        while iter<maxiter && efx > tol && ex>tol
            dfx = 1-h/24*9*dffun;
            d = fx/dfx;
            t = y1 -d;
            [ffun,dffun] = feval(f,x(k+1),t);
            ft = t-y(k)-h/24*(19*fk-5*fkm1+fkm2+9*ffun);
            efx = norm(ft);
            iter = iter+1;
            y1 = t;
            ex = norm(t-y1);
            fx = ft;
        end
        
        y(k+1) = y1;
    end
end