%TP5-Ejercicio6ef

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definicion de las funciones transformadas
f5 = @(x) exp(-(1 + x) + sin(1 + x)); % Para la integral de 2 a infinito
f6 = @(x) exp(-x.^2) ./ sqrt(4 + x.^2); % Para la integral de -infinito a infinito

% Limites de integracion
a5 = 0; b5 = 1; % Transformacion de 2 a infinito a un intervalo finito
a6 = -1; b6 = 1; % Para integral simetrica en -infinito a infinito

% Numero de puntos de cuadratura
n_values = 2:5;

% Calculo de las integrales
for n = n_values
    [x, w] = GaussLegendre(n);
    
    % Integral e)
    integral_e = sum(w .* f5((b5+a5)/2 + (b5-a5)/2 * x)) * (b5-a5)/2;
    fprintf('Integral e) con n = %d: %.6f\n', n, integral_e);
    
    % Integral f)
    integral_f = sum(w .* f6((b6+a6)/2 + (b6-a6)/2 * x)) * (b6-a6)/2;
    fprintf('Integral f) con n = %d: %.6f\n', n, integral_f);
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
