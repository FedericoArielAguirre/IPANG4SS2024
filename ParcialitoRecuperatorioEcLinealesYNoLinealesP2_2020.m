%Parcialito: Solucion de Ecuaciones 
% Lineales y No Lineales - 2020

clc
clear

%Problema 2

% Sistema de ecuaciones
A = [2 0.5 4; -0.5 -0.8 -0.5; 1 5 2];
b = [3; -1; 2];

% Inicialización de variables
x = ones(3, 1);  % Initial guess: x = [1, 1, 1]
e = 1;
k = 0;
s = 0.02;

verificar_diagonal_dominante(A)

while e > s
    x_new = zeros(3, 1);
    x_new(1) = (3 - 0.5*x(2) - 4*x(3))/2;
    x_new(2) = (-1 + 0.5*x(1) + 0.5*x(3))/0.8;
    x_new(3) = (2 - x(1) - 5*x(2))/2;
    e = max(abs(x_new - x));
    x = x_new;
    k = k + 1;
end

% Visualización de resultados
fprintf('Solución del sistema:\n');
fprintf('x1 = %f\n', x(1));
fprintf('x2 = %f\n', x(2));
fprintf('x3 = %f\n', x(3));
fprintf('Número de iteraciones: %d\n', k);

% Verificación de diagonal dominante
function verificar_diagonal_dominante(A)
    n = size(A, 1);
    for i = 1:n
        suma = 0;
        for j = 1:n
            if i ~= j
                suma = suma + abs(A(i, j));
            end
        end
        if abs(A(i, i)) <= suma
            disp('La matriz no es diagonal dominante');
            return
        end
    end
    disp('La matriz es diagonal dominante');
end