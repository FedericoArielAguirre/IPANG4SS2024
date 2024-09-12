%Parcialito n1 10-09-24

%Limpiamos las variables previas y la ventana de comandos
clc; 
clear;
% Inicializamos la suma parcial y el término actual
sum_partial = 0;
term = 0;

% Calculamos la suma parcial de los primeros 15 términos
for n = 3:18
    term = ((-1)^(n+1))*n^2 / 3^n;
    sum_partial = sum_partial + term;
end

% Mostramos el resultado de la suma parcial
fprintf('La suma parcial de los primeros 15 términos es: %f\n', sum_partial);

% Estimamos el error absoluto utilizando la fórmula del resto de la serie
error_abs = abs(term);
fprintf('La estimación del error absoluto es: %f\n', error_abs);

