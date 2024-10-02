%TP4-Ejercicio5d 

% Borramos la ventana de comandos y las variables previas
clc
clear

% Parámetros verdaderos
a = 2;
b = 1;

% Generar datos
t = linspace(1, 10, 100);
y_true = (a * t) ./ (b + t);

% Añadir ruido gaussiano
varianza = 2.5e-3;
ruido = sqrt(varianza) * randn(size(t));
y_noisy = y_true + ruido;

% Transformación de variables
z = y_noisy ./ t;

% Ajuste de mínimos cuadrados
X = [ones(size(t)); t]';
p = X \ z';

% Recuperar los parámetros ajustados
a_fit = p(2);
b_fit = (a_fit / p(1)) - 1;

% Mostrar resultados
disp('Parámetros ajustados:');
disp(['a = ', num2str(a_fit)]);
disp(['b = ', num2str(b_fit)]);

% Graficar resultados
figure;
plot(t, y_noisy, 'o', 'DisplayName', 'Datos con ruido');
hold on;
plot(t, (a_fit * t) ./ (b_fit + t), 'r-', 'DisplayName', 'Ajuste');
legend;
xlabel('t');
ylabel('y');
title('Ajuste de Datos con Mínimos Cuadrados');
