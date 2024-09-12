%Parcialito n1 10-09-24

%Ejercicio2a

%Limpiamos las variables previas y la ventana de comandos
clc;
clear;

% Definimos el número de mallas
n = 6;

% Creamos la matriz de coeficientes
A = zeros(n, n);

% Asignamos los coeficientes de la primera malla
A(1, 1) = 2;
A(1, 2) = -1;

% Asignamos los coeficientes de las mallas intermedias
for i = 2:n-1
    A(i, i-1) = 1;
    A(i, i) = -3;
    A(i, i+1) = 1;
end

% Asignamos los coeficientes de la última malla
A(n, n-1) = 1;
A(n, n) = -3;

% Creamos el vector de términos independientes
b = zeros(n, 1);
b(1) = 12/3; % V/R

% Mostramos la matriz de coeficientes y el vector de términos independientes
disp('Matriz A');
disp(A);
disp('Matriz b');
disp(b);

% Resolvemos el sistema de ecuaciones
I = A\b;
% disp(I);
disp('La particularidad que presenta la matriz del sistema es que es tridiagonal.');

