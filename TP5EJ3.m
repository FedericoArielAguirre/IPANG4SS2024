%TP5-Ejercicio3

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definición de la función y su derivada
f = @(x) sin(x);
f_prime = @(x) cos(x);

% Límite de integración
a = 0;
b = 2 * pi;

% Número de subintervalos (debe ser par para el método de Simpson)
n = 8; % Comenzamos con 8, se puede aumentar si es necesario
error = 1; % Inicializamos el error
tolerancia = 0.05; % Tolerancia del 5%

% Cálculo de la longitud usando el método de Simpson
while error > tolerancia
    h = (b - a) / n; % Tamaño del paso
    x = a:h:b; % Puntos de evaluación
    % Cálculo de la longitud de arco
    L = (h / 3) * (sqrt(1 + f_prime(a)^2) + 4 * sum(sqrt(1 + f_prime(x(2:end-1)).^2)) + sqrt(1 + f_prime(b)^2));
    
    % Cálculo del error
    n = n * 2; % Duplicamos el número de subintervalos
    h = (b - a) / n; % Actualizamos el tamaño del paso
    x = a:h:b; % Nuevos puntos de evaluación
    L_nueva = (h / 3) * (sqrt(1 + f_prime(a)^2) + 4 * sum(sqrt(1 + f_prime(x(2:end-1)).^2)) + sqrt(1 + f_prime(b)^2));
    
    % Cálculo del error relativo
    error = abs((L_nueva - L) / L_nueva);
    L = L_nueva; % Actualizamos la longitud
end

% Resultado final
fprintf('La longitud de la chapa corrugada necesaria es: %.3f pulgadas\n', L);