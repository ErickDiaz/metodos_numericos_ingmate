clear
clc

a = 0;
b = 3;
intervalo = 64;

[x1, y1] = Predictor_Corrector('funcion1', a, b, intervalo, 1);
[x2, y2] = Predictor_Corrector('funcion1', a, b, 2*intervalo, 1);

solex1 = exp((1/4)-((1/2)-x1).^2);
solex2 = exp((1/4)-((1/2)-x2).^2);

error8 = abs(y1-solex1);
maxerror8 = max(error8);

error16 = abs(y2-solex2);
maxerror16 = max(error16);

%comparacion de error con el doble de subintervalos
orden_local = maxerror8/maxerror16;
disp(orden_local);


subplot(3,1,1)
hold on
plot(x1, y1);
plot(x1, solex1)

subplot(3,1,2)
hold on
plot(x2, y2);
plot(x2, solex2)

subplot(3,1,3)
hold on
plot(x1, error8)
plot(x2, error16)