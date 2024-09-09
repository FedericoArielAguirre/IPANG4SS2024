%TP2-Ejercicio2ai

% Borramos la ventana de comandos y las variables previas
clc
clear
% Resolver un sistema de ecuaciones Ax=b mediante 
% el metodo de iterativo de Jacobi
% Definimos las variables
A = [2 1 0; 1 3 1; 0 1 4]; %Matriz A
b = [10; 20; 30]; %Matriz B
tol = 1e-6; %Indicador de Tolerancia 
max_iter = 100;%Indicador de maximas iteraciones 
% Calculamos el valor x
x = jacobi(A, b, tol, max_iter);
% Mostramos los resultados
disp('Solucion x:');
disp(x);
% Definimos la funcion Jacobi
function x = jacobi(A, b, tol, max_iter)
    % Inicializar la solución x con ceros
    x = zeros(size(A, 2), 1);
    % Calcular la diagonal de A
    D = diag(A);
    % Calcular la matriz R = A - D
    R = A - diag(D);
    % Iterar hasta que se alcanza la tolerancia 
    % o se supera el número máximo de iteraciones
    for i = 1:max_iter
        % Calcular la nueva solución x utilizando el método de Jacobi
        x_new = (b - R * x) ./ D;
        % Verificar si se ha alcanzado la tolerancia
        if norm(x_new - x) < tol
            break
        end
        % Actualizar la solución x
        x = x_new;
    end
end