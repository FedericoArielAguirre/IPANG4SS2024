%TP2-Ejercicio2c

% Borramos la ventana de comandos y las variables previas
clc
clear

% Considere una barra de metal de 10m de longitud que es sometida 
% a una fuente de calor en un% extremo por un tiempo determinado. 
% Al cabo de ese tiempo, la fuente de calor cesa y se miden
% temperaturas de 10◦C y 200◦C en ambos extremos. Se desea encontrar
% la temperatura en los puntos intermedios x1, x2, x3 y x4 ubicados
% a 2m equidistantes unos de otros. Asumiendo que latemperatura
% en cada punto es el promedio de las temperaturas medidas
% en los puntos vecinos,


% Definimos las matrices
A = [2 -1 0 0; -1 2 -1 0; 0 -1 2 -1; 0 0 -1 2]; %Matriz longitud barra A
b = [10; 0; 0; 200]; %Matriz b con temperaturas

% Definimos las variables
tol = 1e-6;
max_iter = 100;

% Metodo de Jacobi
D = diag(A);
R = A - diag(D);
x_jacobi = zeros(4, 1);
%tol = 1e-6;
%max_iter = 100;

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

x_gauusseidel = zeros(4, 1);
%tol = 1e-6;
%max_iter = 100;

for i = 1:max_iter
    for j = 1:4
        sum = 0;
        for k = 1:j-1
            sum = sum + A(j, k) * x_gauusseidel(k);
        end
        for k = j+1:4
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
