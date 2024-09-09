%TP3-Ejercicio1-ab

% Borramos la ventana de comandos y las variables previas
clc
clear
% a) Orden del polinomio interpolante
n = 5; % número de puntos
orden = n - 1;
fprintf('El orden del polinomio interpolante es %d\n', orden);

% b) Polinomio interpolante por medio del método de Vandermonde
x = [0, 0.25, 0.5, 0.75, 1];
y = [1, 3, 5, 4.5, 3];

% Matriz de Vandermonde
V = vander(x);

% Sistema de ecuaciones
A = V;
b = y';

% Resolución del sistema
coeficientes = A \ b;

% Polinomio interpolante
p = polyval(coeficientes, x);

% Graficar el polinomio interpolante
xx = 0:0.01:1;
yy = polyval(coeficientes, xx);
plot(xx, yy, 'b-', x, y, 'ro');
xlabel('x');
ylabel('f(x)');
title('Polinomio interpolante');
grid on;