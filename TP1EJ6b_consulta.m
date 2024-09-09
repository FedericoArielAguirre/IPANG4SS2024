% TP1-Ejercicio6b

% Limpiamos la ventana de comandos y las variables previas
clc
clear

% Definimos la variable x
x = -5:0.1:25;

% Graficamos la expresión
y = holaa(x);
plot(x, y, 'LineWidth', 2, 'Color', 'g');
title('Gráfica de la función');
xlabel('x');
ylabel('y');
grid on;

% Definimos la función holaa
function [y] = holaa(x)
    n = numel(x); % Utilizamos numel en lugar de length
    y = zeros(1, n); % Inicializamos la variable y
    
    for i = 1:n
        if x(i) < 2
            y(i) = 2;
        elseif x(i) < 3
            y(i) = x(i)^2;
        elseif x(i) <= 10
            y(i) = 1/x(i);
        elseif x(i) < 20
            y(i) = x(i);
        elseif x(i) == 22
            y(i) = 3 - x(i);
        else
            y(i) = 0;
        end
    end
end

