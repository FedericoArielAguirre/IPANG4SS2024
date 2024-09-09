%TP2EJ2eV3ParaConsulta


clc
clear
% Definir los sistemas de ecuaciones
A1 = [3.8, 1.6, 0.9; -0.7, 5.4, 1.6; 1.5, 1.1, 3.2];
b1 = [15.5; 10.3; 3.5];

A2 = [1 0 1; -1 1 0; 1 2 -3];
b2 = [4; 1; -4];

A3 = [1 0.5 0.5; 0.5 1 0.5; 0.5 0.5 1];
b3 = [2; 2; 2];

% Tolerancia y número máximo de iteraciones
tol = 1e-6;
max_iter = 100;

% Resolver los sistemas
[x1_gs, x1_jacobi] = resolver_sistemas(A1, b1, tol, max_iter);
[x2_gs, x2_jacobi] = resolver_sistemas(A2, b2, tol, max_iter);
[x3_gs, x3_jacobi] = resolver_sistemas(A3, b3, tol, max_iter);

disp(x1_jacobi);
disp(x1_gs);

disp(x2_jacobi);
disp(x2_gs);
disp(x3_jacobi);
disp(x3_gs);


% Función para resolver sistemas de ecuaciones lineales
function [x_gs, x_jacobi] = resolver_sistemas(A, b, tol, max_iter)
    % Verificar diagonal dominancia y reordenar filas si es necesario
    [A, b] = asegurar_diagonal_dominante(A, b);
    
    % Inicializar soluciones
    n = length(b);
    x_gs = zeros(n, 1);
    x_jacobi = zeros(n, 1);
    
    % Método de Gauss-Seidel
    x_gs = gauss_seidel(A, b, x_gs, tol, max_iter);
    
    % Método de Jacobi
    x_jacobi = jacobi(A, b, x_jacobi, tol, max_iter);
end

% Función para asegurar diagonal dominancia
function [A, b] = asegurar_diagonal_dominante(A, b)
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

% Función de Gauss-Seidel
function x = gauss_seidel(A, b, x0, tol, max_iter)
    x = x0;
    for i = 1:max_iter
        for j = 1:size(A, 2)
            sum = 0;
            for k = 1:j-1
                sum = sum + A(j, k) * x(k);
            end
            for k = j+1:size(A, 2)

                sum = sum + A(j, k) * x0(k);
            end
            x(j) = (b(j) - sum) / A(j, j);
        end
        if norm(A * x - b) < tol
            break
        end
        x0 = x;
    end
end

% Función de Jacobi
function x = jacobi(A, b, x0, tol, max_iter)
    x = x0;
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