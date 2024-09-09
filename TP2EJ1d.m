%TP2-Ejercicio1d

% Borramos la ventana de comandos y las variables previas
clc
clear

%Definimos las matrices a trabajar
A = [2 2 0 0 0 0; 1 5 4 0 0 0; 0 4 8 4 0 0; 0 0 6 8 6 0; 0 0 0 6 4 3; 0 0 0 0 4 9];
b1 = [4; 10; 16; 20; 13; 13];
b2 = [8; 20; 32; 40; 26; 26];
b3 = [12; 30; 48; 60; 39; 39];

%Definimos lo que vamos a calcular
x1 = tri_diagonal_lu_solver(A, b1);
x2 = tri_diagonal_lu_solver(A, b2);
x3 = tri_diagonal_lu_solver(A, b3);
 
% Mostramos los resultados
disp('Solucion vector x1:');
disp(x1);

disp('Solucion vector x2:');
disp(x2);

disp('Solucion vector x3:');
disp(x3);

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

function x = tri_diagonal_lu_solver(A, b)
    [P, L, U] = tri_diagonal_lu(A);
    Pb = P * b;
    y = forward_substitution(L, Pb);
    x = back_substitution(U, y);
end

function y = forward_substitution(L, b)
    n = size(L, 1);
    y = zeros(n, 1);
    y(1) = b(1);
    for i = 2:n
        y(i) = b(i) - L(i, i-1) * y(i-1);
    end
end

function x = back_substitution(U, y)
    n = size(U, 1);
    x = zeros(n, 1);
    x(n) = y(n) / U(n, n);
    for i = n-1:-1:1
        x(i) = (y(i) - U(i, i+1) * x(i+1)) / U(i, i);
    end
end
