
%TP2-Ejercicio2e

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

% Resolver sistemas utilizando ambos métodos
fprintf('Sistema a)\n');
x_gaussseidel_a = gauss_seidel(A_a, b_a, tol, max_iter);
x_jacobi_a = jacobi(A_a, b_a, tol, max_iter);
fprintf('Solución Gauss-Seidel: x = [%f; %f; %f]\n', x_gaussseidel_a(1), x_gaussseidel_a(2), x_gaussseidel_a(3));
fprintf('Solución Jacobi: x = [%f; %f; %f]\n', x_jacobi_a(1), x_jacobi_a(2), x_jacobi_a(3));

fprintf('Sistema b)\n');
x_gaussseidel_b = gauss_seidel(A_b, b_b, tol, max_iter);
x_jacobi_b = jacobi(A_b, b_b, tol, max_iter);
fprintf('Solución Gauss-Seidel: x = [%f; %f; %f]\n', x_gaussseidel_b(1), x_gaussseidel_b(2), x_gaussseidel_b(3));
fprintf('Solución Jacobi: x = [%f; %f; %f]\n', x_jacobi_b(1), x_jacobi_b(2), x_jacobi_b(3));

fprintf('Sistema c)\n');
x_gs_c = gauss_seidel(A_c, b_c, tol, max_iter);
x_ja_c = jacobi(A_c, b_c, tol, max_iter);
fprintf('Solución Gauss-Seidel: x = [%f; %f; %f]\n', x_gs_c(1), x_gs_c(2), x_gs_c(3));
fprintf('Solución Jacobi: x = [%f; %f; %f]\n', x_ja_c(1), x_ja_c(2), x_ja_c(3));


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