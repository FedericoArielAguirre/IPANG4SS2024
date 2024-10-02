%TP4-Ejercicio6

% Borramos la ventana de comandos y las variables previas
clc
clear


% a)
% Es posible realizar un ajuste lineal a un conjunto de 
% puntos de una función con forma de Campana Gaussiana.

% Falsa.
 
% Una función con forma de Campana Gaussiana no es lineal,
% por lo que no es posible realizar un ajuste lineal a un 
% conjunto de puntos de esta función. El ajuste lineal se
% utiliza para funciones que pueden ser aproximadas por 
% una recta, lo que no es el caso de una función con 
% forma de Campana Gaussiana.
 
% b) 
% Si se cuenta con un conjunto de puntos
% (x_i, y_i) i = 1, . . . , n, la constante
% (polinomio de grado cero) que minimiza el error 
% cuadrático medio viene dada por c = y/(n + 1), 
% en donde y es el promedio de los valores de ordenada de los datos.
 
% Falsa.
 
% La constante que minimiza el error cuadrático
% medio es el promedio de los valores de ordenada
% de los datos, no la constante c = y/(n + 1).
% El promedio de los valores de ordenada de los datos se calcula como:
% y_promedio = (1/n) * ∑(y_i) 
% donde n es el número de puntos de datos.
 
% c)
% El método de mínimos cuadrados no permite contemplar 
% errores en la adquisición de datos de abscisa, solo de ordenada.
 
% Verdadera.
 
% El método de mínimos cuadrados se utiliza para ajustar un
% modelo a un conjunto de puntos de datos, asumiendo que los 
% errores se encuentran solo en la ordenada (y). No se 
% consideran errores en la abscisa (x). Esto se debe a que el
% método de mínimos cuadrados se basa en la minimización del error
% cuadrático medio en la ordenada, lo que no permite
% contemplar errores en la abscisa.
 
% Sin embargo, existen métodos que permiten considerar
% errores en la abscisa, como el método de mínimos
% cuadrados totales, que se utiliza para ajustar un
% modelo a un conjunto de puntos de datos, considerando
% errores en tanto la ordenada como la abscisa.