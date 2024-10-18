%TP5-Ejercicio2a

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definición de la función
f = @(x) 1 ./ (1 + x);

% Límites de integración
a = 0;
b = 1.5;

% Número de subintervalos
n = 4; % Puedes ajustar este valor según sea necesario

% Cálculo del paso
h = (b - a) / n;

% Método del trapecio compuesto
T_compuesto = h / 2 * (f(a) + 2 * sum(f(a + (1:n-1) * h)) + f(b));

% Valor exacto de la integral
valor_exacto = log(1 + b) - log(1 + a); % log(1+x) evaluado en 0 y 1.5

% Cálculo del error
error_trapecio = abs(valor_exacto - T_compuesto);

% Mostrar resultados
fprintf('Aproximación por el método del trapecio compuesto: %.4f\n', T_compuesto);
fprintf('Valor exacto de la integral: %.4f\n', valor_exacto);
fprintf('Error el método del trapecio compuesto: %.4f\n', error_trapecio);


% Metodo de Simpson Compuesto

% Definición de la función
f = @(x) 1 ./ (1 + x);

% Límites de integración
a = 0;
b = 1.5;

% Número de subintervalos (debe ser par)
n = 4; % Puedes ajustar este valor según sea necesario

% Asegurarse de que n sea par
if mod(n, 2) ~= 0
    n = n + 1;
end

% Cálculo del paso
h = (b - a) / n;

% Método de Simpson compuesto
S_compuesto = h / 3 * (f(a) + 4 * sum(f(a + (1:2:n-1) * h)) + 2 * sum(f(a + (2:2:n-2) * h)) + f(b));

% Cálculo del error
error_simpson = abs(valor_exacto - S_compuesto);

% Mostrar resultados
fprintf('Aproximación por el método de Simpson compuesto: %.4f\n', S_compuesto);
fprintf('Error por el método de Simpson compuesto:: %.4f\n', error_simpson);

% Calcular la cota del error

% Cálculo de la segunda derivada
f_double_prime = @(x) 2 ./ (1 + x).^3;

% Máximo de |f''(x)| en el intervalo [0, 1.5]
M = max(abs(f_double_prime(0)), abs(f_double_prime(1.5)));

% Cota del error para el método del trapecio
cota_trapecio = (b - a)^3 / (12 * n^2) * M;

% Cota del error para el método de Simpson
cota_simpson = (b - a)^5 / (180 * n^4) * M;

% Mostrar resultados
fprintf('Cota del error para el método del trapecio: %.4f\n', cota_trapecio);
fprintf('Cota del error para el método de Simpson: %.4f\n', cota_simpson);