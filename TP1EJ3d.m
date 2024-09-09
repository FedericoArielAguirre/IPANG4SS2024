% TP1-Ejercicio3d

% Limpiamos la ventana de comandos y las variables previas
clc
clear

% Creamos un vector de prueba de entrada
v = [1; 2; 3; 4];

% Llamamos a la funcion cyclic_columns 
A = cyclic_columns(v);

% Mostramos el resultado
disp(A);

% Definimos la funcion de columnas ciclicas
function A = cyclic_columns(v)
    n = length(v);
    A = zeros(n, n);
    for i = 1:n
        A(:, i) = circshift(v, i-1);
    end
end

% La función cyclic_columns toma como entrada un vector v 
% de longitud n y devuelve la matriz A de columnas ciclicas de orden n.