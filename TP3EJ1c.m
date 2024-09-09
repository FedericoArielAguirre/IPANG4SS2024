%TP3-Ejercicio1-c

% Borramos la ventana de comandos y las variables previas
clc
clear

% Conjunto de puntos
x = [0, 0.25, 0.5, 0.75, 1];
y = [1, 3, 5, 4.5, 3];

% Número de puntos
n = length(x);

% Polinomios de Lagrange
for i = 1:n
    L{i} = @(x) 1;
    for j = 1:n
        if i ~= j
            L{i} = @(x) L{i}(x) .* (x - x(j)) ./ (x(i) - x(j));
        end
    end
end

% Graficar los polinomios de Lagrange
xx = 0:0.01:1;
figure;
for i = 1:n
    yy = L{i}(xx);
    plot(xx, yy);
    hold on;
end
xlabel('x');
ylabel('L_{n,i}(x)');
title('Polinomios de Lagrange');
grid on;

% Verificar la propiedad
for i = 1:n
    for k = 1:n
        if i ~= k
            assert(abs(L{i}(x(k))) < 1e-6, 'La propiedad no se cumple');
        else
            assert(abs(L{i}(x(k)) - 1) < 1e-6, 'La propiedad no se cumple');
        end
    end
end

% Polinomio interpolante
p = @(x) 0;
for i = 1:n
    p = @(x) p(x) + y(i) .* L{i}(x);
end

% Graficar el polinomio interpolante
yy = p(xx);
figure;
plot(xx, yy, 'b-', x, y, 'ro');
xlabel('x');
ylabel('f(x)');
title('Polinomio interpolante');
grid on;