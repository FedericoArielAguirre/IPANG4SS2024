% Factorizacion LU - L U vector solucion

% Borramos la ventana de comandos y las variables previas
clc
clear

% Resolver un sistema de ecuaciones Ax=b mediante 
% el metodo de iterativo de Gauss-Seidel y factorizacion LU

% Definimos las variables

A = [-1 1 1 2; 0 -1 1 3; 3 1 -1 1; 0 0 1 1];
b = [5; 2; 0; 2];

% Calcular la factorizacion LU sin usar el comando LU

n = size(A, 1); %obtenemos el tamaño de la matriz A
L = eye(n); %creamos una matriz identidad L de tamaño n x n
U = A; %asignamos la matriz A a U.

for k = 1:n-1 %iteramos sobre cada fila k de la matriz A.
    for i = k+1:n %iteramos sobre cada fila i debajo de la fila k
        L(i, k) = U(i, k) / U(k, k);
        %calculamos el elemento i-esimo de la columna k de L
        U(i, :) = U(i, :) - L(i, k) * U(k, :);
        %actualizamos la fila i de U restandole la 
        % contribucion de la fila k.
    end
end

% Calcular la matriz P (permutacion)

%La matriz P se utiliza para almacenar las permutaciones
% realizadas durante la factorizacion LU.

P = eye(n); % creamos una matriz identidad P de tamaño n x n

for k = 1:n-1 % iteramos sobre cada fila k de la matriz A
    if U(k, k) == 0 %si el elemento diagonal k-esimo 
        %de U es cero se lanza un error ya que la matriz A es singular
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
% U(i, i+1:n): Esto extrae los elementos de la i-ésima fila de U, 
%  comenzando desde la columna (i+1) hasta la última columna (n).
%  Esto se debe a que U es triangular superior, por lo que todos
%  los elementos debajo de la diagonal son cero.
% x_LU(i+1:n): Esto extrae los elementos del vector 
%  solución x_LU, comenzando desde el elemento (i+1) hasta el
%  último elemento (n).
% U(i, i+1:n)*x_LU(i+1:n): Esto calcula el producto escalar de
%  los elementos extraídos de U y x_LU. Esto es equivalente a 
%  calcular la suma de los productos de elementos correspondientes.
% y(i) - ...: Esto resta el resultado del producto escalar del 
%  i-ésimo elemento del vector de la mano derecha y.
% / U(i, i): Esto divide el resultado por el i-ésimo elemento
%  diagonal de U.
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
