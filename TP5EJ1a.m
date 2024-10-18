%TP5-Ejercicio1a 

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definición de la función
f = @(x) 1 ./ (1 + x.^2);

% Límites de integración
a = 0;
b = 1;

% Método del trapecio
T = (b - a) / 2 * (f(a) + f(b));

% Cálculo de la segunda derivada
syms x;
f_sym = 1 / (1 + x^2);
f_double_prime = diff(f_sym, x, 2);

% Evaluar la segunda derivada en los extremos y en el medio
M = max([double(subs(f_double_prime, x, 0)), ...
          double(subs(f_double_prime, x, 1)), ...
          double(subs(f_double_prime, x, 0.5))]);

% Cota del error
E = (b - a)^3 / 12 * M;

% Resultados
fprintf('Aproximación por el método del trapecio: %.4f\n', T);
fprintf('Cota del error: %.4f\n', E);