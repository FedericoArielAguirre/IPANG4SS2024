% Parcialito Recuperatorio Nº4 (UT8): Ecuaciones Diferenciales 2020 P2

%Problema 2

% Borramos la ventana de comandos y las variables previas
clc
clear

% Parámetros del problema
h = 0.01;  % Coeficiente de transferencia de calor (m^-2)
Ta = 20;  % Temperatura ambiente (ºC)
T0 = 20;  % Condición de borde en x=0 (ºC)
T6 = 250;  % Condición de borde en x=5 (ºC)
dx = 1;  % Paso de discretización (m)
x = 0:dx:5;  % Puntos de discretización

% Matriz de coeficientes
A = zeros(5, 5);
for i = 1:5
    A(i, i) = -2;
    if i > 1
        A(i, i-1) = 1;
    end
    if i < 5
        A(i, i+1) = 1;
    end
end

% Vector de términos independientes
b = zeros(5, 1);
b(1) = -h*dx^2*(Ta - T0) + 2*T0;
b(2:4) = -h*dx^2*(Ta);
b(5) = -h*dx^2*(Ta - T6) + 2*T6;

% Resolución del sistema de ecuaciones lineales
T = A\b;

% Visualización de resultados
plot(x(2:6), T);
xlabel('Distancia (m)');
ylabel('Temperatura (ºC)');
title('Solución de la ecuación diferencial');