%TP5-Ejercicio6cd

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definicion de las funciones
f3 = @(x) exp(-1) ./ sqrt(1 - x.^2);
f4 = @(x) cos(x) ./ sqrt(pi^2 - x.^2);

% Limites de integracion
a3 = -1; b3 = 1;
a4 = 0; b4 = pi;

% Revisar que metodo conviene con cada integral

% Numero de puntos de cuadratura
n_values = 2:5;

% Calculo de las integrales
for n = n_values
    [x, w] = GaussLegendre(n);
    
    % Integral c)
    integral_c = (b3-a3)/2 * sum(w .* f3((b3+a3)/2 + (b3-a3)/2 * x));
    fprintf('Integral c) con n = %d: %.6f\n', n, integral_c);
    
    % Integral d)
    integral_d = (b4-a4)/2 * sum(w .* f4((b4+a4)/2 + (b4-a4)/2 * x));
    fprintf('Integral d) con n = %d: %.6f\n', n, integral_d);
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
