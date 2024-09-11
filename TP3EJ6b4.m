%TP3-Ejercicio6-b4

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definir la tabla de puntos para interpolar
x = [0, 1, 2, 3, 4];
f = [1, 2, 4, 7, 11];

% Calcular los coeficientes de los polinomios
[b, c] = calcular_coeficientes(x, f);

% Evaluar los polinomios en un rango de puntos
x_eval = linspace(x(1), x(end), 100);
y_eval = zeros(size(x_eval));
for i = 1:length(x)-1
    idx = x_eval >= x(i) & x_eval <= x(i+1);
    y_eval(idx) = evaluar_polynomial(x_eval(idx), i, b, c, f, x(i));
end

% Graficar la curva resultante
plot(x_eval, y_eval);
hold on;
plot(x, f, 'o');
xlabel('x');
ylabel('y');
title('Polinomios de Interpolación');

function y = evaluar_polynomial(x, i, b, c, f, x_i)
    y = f(x_i) + b(i) * (x - x_i) + c(i) * (x - x_i)^2;
end

function [b, c] = calcular_coeficientes(x, f)
    % Calcular los coeficientes b_i y c_i
    n = length(x) - 1;
    b = zeros(n, 1);
    c = zeros(n, 1);
    
    % Condición inicial: b0 = 0
    b(1) = 0;
    
    % Calcular b_i y c_i utilizando las fórmulas derivadas
    for i = 1:n-1
        b(i+1) = -b(i) + 2 * (f(i+1) - f(i)) / (x(i+1) - x(i));
        c(i) = (b(i+1) - b(i)) / (2 * (x(i+1) - x(i)));
    end
end


