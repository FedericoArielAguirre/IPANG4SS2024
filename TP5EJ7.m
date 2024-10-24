%TP5-Ejercicio7

% Borramos la ventana de comandos y las variables previas
clc
clear

% Leer las coordenadas del archivo txt
coordenadas = load('vertedero.txt');

% Definir la función de la curva
f = @(x) interp1(coordenadas(:, 1), coordenadas(:, 2), x, 'linear', 'extrap');

% Seleccionar los puntos de Gauss-Legendre
puntos = gauss_legendre(12);

% Calcular los pesos de Gauss-Legendre
pesos = gauss_legendre_peso(12);

% Aproximar la integral
area = 0;
for i = 1:12
    area = area + pesos(i) * f(puntos(i));
end

% Multiplicar por la longitud del vertedero
volumen = area * 30;

% Mostrar el resultado
fprintf("El volumen es: %.3f\n",volumen);

function puntos = gauss_legendre(n)
    % Esta función devuelve los puntos de Gauss-Legendre para n puntos.
    puntos = zeros(n, 1); % Inicializar el vector de puntos
    for k = 1:n
        % Inicializar una aproximación inicial
        x0 = cos(pi * (k - 0.25) / (n + 0.5));
        % Método de Newton-Raphson
        for j = 1:100 % Iteraciones máximas
            P0 = 1;
            P1 = x0;
            for i = 2:n
                P2 = ((2*i - 1) * x0 * P1 - (i - 1) * P0) / i; % Polinomio de Legendre
                P0 = P1;
                P1 = P2;
            end
            % Derivada del polinomio de Legendre
            dP = n * (x0 * P1 - P0) / (x0^2 - 1);
            if abs(dP) < 1e-10 % Evitar división por cero
                break;
            end
            % Actualizar la aproximación
            x1 = x0 - P1 / dP;
            if abs(x1 - x0) < 1e-10 % Criterio de convergencia
                break;
            end
            x0 = x1;
        end
        puntos(k) = x0; % Guardar el punto encontrado
    end
end

function pesos = gauss_legendre_peso(n)
    % Esta función devuelve los pesos de Gauss-Legendre para n puntos.
    puntos = gauss_legendre(n); % Obtener los puntos
    pesos = zeros(n, 1); % Inicializar el vector de pesos

    for k = 1:n
        % Derivada del polinomio de Legendre
        P0 = 1;
        P1 = puntos(k);
        for i = 2:n
            P2 = ((2*i - 1) * puntos(k) * P1 - (i - 1) * P0) / i;
            P0 = P1;
            P1 = P2;
        end
        dP = n * (puntos(k) * P1 - P0) / (puntos(k)^2 - 1);
        if abs(dP) < 1e-10 % Evitar división por cero
            pesos(k) = 0;
        else
            pesos(k) = 2 / (dP^2); % Calcular el peso
        end
    end
end