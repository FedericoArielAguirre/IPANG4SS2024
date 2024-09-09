%TP3-Ejercicio1-d

% Borramos la ventana de comandos y las variables previas
clc
clear
% Conjunto de puntos
x = [0, 0.25, 0.5, 0.75, 1];
y = [1, 3, 5, 4.5, 3];

% Número de puntos
n = length(x);

% Tabla de diferencias divididas
D = zeros(n, n);
D(:, 1) = y;
for j = 2:n
    for i = 1:n-j+1
        D(i, j) = (D(i+1, j-1) - D(i, j-1)) / (x(i+j-1) - x(i));
    end
end

% Mostrar la tabla de diferencias divididas
fprintf('Tabla de diferencias divididas:\n');
for i = 1:n
    for j = 1:n-i+1
        fprintf('%f ', D(i, j));
    end
    fprintf('\n');
end

% Polinomio interpolante
p = @(x) D(1, 1);
for i = 2:n
    p = @(x) p(x) + D(1, i) * prod(x - x(1:i-1));
end

% Graficar el polinomio interpolante
xx = 0:0.01:1;
yy = p(xx);
figure;
plot(xx, yy, 'b-', x, y, 'ro');
xlabel('x');
ylabel('f(x)');
title('Polinomio interpolante');
grid on;