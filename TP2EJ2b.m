%TP2-Ejercicio2b

% Borramos la ventana de comandos y las variables previas
clc
clear

% Resolver un sistema de ecuaciones Ax=b mediante 
% el metodo de iterativo de Gauss-Seidel y factorizacion LU

% Definimos las variables
A = [3 2; 1 2]; %Matriz A 2x2
b = [1; -1]; %Matriz B 2x1
tol = 1e-6; %Indicador de Tolerancia 
max_iter = 100;%Indicador de maximas iteraciones 

% Calcular la factorizacion LU sin usar el comando LU

n = size(A, 1); %obtenemos el tamaño de la matriz A
L = eye(n); %creamos una matriz identidad L de tamaño n x n
U = A; %asignamos la matriz A a U.

for k = 1:n-1 %iteramos sobre cada fila k de la matriz A.
    for i = k+1:n %iteramos sobre cada fila i debajo de la fila k
        L(i, k) = U(i, k) / U(k, k);
        %calculamos el elemento i-esimo de la columna k de L
        U(i, :) = U(i, :) - L(i, k) * U(k, :);
        %actualizamos la fila i de U restandole la contribucion de la fila k.
    end
end

% Calcular la matriz P (permutacion)

%La matriz P se utiliza para almacenar las permutaciones
% realizadas durante la factorizacion LU.

P = eye(n); % creamos una matriz identidad P de tamaño n x n

for k = 1:n-1 % iteramos sobre cada fila k de la matriz A
    if U(k, k) == 0 %si el elemento diagonal k-esimo 
        % de U es cero, se lanza un error, ya que la matriz A es singular
        error('La matriz A es singular');
    end
    [max_val, idx] = max(abs(U(k:n, k)));
    %encontramos el elemento maximo en la columna k de U 
    % a partir de la fila k.
    idx = idx + k - 1;
    %ajustamos el indice para que sea relativo a la fila k.
    U([k idx], :) = U([idx k], :);
    %permutamos las filas k y idx de U.
    P([k idx], :) = P([idx k], :);
    %permutamos las filas k y idx de P
    L([k idx], :) = L([idx k], :);
    %permutamos las filas k y idx de L.
end

% Resolver el sistema Ly = Pb
y = zeros(n, 1); %: creamos un vector y de tamaño n x 1 con ceros.
Pb=P*b; %calculamos el vector Pb permutando el vector b.
y(1) = Pb(1);% asignamos el primer elemento de Pb a y.
for i = 2:n %iteramos sobre cada elemento i del vector y
    y(i) = b(i)/L(i,i)-L(i, 1:i-1)*y(1:i-1)/L(i,i);
    % Calculamos el elemento i-esimo de y utilizando la 
    % formula de sustitucion hacia adelante
end

% Resolver el sistema Ux = y
x_LU = zeros(n, 1);% Creamos un vector x_LU de tamaño n x 1 con ceros.
x_LU(n) = y(n) / U(n, n); %asignamos el ultimo elemento de y a x_LU
for i = n-1:-1:1 % iteramos sobre cada elemento i del vector
    % x_LU en orden decreciente.
    x_LU(i) = (y(i) - U(i, i+1:n)*x_LU(i+1:n)) / U(i, i);

end

% Mostrar resultados
fprintf('Matriz L:\n');
disp(L);
fprintf('Matriz U:\n');
disp(U);
fprintf('Matriz P:\n');
disp(P);
fprintf('Solucion X por factorizacion LU:\n');
disp(x_LU);

%---------------------------------------------- 

% Inicializar la solucion X
x_GaussSeidel = zeros(size(b));

% Calcular la solucion X por el metodo de Gauss-Seidel

for k = 1:max_iter %Este bucle iterara como maximo 
    % max_iter veces. En cada iteracion, actualizaremos la estimacion
    % de la solucion x_GaussSeidel.
    x_old = x_GaussSeidel;
    % Creamos una copia de la estimacion actual x_GaussSeidel y 
    % la almacenamos en x_old. Esto es necesario porque vamos 
    % a actualizar x_GaussSeidel elemento a elemento, y necesitamos
    % mantener un registro de los valores anteriores.
  
   for i = 1:size(A, 1)    % Este bucle iterara sobre cada fila i de la matriz A.
    x_GaussSeidel(i) = (b(i) - A(i, 1:i-1)*x_GaussSeidel(1:i-1) - ...
            A(i, i+1:end)*x_old(i+1:end)) / A(i, i);
% b(i): el elemento i-esimo del vector de la parte derecha b.
% A(i, 1:i-1)*x_GaussSeidel(1:i-1): el producto punto de la fila i-esima
%   de A (excluyendo la columna i-esima) y las estimaciones anteriores 
%   de x_GaussSeidel (hasta el elemento (i-1)-esimo).
% A(i, i+1:end)*x_old(i+1:end): el producto punto de la fila 
%  i-esima de A (excluyendo la columna i-esima) y las estimaciones 
%  anteriores de x_GaussSeidel (desde el elemento (i+1)-esimo hasta el final).
% A(i, i): el elemento diagonal i-esimo de A.
% La expresion completa se divide entre A(i, i) para obtener la estimacion 
%  actualizada de x_GaussSeidel(i).
     
    end
    if norm(x_GaussSeidel - x_old) < tol
        break %Si se cumple la condicion de convergencia, 
        % salimos del bucle exterior utilizando la instruccion 
    end
end

% Mostrar resultados
fprintf('Solucion X por Gauss-Seidel:\n');
disp(x_GaussSeidel);
