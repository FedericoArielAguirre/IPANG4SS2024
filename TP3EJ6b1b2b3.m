%TP3-Ejercicio6-b1b2b3

% Borramos la ventana de comandos y las variables previas
clc
clear

% Defina el número de intervalos
x = [0, 0.25, 0.5, 0.75, 1];  % nudos
f = [1, 3, 5, 4.5, 3];  % valores de la funcion en nudos
n = length(x) - 1;

% Inicialice las matrices y vectores
A = zeros(3*n, 3*n);
b = zeros(3*n, 1);

% Bucle sobre cada intervalo
for i = 1:n
    % Condición de interpolación
    A(3*i-2, 3*i-2) = 1;
    b(3*i-2) = f(i);
    
    % Condición de continuidad
    A(3*i-1, 3*i-2) = 1;
    A(3*i-1, 3*i-1) = -1;
    b(3*i-1) = 0;
    
    % Condición de continuidad de la primera derivada
    A(3*i, 3*i-2) = x(i+1) - x(i);
    A(3*i, 3*i-1) = -(x(i+1) - x(i));
    b(3*i) = 0;
end

% Condiciones de borde
A(1, 1) = 1;
b(1) = f(1);
A(3*n, 3*n) = 1;
b(3*n) = f(n+1);

% Resuelva el sistema de ecuaciones
coeffs = A \ b;

% Extraiga los coeficientes
a = coeffs(1:3:end);
b = coeffs(2:3:end);
c = coeffs(3:3:end);

% Mostramos los coeficientes
fprintf('Coefficients a: ');
fprintf('%f ', a);
fprintf('\nCoefficients b: ');
fprintf('%f ', b);
fprintf('\nCoefficients c: ');
fprintf('%f ', c);
fprintf('\n');


% %La ventaja de escribir
% S_{i}(x)=a_{i}+b_{i}(x−x_{i})+c_{i}(x−x_{i})^{2}
% es que permite una implementación más directa de las 
% condiciones de interpolación, continuidad y continuidad
% de la primera derivada. Esta forma también facilita el
% cálculo de los coeficientes a_{i}, b_{i} y c_{i} utilizando
% un sistema de ecuaciones lineales.




% b2
% ...
% Continuity condition: S_i(x_{i+1}) = S_{i+1}(x_{i+1})
% ...
A(3*i-1, 3*i-2) = 1;
A(3*i-1, 3*i-1) = -1;
b(3*i-1) = 0;

% condicion primera derivada continuidad : S_i'(x_{i+1}) = S_{i+1}'(x_{i+1})
% ...

% A(3*i, 3*i-2) = x(i+1) - x(i);
% A(3*i, 3*i-1) = -(x(i+1) - x(i));
% b(3*i) = 0;

% ...

% b3

% ...
% Compute the coefficients c_i

% c = (b(2:end) - b(1:end-1)) ./ (2 * (x(2:end) - x(1:end-1)));

% Compute the polynomials S_i(x)

% S = @(x, i) f(x(i)) + b(i) * (x - x(i)) + c(i) * (x - x(i)).^2;

% ...