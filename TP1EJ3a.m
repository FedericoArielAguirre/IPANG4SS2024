% TP1-Ejercicio3a
clc;
clear;
for k=1:10
    for h=1:10
        if k==h
            A(k,h)=1;
        elseif (k>h) && ~(1>2 || k==h)
            A(k,h)=2./(((k+h).^2)+1);
        else
            A(k,h)=0;
        end
    end
end
disp(A);
% Inicialización
% 
% Se crea una matriz vacía A de tamaño 10x10.
% 
% Bucle exterior
% 
% El bucle exterior for k=1:10 itera sobre las filas de la matriz A, 
% es decir, k toma valores de 1 a 10.
% 
% Bucle interior
% 
% El bucle interior for h=1:10 itera sobre las columnas de la matriz A, 
% es decir, h toma valores de 1 a 10.
% 
% Condicional
% 
% Dentro del bucle interior, se evalúa la condición if k==h. Si se cumple,
% se asigna el valor 1 a la posición (k,h) de la matriz A.
% 
% Si no se cumple la condición anterior, se evalúa la condición 
% elseif (k<h) && ~(1>2 || k==h). Esta condición es un poco más complicada:
% % (k<h) es verdadera si k es menor que h.
% ~(1>2 || k==h) es verdadera si k no es igual a h (ya que 1>2 es falso). 
% La negación ~ invierte el resultado de la expresión.
% Si se cumple esta condición, se asigna el valor 2./(((k+h).^2)+1) 
% a la posición (k,h) de la matriz A. Esta expresión calcula el valor 
% de la función 2 / ((k+h)^2 + 1).
% 
% Asignación por defecto
% 
% Si no se cumple ninguna de las condiciones anteriores,
% se asigna el valor 0 a la posición (k,h) de la matriz A.
% 
% Resultado
% 
% % Al final de la ejecución, la matriz A tendrá la siguiente estructura:
% La diagonal principal (donde k==h) tendrá valores de 1.
% Los elementos debajo de la diagonal principal 
% (donde k<h) tendrán valores calculados según la fórmula 2./(((k+h).^2)+1).
% Los elementos encima de la diagonal principal
% (donde k>h) tendrán valores de 0