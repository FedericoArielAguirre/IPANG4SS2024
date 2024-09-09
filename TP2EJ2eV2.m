%TP2-Ejercicio2e

%Version 2

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definimos los sistemas de ecuaciones
A_a = [3.8 1.6 0.9; -0.7 5.4 1.6; 1.5 1.1 3.2];
b_a = [15.5; 10.3; 3.5];

A_b = [1 0 1; -1 1 0; 1 2 -3];
b_b = [4; 1; -4];

A_c = [1 0.5 0.5; 0.5 1 0.5; 0.5 0.5 1];
b_c = [2; 2; 2];

% Resolvemos los sistemas de ecuaciones
tol = 1e-6; % Definimos el valor de la tolerancia
max_iter = 100; % Definimos el valor de las iteraciones

for i = 1:3
    switch i
        case 1
            A = A_a;
            b = b_a;
        case 2
            A = A_b;
            b = b_b;
        case 3
            A = A_c;
            b = b_c;
    end
    
    if is_diagonally_dominant(A)
        fprintf('Sistema %d es diagonalmente dominante\n', i);
    else
        A_dd = make_diagonally_dominant(A);
        fprintf('Sistema %d no es diagonalmente dominante, se transformo la matriz\n', i);
        fprintf('Matriz transformada:\n');
        disp(A_dd);
        A = A_dd;
    end
    
    x_gs = gauss_seidel(A, b, tol, max_iter);
    x_ja = jacobi(A, b, tol, max_iter);
    
    fprintf('Solucion Gauss-Seidel: x = [%f; %f; %f]\n', x_gs(1), x_gs(2), x_gs(3));
    fprintf('Solucion Jacobi: x = [%f; %f; %f]\n', x_ja(1), x_ja(2), x_ja(3));
end

% Funcion para revisar si es diagonalmente dominante:
function is_dd = is_diagonally_dominant(A)
    is_dd = true;
    for i = 1:size(A, 1)
        sum = 0;
        for j = 1:size(A, 2)
            if i ~= j
                sum = sum + abs(A(i, j));
            end
        end
        if abs(A(i, i)) <= sum
            is_dd = false;
            break
        end
    end
end

% Funcion para transformar una matriz no dominante en una dominante
function A_dd = make_diagonally_dominant(A)
    A_dd = A;
    for i = 1:size(A, 1)
        % Buscar la fila con el mayor valor absoluto en la columna i
        [~, idx] = max(abs(A(:, i)));
        
        % Intercambiar la fila actual con la fila encontrada
        A_dd([i, idx], :) = A_dd([idx, i], :);
        
        % Verificar si la fila es diagonalmente dominante
        if sum(abs(A_dd(i, :))) - abs(A_dd(i, i)) >= abs(A_dd(i, i))
            % Si no es diagonalmente dominante, sumar la suma de los valores absolutos de los elementos no diagonales al elemento diagonal
            A_dd(i, i) = A_dd(i, i) + sum(abs(A_dd(i, :))) - abs(A_dd(i, i));
        end
    end
end

% Funcion para resolver un sistema de ecuaciones usando Gauss-Seidel
function x = gauss_seidel(A, b, tol, max_iter)
    x = zeros(size(A, 2), 1);
    for i = 1:max_iter
        for j = 1:size(A, 2)
            sum = 0;
            for k = 1:j-1
                sum = sum + A(j, k) * x(k);
            end
            for k = j+1:size(A, 2)
                sum = sum + A(j, k) * x(k);
            end
            x(j) = (b(j) - sum) / A(j, j);
        end
        if norm(A * x - b) < tol
            break
        end
    end
end

% Funcion para resolver un sistema de ecuaciones usando Jacobi
function x = jacobi(A, b, tol, max_iter)
    x = zeros(size(A, 2), 1);
    D = diag(A);
    R = A - diag(D);
    for i = 1:max_iter
        x_new = (b - R * x) ./ D;
        if norm(x_new - x) < tol
            break
        end
        x = x_new;
    end
end
