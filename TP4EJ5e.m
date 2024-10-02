%TP4-Ejercicio5e 

% Borramos la ventana de comandos y las variables previas
clc
clear

% Parámetros
a = 2; % valor de a
b = 3; % valor de b
t = linspace(0, 10, 100); % valores de t

% Generación de datos sin ruido
f = 2.^(a * t ./ (b + t));

% Añadir ruido gaussiano
ruido = sqrt(2.5e-3) * randn(size(t));
f_ruidoso = f + ruido;

% Transformación logarítmica
y = log2(f_ruidoso);

% Ajuste de mínimos cuadrados
X = [t' ./ (b + t)']; % Matriz de diseño
coef = X \ y'; % Coeficientes de ajuste

% Resultados
a_estimado = coef(1);

% Visualización
figure;
plot(t, y, 'o', 'DisplayName', 'Datos con ruido');
hold on;
plot(t, X * coef, '-', 'DisplayName', 'Ajuste lineal');
xlabel('t');
ylabel('log_2(f(t))');
legend;
title('Ajuste de datos utilizando mínimos cuadrados');
grid on;
