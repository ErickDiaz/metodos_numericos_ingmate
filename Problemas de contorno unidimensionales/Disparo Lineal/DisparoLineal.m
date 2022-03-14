function [x,y] = DisparoLineal(pvi1,pvi2,a,b,N,alfa,beta)
    %[x,y] = DisparoLinea('PVI_1','PVI_2',1,2,100,1,2)

    h = (b-a)/N;
    x = a:h:b;
    x = x(:);

    [x,y1] = RungeKutta_sistema(pvi1, a, b, N, [alfa, 0]);
    [x,y2] = RungeKutta_sistema(pvi2, a, b, N, [0, 1]);


    C = (beta-y1(end,1))/y2(end,1);
    y = y1(:,1) + C*y2(:,1);
end

