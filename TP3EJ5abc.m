%TP3-Ejercicio5abc

% Borramos la ventana de comandos y las variables previas
clc
clear

% a) Sistema de ecuaciones matriciales
% 
% Sea el polinomio de interpolación 
% p(x) = a_0 + a_1*x + a_2*x^2 + ... + a_k*x^k. 
% Queremos encontrar los coeficientes 
% a_0, a_1, ..., a_k que satisfacen las condiciones:
% 
% p(0) = 0, p'(0) = 1, p(2) = 1, p'(2) = -1
% 
% Derivando el polinomio, obtenemos:
% 
% p'(x) = a_1 + 2*a_2*x + 3*a_3*x^2 + ... + k*a_k*x^(k-1)
% 
% Evaluando en los puntos dados, obtenemos el 
% sistema de ecuaciones matriciales:
% [1  0  0  ...  0]         [a_0]   [0]
% [0  1  0  ...  0]         [a_1]   [1]
% [1  2  4  ...  2^k]       [a_2]   [1]
% [0  1  4  ...  k*2^(k-1)] [a_k]   [-1]

% b) Grado del polinomio

% Para que la solución sea única, el sistema debe tener una 
% solución única. Esto ocurre cuando el rango de la matriz 
% es igual al número de incógnitas, es decir, k+1. 
% En este caso, la matriz tiene 4 filas y k+1 columnas, 
% por lo que debemos tener k+1 = 4, es decir, k = 3. 
% 
% Por lo tanto, el polinomio debe ser de grado 3.

% c) Matriz de Vandermonde confluente (VC)
% 
% La matriz del sistema es una matriz de Vandermonde 
% confluente, que se caracteriza por tener una estructura especial.

A = [1  0  0  0;
     0  1  0  0;
     1  2  4  8;
     0  1  4  12];
b = [0; 1; 1; -1];
x = linsolve(A, b);

% %p = @(x) x.^3*x(1) + x.^2*x(2) + x*x(3) + x(4);
% 
% x0 = 0; x1 = 2;
% f0 = p(x0); fp0 = diff(p, x0);
% f1 = p(x1); fp1 = diff(p, x1);
% 
% fprintf('f(0) = %f, f\',x0 = %f\n', f0, fp0);
% fprintf('f(2) = %f, f\',x1 = %f\n', f1, fp1);


% Definir la función p(x) = a_0 + a_1*x + a_2*x^2 + a_3*x^3
p = @(x) x.^3*x(1) + x.^2*x(2) + x*x(3) + x(4);

% Definir la función dp(x) = derivada de p(x)
dp = @(x) 3*x.^2*x(1) + 2*x*x(2) + x(3);

x0 = 0; x1 = 2;
f0 = p(x0); fp0 = dp(x0);
f1 = p(x1); fp1 = dp(x1);

fprintf('f(0) = %f, f\'(0) = %f\n', f0, fp0);
fprintf('f(2) = %f, f\'(2) = %f\n', f1, fp1);