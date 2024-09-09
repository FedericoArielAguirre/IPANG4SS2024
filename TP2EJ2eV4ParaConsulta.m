%TP2EJ2V4ParaConsulta

% Borramos la ventana de comandos y las variables previas
clc
clear

% Sistema a)
A_a = [3.8 1.6 0.9; -0.7 5.4 1.6; 1.5 1.1 3.2];
b_a = [15.5; 10.3; 3.5];

% Sistema b)
A_b = [1 0 1; -1 1 0; 1 2 -3];
b_b = [4; 1; -4];

% Sistema c)
A_c = [1 0.5 0.5; 0.5 1 0.5; 0.5 0.5 1];
b_c = [2; 2; 2];

% Tolerancia y número máximo de iteraciones
tol = 1e-6;
max_iter = 100;

fprintf('Sistema a)\n');
if is_diagonally_dominant(A_a)
    fprintf('La matriz es diagonalmente dominante\n');
    x_gaussseidel_a = gauss_seidel(A_a, b_a, tol, max_iter);
    x_jacobi_a = jacobi(A_a, b_a, tol, max_iter);
else
    [A_a_dd, b_a_dd] = make_diagonally_dominant(A_a, b_a);
    fprintf('La matriz no es diagonalmente dominante. Se transforma en diagonalmente dominante\n');
    x_gaussseidel_a = gauss_seidel(A_a_dd, b_a_dd, tol, max_iter);
    x_jacobi_a = jacobi(A_a_dd, b_a_dd, tol, max_iter);
end
fprintf('Solución Gauss-Seidel: x = [%f; %f; %f]\n', x_gaussseidel_a(1), x_gaussseidel_a(2), x_gaussseidel_a(3));
fprintf('Solución Jacobi: x = [%f; %f; %f]\n', x_jacobi_a(1), x_jacobi_a(2), x_jacobi_a(3));

fprintf('Sistema b)\n');
if is_diagonally_dominant(A_b)
    fprintf('La matriz es diagonalmente dominante\n');
    x_gaussseidel_b = gauss_seidel(A_b, b_b, tol, max_iter);
    x_jacobi_b = jacobi(A_b, b_b, tol, max_iter);
else
    [A_b_dd, b_b_dd] = make_diagonally_dominant(A_b, b_b);
    fprintf('La matriz no es diagonalmente dominante. Se transforma en diagonalmente dominante\n');
    x_gaussseidel_b = gauss_seidel(A_b_dd, b_b_dd, tol, max_iter);
    x_jacobi_b = jacobi(A_b_dd, b_b_dd, tol, max_iter);
end
fprintf('Solución Gauss-Seidel: x = [%f; %f; %f]\n', x_gaussseidel_b(1), x_gaussseidel_b(2), x_gaussseidel_b(3));
fprintf('Solución Jacobi: x = [%f; %f; %f]\n', x_jacobi_b(1), x_jacobi_b(2), x_jacobi_b(3));

fprintf('Sistema c)\n');
if is_diagonally_dominant(A_c)
    fprintf('La matriz es diagonalmente dominante\n');
    x_gaussseidel_c = gauss_seidel(A_c, b_c, tol, max_iter);
    x_jacobi_c = jacobi(A_c, b_c, tol, max_iter);
else
    [A_c_dd, b_c_dd] = make_diagonally_dominant(A_c, b_c);
    fprintf('La matriz no es diagonalmente dominante. Se transforma en diagonalmente dominante\n');
    x_gaussseidel_c = gauss_seidel(A_c_dd, b_c_dd, tol, max_iter);
    x_jacobi_c = jacobi(A_c_dd, b_c_dd, tol, max_iter);
end
fprintf('Solución Gauss-Seidel: x = [%f; %f; %f]\n', x_gaussseidel_c(1), x_gaussseidel_c(2), x_gaussseidel_c(3));
fprintf('Solución Jacobi: x = [%f; %f; %f]\n', x_jacobi_c(1), x_jacobi_c(2), x_jacobi_c(3));

% Función para revisar si es diagonalmente dominante
function is_dd = is_diagonally_dominant(A,~)
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
% Función para asegurar diagonal dominancia
function [A, b] = make_diagonally_dominant(A, b)
    n = size(A, 1);
    for i = 1:n
        if abs(A(i, i)) < sum(abs(A(i, [1:i-1, i+1:n])))
            % Buscar una fila para intercambiar
            for j = i+1:n
                if abs(A(j, i)) > sum(abs(A(j, [1:i-1, i+1:n])))
                    % Intercambiar filas i y j
                    A([i, j], :) = A([j, i], :);
                    b([i, j]) = b([j, i]);
                    break;
                end
            end
        end
    end
end

% Método de Gauss-Seidel
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

% Método de Jacobi
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
