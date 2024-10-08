%TP3-Ejercicio1-d

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definir los puntos dados
x = [0, 0.25, 0.5, 0.75, 1];
f = [1, 3, 5, 4.5, 3];

% Calcular la tabla de diferencias divididas
n = length(x);
diff_div = zeros(n, n);
diff_div(:, 1) = f';

for i = 2:n
    for j = 2:i
        diff_div(i, j) = (diff_div(i, j-1) - diff_div(i-1, j-1)) / (x(i) - x(i-j+1));
    end
end

% Mostrar la tabla de diferencias divididas
fprintf('Tabla de diferencias divididas:\n');
disp(diff_div);

% Construir el polinomio interpolante de Newton
p = diff_div(1, 1);
for i = 2:n
    term = diff_div(i, i);
    for j = 1:i-1
        term = conv(term, [1, -x(j)]);
    end
    p = [zeros(1, length(term) - length(p)), p] + [zeros(1, length(p) - length(term)), term];
end

% Mostrar el polinomio interpolante
fprintf('Polinomio interpolante: ');
disp(p);

% Graficar el polinomio interpolante
xx = 0:0.01:1;
yy = polyval(p, xx);
plot(xx, yy);
hold on;
plot(x, f, 'ro'); % Puntos originales
xlabel('x');
ylabel('f(x)');
title('Polinomio interpolante de Newton');
legend('Polinomio interpolante', 'Puntos originales');
grid on;
