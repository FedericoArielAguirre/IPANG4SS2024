%TP5-Ejercicio1b 

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definición de la función
f = @(x) 1 ./ (1 + x.^2);

% Límites de integración
a = 0;
b = 1;

% Valor exacto de la integral
valor_exacto = pi / 4;

% Inicialización de variables
n = 2; % Comenzamos con 2 subintervalos
error = Inf; % Inicializamos el error como infinito

% Bucle para encontrar el número de subintervalos necesario
while error >= 0.01
    % Cálculo del paso
    h = (b - a) / n;

    % Método del trapecio compuesto
    T_compuesto = h / 2 * (f(a) + 2 * sum(f(a + (1:n-1) * h)) + f(b));

    % Cálculo del error
    error = abs(valor_exacto - T_compuesto);
    
    % Incrementar el número de subintervalos
    n = n + 1;
end

% Mostrar resultados finales
fprintf('Número de subintervalos necesarios: %d\n', n-1);
fprintf('Aproximación por el método del trapecio compuesto: %.4f\n', T_compuesto);
fprintf('Valor exacto de la integral: %.4f\n', valor_exacto);
fprintf('Error: %.4f\n', error);