%TP5-Ejercicio2c

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definición de la función
f = @(x) 1 ./ (1 + x);

% Límites de integración
a = 0;
b = 1.5;

% Tamaño del paso
h = 0.1; % Puedes cambiar este valor a cualquier tamaño de paso deseado

% Validación del tamaño del paso
if h <= 0
    error('El tamaño del paso h debe ser positivo.');
end

% Cálculo usando el método del trapecio compuesto
T_resultado = trapecio_compuesto(f, a, b, h);
fprintf('Resultado del método del trapecio: %.6f\n', T_resultado);

% Cálculo usando el método de Simpson compuesto
S_resultado = simpson_compuesto(f, a, b, h);
fprintf('Resultado del método de Simpson: %.6f\n', S_resultado);

% Función para el método del trapecio compuesto
function T_compuesto = trapecio_compuesto(f, a, b, h)
    % f: función a integrar
    % a: límite inferior
    % b: límite superior
    % h: tamaño del paso

    % Número de subintervalos
    n = (b - a) / h;

    % Cálculo del valor del método del trapecio compuesto
    T_compuesto = (h / 2) * (f(a) + 2 * sum(f(a + (1:n-1) * h)) + f(b));
end

% Función para el método de Simpson compuesto
function S_compuesto = simpson_compuesto(f, a, b, h)
    % f: función a integrar
    % a: límite inferior
    % b: límite superior
    % h: tamaño del paso

    % Número de subintervalos
    n = (b - a) / h;

    % Asegurarse de que n sea par
    if mod(n, 2) ~= 0
        error('El número de subintervalos debe ser par para el método de Simpson.');
    end

    % Cálculo del valor del método de Simpson compuesto
    S_compuesto = (h / 3) * (f(a) + 4 * sum(f(a + (2*(0:(n/2-1)) * h))) + 2 * sum(f(a + (1:(n/2-1)) * 2 * h)) + f(b));
end