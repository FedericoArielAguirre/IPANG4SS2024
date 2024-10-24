%TP5-Ejercicio6

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definicion de las funciones
f1 = @(x) sqrt(x+1)./x;
f2 = @(x) tan(x).*x.^3;

% Limites de integracion
a1 = 1; b1 = 3;
a2 = -1; b2 = 1;

% Numero de puntos de cuadratura
n_values = 2:5;

% Calculo de las integrales
for n = n_values
    [x, w] = GaussLegendre(n);
    
    % Integral a)
    integral_a = (b1-a1)/2 * sum(w .* f1((b1+a1)/2 + (b1-a1)/2 * x));
    fprintf('Integral a) con n = %d: %.6f\n', n, integral_a);
    
    % Integral b)
    integral_b = (b2-a2)/2 * sum(w .* f2((b2+a2)/2 + (b2-a2)/2 * x));
    fprintf('Integral b) con n = %d: %.6f\n', n, integral_b);
end

function [x, w] = GaussLegendre(n)
    % Computar los nodos y los pesos de Gauss-Legendre
    beta = 0.5 ./ sqrt(1-(2*(1:n-1)).^-2);
    T = diag(beta,1) + diag(beta,-1);
    [V,D] = eig(T);
    x = diag(D);
    [x, ind] = sort(x);
    w = 2 * V(1,ind).^2;
end
