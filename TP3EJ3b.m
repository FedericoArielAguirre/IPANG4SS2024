%TP3-Ejercicio3b

% Borramos la ventana de comandos y las variables previas
clc
clear

% Para estimar el valor de sin(x) mediante una interpolación lineal 
% de paso h, podemos utilizar la fórmula del error de interpolación lineal:
% 
% error ≤ (M * h^2) / 8
% 
% donde M es el valor absoluto máximo de la segunda derivada 
% de sin(x) en el intervalo de interpolación.
% 
% La segunda derivada de sin(x) es -sin(x), que tiene un valor 
% absoluto máximo de 1 en el intervalo [0, π/2].
% 
% Para mantener el error por debajo de 10e-6, 
% podemos establecer la condición:
% 
% (h^2) / 8 ≤ 10e-6
% 
% Despejando h, obtenemos:
% 
% h ≤ sqrt(8 * 10e-6) ≈ 0.0283
% 
% Por lo tanto, el valor de h debería ser menor o 
% igual a 0.0283 para mantener el error de interpolación 
% lineal por debajo de 10e-6

% Definimos variables
h = 0.0283;
x = 0:0.01:pi/2;
y = sin(x);

for i = 1:length(x)-1
  x_interp = x(i) + h;
  y_interp = y(i) + (y(i+1) - y(i)) * (x_interp - x(i)) / (x(i+1) - x(i));
    error = abs(sin(x_interp) - y_interp);
    if error > 10e-6
        disp('Error demasiado grande');
        break
    end
end