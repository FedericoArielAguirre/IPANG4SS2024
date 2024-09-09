%TP1Ad-Ejercicio1

%Definicion de sentencias:

% 1-'a=10'
% 2-'v=[10 20 30]'
% 3-'v=[1 2;3 a]'
% 4-'B=[v;v]'
% 5-'a*A'
% 6-'A(1,2)'
% 7-'A * B'
% 8-'C=[a a; 2*a sqrt(a)];'
% 9-'A*C'
% 10-'A.*C'
% 11-'inv(A)'
% 12-'A./C'
% 13-'dot(v,v)'
% 14-'r="producto"'

% a=10
% Tipo de variable: Escalar (número)
% Resultado: Asigna el valor 10 a la variable a
% v=[10 20 30]
% Tipo de variable: Vector (fila)
% Resultado: Crea un vector v con los elementos 10, 20 y 30
% v=[1 2;3 a]
% Tipo de variable: Matriz
% Resultado: Crea una matriz v con dos filas y dos columnas, donde el elemento en la segunda fila y segunda columna es la variable a (que debe estar definida previamente)
% B=[v;v]
% Tipo de variable: Matriz
% Resultado: Crea una matriz B que es la concatenación de la matriz v consigo misma, es decir, una matriz con cuatro filas y dos columnas
% a*A
% Tipo de variable: Error (si A no está definida) o Matriz (si A está definida)
% Resultado: Si A está definida, multiplica la matriz A por el escalar a. De lo contrario, produce un error
% A(1,2)
% Tipo de variable: Escalar (número)
% Resultado: Devuelve el elemento en la primera fila y segunda columna de la matriz A (si A está definida)
% A * B
% Tipo de variable: Matriz
% Resultado: Realiza la multiplicación matricial entre las matrices A y B (si ambas están definidas)
% C=[a a; 2*a sqrt(a)]
% Tipo de variable: Matriz
% Resultado: Crea una matriz C con dos filas y dos columnas, donde los elementos son funciones de la variable a
% A*C
% Tipo de variable: Matriz
% Resultado: Realiza la multiplicación matricial entre las matrices A y C (si ambas están definidas)
% A.*C
% Tipo de variable: Matriz
% Resultado: Realiza la multiplicación elemento a elemento entre las matrices A y C (si ambas están definidas)
% inv(A)
% Tipo de variable: Matriz
% Resultado: Devuelve la matriz inversa de A (si A es una matriz cuadrada y no singular)
% A./C
% Tipo de variable: Matriz
% Resultado: Realiza la división elemento a elemento entre las matrices A y C (si ambas están definidas)
% dot(v,v)
% Tipo de variable: Escalar (número)
% Resultado: Devuelve el producto escalar entre el vector v y sí mismo
% r="producto"
% Tipo de variable: Cadena de caracteres (string)
% Resultado: Asigna la cadena de caracteres "producto" a la variable r
