%TP3-Ejercicio6c

% Borramos la ventana de comandos y las variables previas
clc
clear

% Define los puntos de datos
x = [0, 1, 2, 3, 4];
f = [1, 2, 4, 7, 11];

% Crea un spline cubico interpolante con condiciones de libre frontera
pp = spline(x, f);

% Evaluar el spline cubico en un rango de puntos
x_eval = linspace(x(1), x(end), 100);
y_eval = ppval(pp, x_eval);

% Grafica el spline cubico interpolante
plot(x_eval, y_eval);
hold on;
plot(x, f, 'o');
xlabel('x');
ylabel('y');
title('Interpolacion Spline Cubica');