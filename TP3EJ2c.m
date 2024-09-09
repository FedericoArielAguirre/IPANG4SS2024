% TP3-Ejercicio2-c

% Borramos la ventana de comandos y las variables previas
clc
clear

n = 10;  % grado del polinomio
x_values = rand(n + 1, 1);  % valores aleatorios para x_i
x_k = 0.5;  % valor arbitrario para evaluar el polinomio

% Llamamos la funcion comparar eficiencia
compare_efficiency(n, x_values, x_k);

function compare_efficiency(n, x_values, x_k)
    a_values = rand(n + 1, 1);  % valores aleatorios para a_i

    % Evaluar polinomio de forma directa
    tic;
    for i = 1:1000
        P_direct = 0;
        for j = 0:n
            P_direct = P_direct + a_values(j + 1) * prod(x_k - x_values(1:j));
        end
    end
    time_direct = toc;

    % Evaluar polinomio de forma anidada
    tic;
    for i = 1:1000
        P_nested = a_values(n + 1);
        for j = n:-1:1
            P_nested = P_nested * (x_k - x_values(j)) + a_values(j);
        end
    end
    time_nested = toc;

    fprintf('Tiempo directo: %f segundos\n', time_direct);
    fprintf('Tiempo anidado: %f segundos\n', time_nested);
    fprintf('Ratio de eficiencia: %f\n', time_direct / time_nested);
end
