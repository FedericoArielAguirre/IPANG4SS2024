%ParcialitoRecuperatorioSistemasEcLinealesYNoLineales
%09-Feb-20

%Limpiamos las variables previas y la ventana de comandos
clc; 
clear;

% a) Mencione las caracteristicas de los sistemas de 
% resolucion directos e iterativos


% Resolución exacta
% Los métodos directos proporcionan 
% una solución exacta del sistema de ecuaciones lineales
% siempre y cuando la matriz del sistema sea no singular.

% No requieren iteraciones: Los métodos directos no requieren 
% iteraciones para obtener la solución, sino que proporcionan 
% la solución directamente a través de una serie de operaciones 
% algebraicas.
% Costo computacional alto: Los métodos directos pueden ser
% costosos en términos de tiempo y memoria computacional, 
% especialmente para sistemas grandes.
% No son adecuados para sistemas muy grandes: Debido a su costo
% computacional alto, los métodos directos no son adecuados 
% para sistemas muy grandes.
% Ejemplos de métodos directos: Algunos ejemplos de métodos directos
% son la eliminación gaussiana, la factorización LU y la 
% factorización Cholesky.

% Métodos iterativos
% 
% Resolución aproximada: Los métodos iterativos proporcionan una
% solución aproximada del sistema de ecuaciones lineales, que se 
% refina iterativamente hasta alcanzar un nivel de precisión deseado.
% Requieren iteraciones: Los métodos iterativos requieren iteraciones
% para obtener la solución, lo que puede ser costoso en términos de
% tiempo computacional.
% Costo computacional bajo: Los métodos iterativos pueden ser más
% eficientes en términos de tiempo y memoria computacional que
% los métodos directos, especialmente para sistemas grandes.
% Adecuados para sistemas muy grandes: Debido a su costo computacional
% bajo, los métodos iterativos son adecuados para sistemas muy grandes.
% Ejemplos de métodos iterativos: Algunos ejemplos de métodos iterativos
% son el método de Jacobi y el método de Gauss-Seidel. 




% b) Dado el sistema de ecuaciones 
% Resuelva mediante el metodo de factorizacion LU 
% Para la factorizacion debe emplear la funcion lu

% Definimos la matriz B
B=[-1 11 -1 3; 2 -1 10 -1; 10 -1 2 0; 0 3 -1 8];

% Encontramos la factorización LU de A
[L1, U1, P1] = lu(B);

% Mostramos los resultados
fprintf('Matriz L por comando LU:\n');
disp(L1);
fprintf('Matriz U por comando LU:\n');
disp(U1);
fprintf('Matriz P por comando LU:\n');
disp(P1);


% c) ¿Que ventajas ofrece la factorizacion LU
% como método de resolucion de sistemas de ecuaciones?
 
% la factorización LU como método de resolución de sistemas
% de ecuaciones lineales que ofrece varias ventajas, como la
% resolución eficiente, la no inversión de matrices, la estabilidad
% numérica y la facilidad de implementación.



% 2) Resolucion de ecuaciones no lineales
% a) Mencione las caracteristicas de los
% metodos de resolucion cerrados y abiertos

% Métodos de resolución cerrados
% 
% Solución única: Los métodos de resolución cerrados proporcionan
% una solución única y exacta al problema.
% Algoritmo definido: Los métodos de resolución cerrados siguen
% un algoritmo definido y preciso para obtener la solución.
% No requiere creatividad: Los métodos de resolución cerrados 
% no requieren creatividad o pensamiento crítico para obtener 
% la solución.
% Solución determinista: Los métodos de resolución cerrados 
% proporcionan una solución determinista, es decir, la solución
% es única y no depende de la interpretación o la subjetividad.
% Ejemplos de métodos de resolución cerrados: Algunos ejemplos
% de métodos de resolución cerrados son la resolución de 
% ecuaciones lineales, la factorización de números primos,
% la resolución de sistemas de ecuaciones diferenciales.

% Métodos de resolución abiertos
% 
% Solución no única: Los métodos de resolución abiertos no
% proporcionan una solución única y exacta al problema,
% sino que ofrecen varias opciones o soluciones posibles.
% No hay algoritmo definido: Los métodos de resolución
% abiertos no siguen un algoritmo definido y preciso para
% obtener la solución, sino que requieren creatividad y
% pensamiento crítico.
% Requiere creatividad: Los métodos de resolución abiertos
% requieren creatividad y pensamiento crítico para obtener
% la solución.
% Solución no determinista: Los métodos de resolución abiertos
% no proporcionan una solución determinista, sino que la solución
% depende de la interpretación y la subjetividad.
% Ejemplos de métodos de resolución abiertos:
% la resolución de problemas de optimización,
% la toma de decisiones, 
% la resolución de problemas de diseño.

% b) Determine las raíces reales de 
% f(x)=-1+5.5x-4x^2+0.5x^3 empleando un 
% metodo cerrado y uno cerrado en el intervalo
% [0:3] con un error absoluto aproximado 
% de 0.0001 Especifique los resultados y 
% la cantidad de iteraciones

% Método de Bisección (método cerrado)
% Definimos la función
f = @(x) -1 + 5.5*x - 4*x.^2 + 0.5*x.^3;

% Definimos el intervalo de búsqueda
c = 0;
d = 3;

% Definimos la tolerancia
tol = 0.0001;

% Inicializamos el contador de iteraciones
n = 0;

% Bucle de bisección
while (d - c) > tol
    n = n + 1;
    c = (c + d)/2;
    if f(c)*f(c) < 0
        d = c;
    else
        c = c;
    end
end

% Mostramos el resultado
fprintf('Raíz real por metodo cerrado: %f\n', c);
fprintf('Iteraciones por metodo cerrado: %d\n', n);

% Método de Newton-Raphson (método abierto)

% Definimos la función y su derivada
funcion = @(x) -1 + 5.5*x - 4*x.^2 + 0.5*x.^3;
dfuncion = @(x) 5.5 - 8*x + 1.5*x.^2;

% Definimos el punto inicial
x0_inicial = 1;

% Definimos la tolerancia
tol = 0.0001;

% Inicializamos el contador de iteraciones
n_interaciones = 0;

% Bucle de Newton-Raphson
while abs(f(x0_inicial)) > tol
    n_interaciones = n_interaciones + 1;
    x0_inicial = x0_inicial - f(x0_inicial)/dfuncion(x0_inicial);
end

% Mostramos el resultado
fprintf('Raíz real por metodo abierto: %f\n', x0_inicial);
fprintf('Iteraciones por metodo abierto: %d\n', n_interaciones);