%TP1-Ejercicio2
close all
clc
clear
% Definir el rango de t
t = linspace(0, 2*pi, 100);  % Genera 1000 puntos entre 0 y 2*pi

% Calcular las coordenadas x e y
x = cos(t) .* (exp(cos(t)) - 2*cos(4*t) - sin(t/12).^5);
y = sin(t) .* (exp(cos(t)) - 2*cos(4*t) - sin(t/12).^5);

% Graficar la curva
figure;
 plot(x, y, 'r', 'LineWidth', 1.5); % Grafica con línea azul y grosor 1.5
axis equal;                        % Asegura que los ejes sean proporcionales
title('Curva Paramétrica');
xlabel('x(t)');
ylabel('y(t)');
grid on;
figure, axis ([-3 3 -4 4]), hold on;
for i=1:length(t)-1
    plot(x(i:i+1),y(i:i+1));
    pause(1/10);
end
hold off