%TP5-Ejercicio2d

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definición de la función
f = @(x) 1 ./ (1 + x);

% Límites de integración
a = 0;
b = 1.5;

% Valor exacto de la integral (calculado con mayor precisión)
valor_exacto = log(1.5);

% Configuración para mostrar más cifras significativas
format long;

% Inicialización de variables
h_values = [0.1, 0.05, 0.01, 0.005, 0.001]; % Diferentes tamaños de paso
errores_trapecio = zeros(size(h_values));
errores_simpson = zeros(size(h_values));

% Bucle para calcular las aproximaciones
for i = 1:length(h_values)
    h = h_values(i);
    
    % Cálculo usando el método del trapecio compuesto
    T_resultado = trapecio_compuesto(f, a, b, h);
    errores_trapecio(i) = abs((valor_exacto - T_resultado) / valor_exacto);
    
    % Cálculo usando el método de Simpson compuesto
    S_resultado = simpson_compuesto(f, a, b, h);
    errores_simpson(i) = abs((valor_exacto - S_resultado) / valor_exacto);
    
    % Mostrar resultados
    fprintf('h = %.4f: Trapecio = %.10f, Error Trapecio = %.10f, Simpson = %.10f, Error Simpson = %.10f\n', ...
        h, T_resultado, errores_trapecio(i), S_resultado, errores_simpson(i));
end

% Comparar la convergencia
fprintf('\nComparación de convergencia:\n');
for i = 1:length(h_values)
    fprintf('h = %.4f: Error Trapecio = %.10f, Error Simpson = %.10f\n', ...
        h_values(i), errores_trapecio(i), errores_simpson(i));
end

% Funciones para los métodos
function T_compuesto = trapecio_compuesto(f, a, b, h)
    n = (b - a) / h;
    T_compuesto = (h / 2) * (f(a) + 2 * sum(f(a + (1:n-1) * h)) + f(b));
end

function S_compuesto = simpson_compuesto(f, a, b, h)
    n = (b - a) / h;
    if mod(n, 2) ~= 0
        error('El número de subintervalos debe ser par para el método de Simpson.');
    end
    S_compuesto = (h / 3) * (f(a) + 4 * sum(f(a + (2*(0:(n/2-1)) * h))) + 2 * sum(f(a + (1:(n/2-1)) * 2 * h)) + f(b));
end