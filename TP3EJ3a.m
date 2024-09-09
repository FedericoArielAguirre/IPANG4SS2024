% TP3-Ejercicio3-a

% Borramos la ventana de comandos y las variables previas
clc
clear

error_bound_demo();

function error_bound_demo()
    % Definir la función f(x) y su segunda derivada f''(x)
    f = @(x) x^3 - 2*x^2 + x + 1;
    f_pp = @(x) 6*x - 4;

    % Definir los puntos x0 y x1
    x0 = 0;
    x1 = 1;

    % Calcular el valor absoluto máximo de f''(x) en [x0, x1]
    M = max(abs(f_pp(x0)), abs(f_pp(x1)));

    % Calcular el error máximo para la interpolación lineal
    error_max = 1/8 * M * (x1 - x0).^2;

    % Generar puntos x en [x0, x1] para evaluar la función y la interpolación lineal
    x = linspace(x0, x1, 100);

    % Evaluar la función f(x) y la interpolación lineal
    fx = f(x);
    fx_interp = f(x0) + (f(x1) - f(x0)) * (x - x0) / (x1 - x0);

    % Calcular el error entre la función y la interpolación lineal
    error = abs(fx - fx_interp);

    % Graficar el error y el límite de error
    plot(x, error);
    hold on;
    plot([x0, x1], [error_max, error_max], 'r--');
    xlabel('x');
    ylabel('Error');
    title('Error de la interpolación lineal');
    legend('Error', 'Límite de error');

    % Mostrar el resultado
    fprintf('Error máximo: %f\n', error_max);
    fprintf('Límite de error: %f\n', 1/8 * M * (x1 - x0)^2);
end

