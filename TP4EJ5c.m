%TP4-Ejercicio5c 

% Borramos la ventana de comandos y las variables previas
clc
clear

% Datos de ejemplo
x = [-1, -0.5, 2, 2.25, 4, 5];
y = [9.1, 6, -3.5, -3.3, -0.9, 2.5];

% Ajuste de mínimos cuadrados con un polinomio de grado 6
p = polyfit(x, y, 6);

% Evaluar el polinomio ajustado
y_fit = polyval(p, x);

% Mostrar los resultados
disp('Coeficientes del polinomio ajustado:');
disp(p);
disp('Valores ajustados:');
disp(y_fit);
