%TP3-Ejercicio4-ab

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definir la función f(x) = |x| + x/2 - x^2
f = @(x) abs(x) + x/2 - x.^2;

% Definir los puntos equiespaciados en el intervalo [-1, 1]
n_points = [4, 10, 20, 80];
for n = n_points
    x = linspace(-1, 1, n);
    y = f(x);
    
    % Interpolación de Lagrange
    x_eval = linspace(-1, 1, 100);
    p_lagrange = lagrange_interp(x, y, x_eval);
    plot_interp(x, y, x_eval, p_lagrange);
    title(['Interpolación de Lagrange con ', num2str(n), ' puntos']);
    pause;
    
    % Interpolación de Newton
    p_newton = newton_interp(x, y, x_eval);
    plot_interp(x, y, x_eval, p_newton);
    title(['Interpolación de Newton con ', num2str(n), ' puntos']);
    pause;
end

% Función para calcular el polinomio de Lagrange
function p = lagrange_interp(x, y, x_eval)
    n = length(x);
    p = 0;
    for i = 1:n
        L = 1;
        for j = 1:n
            if j ~= i
                L = L .* (x_eval - x(j)) / (x(i) - x(j));
            end
        end
        p = p + y(i) .* L;
    end
end

% Función para calcular el polinomio de Newton
function p = newton_interp(x, y, x_eval)
    n = length(x);
    p = y(1);
    for i = 2:n
        p = p + (x_eval - x(1:i-1)) * (y(i) - p) / (x(i) - x(1:i-1));
    end
end

% Función para graficar la función y el polinomio de interpolación
function plot_interp(x, y, x_eval, p)
    plot(x, y, 'o', x_eval, p, '-');
    xlabel('x');
    ylabel('f(x)');
    title('Interpolación de f(x) = |x| + x/2 - x^2');
    legend('Puntos de interpolación', 'Polinomio de interpolación');
end
