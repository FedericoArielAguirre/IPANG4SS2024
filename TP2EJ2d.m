%TP2-Ejercicio2d

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definimos las matrices
A = [1 -5; 7 -1]; %Matriz A 2x2
b = [-4; 6]; %Matriz b 2x1

% Metodo de Jacobi
D = diag(A);
R = A - diag(D);

x_jacobi = zeros(2, 1);
tol = 1e-6;
max_iter = 100;

% Bucle hasta que se alcanza la tolerancia
for i = 1:max_iter
    x_new = (b - R * x_jacobi) ./ D;
    if norm(x_new - x_jacobi) < tol
        break
    end
    x_jacobi = x_new;
end
 % Mostramos los resultados
 disp("La solución por el metodo de Jacobi es:");
 disp(x_jacobi);

 % Metodo de Gauss-Seidel

x_gauusseidel = zeros(2, 1);
tol = 1e-6;
max_iter = 10;

for i = 1:max_iter
    for j = 1:3
        sum = 0;
        for k = 1:j-1
            sum = sum + A(j, k) * x_gauusseidel(k);
        end
        for k = j+1:1
            sum = sum + A(j, k) * x_gauusseidel(k);
        end
        x_gauusseidel(j) = (b(j) - sum) / A(j, j);
    end
    if norm(A * x_gauusseidel - b) < tol
        break
    end
end
 % Mostramos los resultados
 disp("La solución por el metodo de Gauss-Seidel es:");
 disp(x_gauusseidel);