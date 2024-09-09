%TP1-Ejercicio5

clc
clear

% a) ¿Por qué es necesario hacer esta aproximación?
% 
% Es necesario hacer esta aproximación porque la serie infinita no puede 
% ser evaluada exactamente en un número finito de pasos. La serie infinita
% tiene un número infinito de términos, y cada término contribuye a la suma
% total. Sin embargo, en la práctica, no podemos sumar un número infinito
% de términos, por lo que debemos aproximarnos a la suma total mediante la
% suma de un número finito de términos.

% b) ¿Qué criterio adoptaría para decidir hasta qué valor de N es necesario 
% desarrollar la sumatoria para que el resultado se aproxime 
% lo suficiente al resultado verdadero?
% 
% Un criterio común para decidir hasta qué valor de N es necesario
% desarrollar la sumatoria es utilizar un criterio de convergencia, como la
% diferencia entre la suma parcial actual y la suma parcial anterior. 
% Por ejemplo, podemos detener la suma cuando la diferencia entre la suma
% parcial actual y la suma parcial anterior sea menor que un cierto valor 
% de tolerancia, como 1e-6

% c) algoritmo de aproximación

% llamamos a la funcion usando
approx_sum = approximate_series(0.9, 1e-6);
fprintf('Aproximación de la suma de la serie: %f\n', approx_sum);

function approx_sum = approximate_series(r, tol)
    % Inicializar la suma parcial y el número de términos
    sum_partial = 0;
    n = 1;
    
    % Inicializar la diferencia entre la suma parcial actual y la suma parcial anterior
    diff = Inf;
    
    % Loop hasta que la diferencia sea menor que la tolerancia
    while diff > tol
        % Calcular el término actual
        term = r^n;
        
        % Actualizar la suma parcial
        sum_partial_old = sum_partial;
        sum_partial = sum_partial + term;
        
        % Calcular la diferencia entre la suma parcial actual y la suma parcial anterior
        diff = abs(sum_partial - sum_partial_old);
        
        % Incrementar el número de términos
        n = n + 1;
    end
    
    % Asignar el resultado aproximado
    approx_sum = sum_partial;
end


%llamamos a la funcion usando
% approx_sum = approximate_series(0.9, 1e-6);
% fprintf('Aproximación de la suma de la serie: %f\n', approx_sum);