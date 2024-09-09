%TP1-Ejercicio4-b
clear;
clc;
% Definir el número de términos N
N = 1000;

% Crear el vector x1 con los términos de la suma para r = 0.9
x1 = (0.9).^(1:N);

% Crear el vector y1 con las sumas parciales para r = 0.9
y1 = cumsum(x1);

% Graficar los elementos del vector y1
figure;
plot(y1);
xlabel('n');
ylabel('Suma parcial');
title('Suma parcial de la serie para r = 0.9');

% Crear el vector x2 con los términos de la suma para r = 0.99
x2 = (0.99).^(1:N);

% Crear el vector y2 con las sumas parciales para r = 0.99
y2 = cumsum(x2);

% Graficar los elementos del vector y2
figure;
plot(y2);
xlabel('n');
ylabel('Suma parcial');
title('Suma parcial de la serie para r = 0.99');

% Mostrar los valores finales de las sumas parciales
fprintf('Valor final de la suma parcial para r = 0.9: %f\n', y1(end));
fprintf('Valor final de la suma parcial para r = 0.99: %f\n', y2(end));