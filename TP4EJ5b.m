%TP4-Ejercicio5b 

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definimos los puntos de datos
x = [-1, -0.5, 2, 2.25, 4, 5];
y = [9.1, 6, -3.5, -3.3, -0.9, 2.5];

p1 = polyfit(x, y, 1)
p2 = polyfit(x, y, 2)
p3 = polyfit(x, y, 3)

%Ajuste de polinomio de grado m

% Si el grado del polinomio es igual a m, 
% la función polyfit ajustará un polinomio 
% de grado m a los datos. Sin embargo, 
% si m es mayor o igual al número de datos, 
% la función polyfit devolverá un polinomio
% que pasa exactamente por todos los puntos de datos.
% Esto se conoce como "sobreajuste" 
% y puede no ser deseable en muchos casos.