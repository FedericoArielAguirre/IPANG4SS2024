%TP1-Ejercicio4-a
clc;
clear;
% Definir el número de términos N
N = 100;

% Crear el vector x con los términos de la suma
x = (1/2).^(1:N);

% Crear el vector y con las sumas parciales
y = cumsum(x);

% Graficar los elementos del vector y
plot(y);
xlabel('n');
ylabel('Suma parcial');
title('Suma parcial de la serie');

% Graficar los elementos del vector x
figure;
plot(x);
xlabel('n');
ylabel('Término n-ésimo');
title('Términos de la serie');