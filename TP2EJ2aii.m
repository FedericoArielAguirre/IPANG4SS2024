%TP2-Ejercicio2aii

% Borramos la ventana de comandos y las variables previas
clc
clear

% Resolver un sistema de ecuaciones Ax=b mediante 
% el metodo de iterativo de Gauss-Seidel

% Definimos las variables
A = [2 1 0; 1 3 1; 0 1 4]; %Matriz A 3x3
b = [10; 20; 30]; %Matriz B 3x1
tol = 1e-6; %Indicador de Tolerancia 
max_iter = 100;%Indicador de maximas iteraciones 
% Calculamos el valor x
x = gauss_seidel(A, b, tol, max_iter);
% Mostramos los resultados
disp('Solucion x:');
disp(x);
% Definimos la funcion de Gauss-Seidel
function x = gauss_seidel(A, b, tol, max_iter)
    % Inicializar la solución x con ceros
    x = zeros(size(A, 2), 1);
    % Iterar hasta que se alcanza la tolerancia o se supera
    % el número máximo de iteraciones
    for i = 1:max_iter
        % Iterar sobre las filas de A
        for j = 1:size(A, 2)
            % Calcular la suma de los términos 
            % fuera de la diagonal
            sum = 0;
            for k = 1:j-1
                sum = sum + A(j, k) * x(k);
            end
            for k = j+1:size(A, 2)
                sum = sum + A(j, k) * x(k);
            end
            % Calcular la nueva solución x utilizando 
            % el método de Gauss-Seidel
            x(j) = (b(j) - sum) / A(j, j);
        end
        % Verificar si se ha alcanzado la tolerancia
        if norm(A * x - b) < tol
            break
        end
    end
end