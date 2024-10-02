%TP4-Ejercicio2 

% Borramos la ventana de comandos y las variables previas
clc
clear

% Importamos los datos del archivo txt
data = load('tp4ej2.txt');

% Extraemos los datos de la tabla:
x = data(:, 1);  % tension
y = data(:, 2);  % corriente

% Proponemos la funcion de ajuste
p = polyfit(x,y,2); %ajuste polinomico de grado 2

% Ajuste lineal y resistencia equivalente
p_linear = polyfit(x,y,1); %ajuste polinomio lineal
R_eq = p_linear(1); %resistencia equivalente

% Mostramos el valor de la resistencia equivalente
fprintf('La resistencia equivalente es R_eq= %.2f ohms', R_eq);

% Error en la estimacion de la corriente
y_fit = polyval(p,x); %valores ajustados de la corriente
residuos = y - y_fit; %residuos
std_residuos = std(residuos); % desviación estandar de los residuos

% Mostramos el valor de desviacion estandar de los residuos
fprintf('\n La desviacion estandar de los residuos estandar es std_residuos = %2.f\n',std_residuos);
