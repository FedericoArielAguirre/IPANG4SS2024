% TP1-Ejercicio6b

% Limpiamos la ventana de comandos y las variables previas
clc
clear
%Definimos vectores
x = -5:0.1:25; % define el rango de x
f = zeros(size(x)); % inicializa el vector de salida
%Asignacion de puntos 
f(x < -2) = 2; % asigna 2 para x < -2
f(x >= -2 & x < 3) = x(x >= -2 & x < 3).^2; % asigna x^2 para -2 <= x < 3
f(x > 0 & x < 20) = 1 ./ x(x > 0 & x < 20); % asigna 1/x para 0 < x < 20
f(x == 22) = 3 - x(x == 22); % asigna 3-x para x = 22
f(x == 0) = NaN; % asigna NaN (Not a Number) para x = 0
%Graficamos la funcion
plot(x, f,'g.'); % grafica la función
xlabel('x'); ylabel('f(x)'); % agrega etiquetas de eje
title('Gráfica de la función'); % agrega título