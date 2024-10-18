%TP5-Ejercicio3

% Borramos la ventana de comandos y las variables previas
clc
clear

% Cargar las coordenadas de la sección transversal desde un archivo
data = load('vertedero.txt'); 

% Cargar datos
x = data(:, 1); % Coordenadas x
y = data(:, 2); % Coordenadas y
A = polyarea(x, y); % Área de la sección transversal

% Calcular el volumen
L = 30; % Longitud del vertedero en metros
V = A * L;
disp(['Volumen del vertedero: ', num2str(V), ' metros cúbicos']);
% Pesos y abscisas para 12 puntos (predefinidos)
[xi, wi] = gauss_legendre_12();

% La función que queremos integrar (ajustar según sea necesario)
f = @(x) ... ; % función de la curva

% Cambiar de variable si los límites no son [-1, 1]
a = min(x); % Límite inferior de la integral
b = max(x); % Límite superior de la integral

% Transformación de la integral a los límites [-1, 1]
integral = 0;
for i = 1:12
    integral = integral + wi(i) * f((b-a)/2 * xi(i) + (a+b)/2);
end
integral = (b-a)/2 * integral;

disp(['Área bajo la curva con Gauss-Legendre: ', num2str(integral)]);
