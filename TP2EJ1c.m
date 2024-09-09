%TP2-Ejercicio1c

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definimos las matrices A y b
A1 = [0, 1, 2; 1, 2, 3; 2, 3, 2];
A2 = [2, 0, 10; 0, 3, 2; 1, 2, 4];
A3 = [1, 2, 1; 2, 0, -2; -1, 2, 3];
b1 = [2; 4; 5];
b2 = [4; 12; 17];
b3 = [1; -2; 3];
P=[0,1,0;1,0,0;0,0,1];
P2=[1 0 0;0 0 1;0 1 0];
A3=P2*P*A3; b3=P2*P*b3;
% Resolvemos los sistemas de ecuaciones
[l1, u1, p1] = lu_factorization(A1);
x1 = solve_lu(l1, u1, p1, b1);

[l2, u2, p2] = lu_factorization(A2);
x2 = solve_lu(l2, u2, p2, b2);

[l3, u3, p3] = lu_factorization(A3);
x3 = solve_lu(l3, u3, p3, b3);

% Mostramos los resultados
% fprintf('Matriz A1:\n');
% disp(A1);
% fprintf('Vector b1:\n');
% disp(b1);
fprintf('Vectores de factorizacion LU: l1, u1, p1:\n');
disp(l1);
disp(u1);
disp(p1);
fprintf('Vector solucion x1:\n');
disp(x1);

% fprintf('\nMatriz A2:\n');
% disp(A2);
% fprintf('Vector b2:\n');
% disp(b2);
fprintf('Vectores de factorizacion LU: l2, u2, p2:\n');
disp(l2);
disp(u2);
disp(p2);
fprintf('Vector solucion x2:\n');
disp(x2);

% fprintf('\nMatriz A3:\n');
% disp(A3);
% fprintf('Vector b3:\n');
% disp(b3);
fprintf('Vectores de factorizacion LU: l3, u3, p3:\n');
disp(l3);
disp(u3);
disp(p3);
fprintf('Vector solucion x3:\n');
disp(x3);

% Definimos la funcion para la factorizacion LU con pivoteo parcial
function [l, u, p] = lu_factorization(A)
    n = size(A, 1);
    l = zeros(n);
    u = A;
    p = eye(n);
    
    for k = 1:n-1
        [~, idx_max] = max(abs(u(k:n, k))); %
        idx_max = idx_max + k - 1;
        
        % Intercambiamos las filas k e idx_max en u y p
        u([k, idx_max], :) = u([idx_max, k], :);
        p([k, idx_max],:) = p([idx_max, k],:);
        l([k, idx_max], :) = l([idx_max, k], :);
        
        % Revisamos si la matriz es singular
        if abs(u(k, k)) < eps
            error('La matriz es singular');
        end
        
        % Actualizamos l
        l(k+1:n, k) = u(k+1:n, k) / u(k, k);
        
        % Actualizamos u
        u(k+1:n, k+1:n) = u(k+1:n, k+1:n) - l(k+1:n, k) * u(k, k+1:n);
    end
    l=l+eye(n);
end

% Definimos la funcion para resolver el sistema mediante la factorizacion LU
function x = solve_lu(l, u, p, b)
    n = size(l, 1);
    x = zeros(n, 1);
    y = zeros(n, 1);
    b=p*b;
    % Resolvemos Ly = Pb
    y(1) = b(1);
    for i = 2:n
        y(i) = (b(i) - l(i, 1:i-1) * y(1:i-1)) / l(i,i);
    end
    % Resolvemos Ux = y
    x(n) = y(n) / u(n, n);
    for i = n-1:-1:1
        x(i) = (y(i) - u(i, i+1:n) * x(i+1:n)) / u(i, i);
    end
end
