% Parcialito Recuperatorio Nº4 (UT8): Ecuaciones Diferenciales 2020 P1

%Problema 1

% Borramos la ventana de comandos y las variables previas
clc
clear

% Parámetros del problema
H0 = 3;  % Altura inicial del agua (m)
k = 0.13;  % Coeficiente de descarga (m^1/2/min)
dt = 1;  % Paso de tiempo (min)
t_final = 20;  % Tiempo final de simulación (min)
umbral = 1;  % Umbral de altura del agua (m)

% Inicialización de variables
t = 0:dt:t_final;
n = length(t);
H_euler = zeros(1, n);
H_rk4 = zeros(1, n);
H_euler(1) = H0;
H_rk4(1) = H0;

% Método de Euler
for i = 2:n
    H_euler(i) = H_euler(i-1) - k * sqrt(H_euler(i-1)) * dt;
end

% Método de Runge-Kutta de orden 4
for i = 2:n
    k1 = -k * sqrt(H_rk4(i-1));
    k2 = -k * sqrt(H_rk4(i-1) + 0.5 * dt * k1);
    k3 = -k * sqrt(H_rk4(i-1) + 0.5 * dt * k2);
    k4 = -k * sqrt(H_rk4(i-1) + dt * k3);
    H_rk4(i) = H_rk4(i-1) + (dt/6) * (k1 + 2*k2 + 2*k3 + k4);
end

% Búsqueda del instante de tiempo en que el nivel del agua desciende por debajo del umbral
for i = 1:n
    if H_euler(i) < umbral
        t_euler = t(i);
        break;
    end
end

for i = 1:n
    if H_rk4(i) < umbral
        t_rk4 = t(i);
        break;
    end
end

% Visualización de resultados
figure;
plot(t, H_euler, 'b-', t, H_rk4, 'r-');
xlabel('Tiempo (min)');
ylabel('Altura del agua (m)');
legend('Método de Euler', 'Método de Runge-Kutta de orden 4');
title('Variación de la altura del agua en función del tiempo');

fprintf('Instante de tiempo en que el nivel del agua desciende por debajo del umbral (Euler): %f min\n', t_euler);
fprintf('Instante de tiempo en que el nivel del agua desciende por debajo del umbral (RK4): %f min\n', t_rk4);