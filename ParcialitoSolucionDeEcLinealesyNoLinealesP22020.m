%Parcialito: Solucion de Ecuaciones 
% Lineales y No Lineales - 2020

%Problema 2

% Borramos la ventana de comandos y las variables previas
clc
clear

% El sistema de ecuaciones es:
% x1 = (5 + x2)/10 x2 = (4 + x1 + x3)/10 x3 = (4 + x2 + x4)/10 x4 
% = (4 + x3 + x5)/10 x5 = (5 + x4)/10
% 
% El método iterativo es el método de Jacobi. En este método, 
% se utiliza una aproximación inicial para las variables y se
% itera hasta que se alcanza una convergencia. En cada 
% iteración, se calculan los nuevos valores de las variables
% utilizando las ecuaciones del sistema.
% 
% El criterio de paro es que la diferencia 
% absoluta entre los valores actuales y los valores 
% anteriores de las variables sea menor que un valor
% umbral (10^-3 en este caso). Esto se implementa 
% mediante la variable e, que se calcula como la máxima
% diferencia absoluta entre los valores actuales y los
% valores anteriores de las variables


% Solución exacta
x_exacto = [0.55052, 0.50515, 0.50103, 0.50515, 0.55052];

% Código original
e = 1; 
x = zeros (1 ,5); 
y = zeros (1 ,5);
k = 0; 
s = 10^( -3);
while e > s
    y (1) = (5 + x (2))/10;
    y (2) = (4 + x (1) + x (3))/10;
    y (3) = (4 + x (2) + x (4))/10;
    y (4) = (4 + x (3) + x (5))/10;
    y (5) = (5 + x (4))/10;
    f = abs (y (1) - x (1));
    for i = 2:5
        if abs (y( i)-x( i )) > f
            f= abs (y( i)-x (i ));
        end
    end
    e = f ;
    x = y ;
    k = k +1;
end

% Comprobación de la solución
error = norm(x - x_exacto);
if error < 10^(-5)
    disp('La solución es correcta');
else
    disp('La solución no es correcta');
end

% Visualización de resultados
fprintf('Número de iteraciones: %d\n', k);
fprintf('Error: %f\n', error);