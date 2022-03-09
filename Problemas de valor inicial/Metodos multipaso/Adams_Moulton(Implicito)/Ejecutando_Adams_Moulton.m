clear
clc

a = 0;
b = 3;
intervalo = 64;

[x1, y1] = Adams_Moulton('funcion1', a, b, intervalo, 1);
[x2, y2] = Adams_Moulton('funcion1', a, b, 2*intervalo, 1);

subplot(2,1,1)
hold on
plot(x1, y1);

subplot(2,1,2)
hold on
plot(x2, y2);
