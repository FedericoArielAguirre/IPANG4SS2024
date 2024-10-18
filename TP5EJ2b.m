%TP5-Ejercicio2b

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definición de la función
f = @(x) 1 ./ (1 + x);

% Límites de integración
a = 0;
b = 1.5;

% Valor exacto de ln(1.5)
valor_exacto = log(1.5);

% Inicialización de variables
n = 2; % Comenzamos con 2 subintervalos
error_relativo = Inf; % Inicializamos el error relativo como infinito
max_iteraciones = 100; % Límite de iteraciones
iteracion = 0; % Contador de iteraciones

% Bucle para encontrar el número de subintervalos necesario
while error_relativo >= 0.01 && iteracion < max_iteraciones
    % Cálculo del paso
    h = (b - a) / n;

    % Método del trapecio compuesto
    T_compuesto = h / 2 * (f(a) + 2 * sum(f(a + (1:n-1) * h)) + f(b));

    % Cálculo del error relativo
    error_relativo = abs((valor_exacto - T_compuesto) / valor_exacto);
    
    % Incrementar el número de subintervalos
    n = n + 1;
    iteracion = iteracion + 1; % Incrementar el contador de iteraciones
    
    % Imprimir progreso
    fprintf('Iteración %d: n = %d, Error relativo = %.6f\n', iteracion, n-1, error_relativo);
end

% Comprobar si se alcanzó el límite de iteraciones
if iteracion == max_iteraciones
    fprintf('Se alcanzó el límite de iteraciones sin convergencia.\n');
else
    % Mostrar resultados finales
    fprintf('Método del Trapecio:\n');
    fprintf('Número de subintervalos necesarios: %d\n', n-1);
    fprintf('Aproximación de ln(1.5): %.6f\n', T_compuesto);
    fprintf('Error relativo: %.4f%%\n', error_relativo * 100);
end