%Parcialito: Solucion de Ecuaciones 
% Lineales y No Lineales - 2020

%Problema 1

% Borramos la ventana de comandos y las variables previas
clc
clear

% Parámetros del problema
atol = 1e-4;  % Tolerancia
E_obj = 400;  % Caudal objetivo (m^3/s)
T_min = 3600;  % Tiempo mínimo (s)
T_max = 9000;  % Tiempo máximo (s)

% Función que interpola las muestras de caudales de crecida
f = @(T) 4.29e-9*T^3 - 1.23e-4*T^2 + 1.014*T - 1950 - E_obj;

% Método de bisección
T_biseccion = (T_min + T_max)/2;
iter_biseccion = 0;
while abs(f(T_biseccion)) > atol
    if f(T_biseccion)*f(T_min) < 0
        T_max = T_biseccion;
    else
        T_min = T_biseccion;
    end
    T_biseccion = (T_min + T_max)/2;
    iter_biseccion = iter_biseccion + 1;
end

% Método de Newton-Raphson
T_NR = (T_min + T_max)/2;
iter_NR = 0;
while abs(f(T_NR)) > atol
    df = @(T) 3*4.29e-9*T^2 - 2*1.23e-4*T + 1.014;
    T_NR = T_NR - f(T_NR)/df(T_NR);
    iter_NR = iter_NR + 1;
end

% Visualización de resultados
fprintf('Método de bisección:\n');
fprintf('Tiempo en el que el caudal de la crecida toma el valor de %f m^3/s: %f s\n', E_obj, T_biseccion);
fprintf('Número de iteraciones: %d\n', iter_biseccion);

fprintf('Método de Newton-Raphson:\n');
fprintf('Tiempo en el que el caudal de la crecida toma el valor de %f m^3/s: %f s\n', E_obj, T_NR);
fprintf('Número de iteraciones: %d\n', iter_NR);