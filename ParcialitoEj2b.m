%Parcialito n1 10-09-24

%Ejercicio2b

%Limpiamos las variables previas y la ventana de comandos
clc;
clear;

%Seccion 1

% Definimos el número de mallas
%n = 6;
 n = input('Ingrese un valor de n:');

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
disp('La particularidad que presenta la matriz del sistema es que es tridiagonal.');
disp(A);
disp('Matriz b');
disp(b);

% Resolvemos el sistema de ecuaciones

% I = A\b;
% disp(I);

x1 = tri_diagonal_lu_solver(A, b);


disp('Los valores de las corrientes son: ');
disp(x1);


% Definimos las funciones de la factorizacion LU
function [P, L, U] = tri_diagonal_lu(A)
    n = size(A, 1);
    P = eye(n);
    L = zeros(n);
    U = zeros(n);
    
    L(1, 1) = 1;
    U(1, 1) = A(1, 1);
    
    for i = 2:n
        L(i, i-1) = A(i, i-1) / U(i-1, i-1);
        U(i, i) = A(i, i) - L(i, i-1) * U(i-1, i);
        if i < n
            U(i, i+1) = A(i, i+1);
        end
    end
end
% Resolvemos el sistema por factorizacion LU
function x = tri_diagonal_lu_solver(A, b)
    [P, L, U] = tri_diagonal_lu(A);
    Pb = P * b;
    y = forward_substitution(L, Pb);
    x = back_substitution(U, y);
end
% Solucion Ly=b hacia adelante
function y = forward_substitution(L, b)
    n = size(L, 1);
    y = zeros(n, 1);
    y(1) = b(1);
    for i = 2:n
        y(i) = b(i) - L(i, i-1) * y(i-1);
    end
end
%Solucion Ux=y hacia atras
function x = back_substitution(U, y)
    n = size(U, 1);
    x = zeros(n, 1);
    x(n) = y(n) / U(n, n);
    for i = n-1:-1:1
        x(i) = (y(i) - U(i, i+1) * x(i+1)) / U(i, i);
    end
end
