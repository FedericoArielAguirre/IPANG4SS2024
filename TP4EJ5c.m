%TP4-Ejercicio5c 

% Borramos la ventana de comandos y las variables previas
clc
clear

% Datos
x = [0, 1, 2, 3, 4];
y = [1, 2, 4, 7, 11];

% Grado del polinomio
n = 2;

% Matriz A
A = zeros(length(x), n+1);
for i = 1:length(x)
    for j = 0:n
        A(i, j+1) = x(i)^j;
    end
end

% Vector y
y = y';

% Resolucion del sistema de ecuaciones
c = A \ y;

% Polinomio de ajuste
p = polyfit(x, y, n);

% Grafica de los datos y el polinomio de ajuste
plot(x, y, 'o', x, polyval(p, x), '-')
xlabel('x')
ylabel('y')
title('Polinomio de ajuste de cuadrados minimos')

%Se tienen $m+1$ datos $(x_i, y_i)$, con $i=0,1,...,m$, y se busca encontrar un polinomio de grado $n$ que 
%se ajuste a estos datos mediante el método de minimos cuadrados. La forma matricial del problema se puede expresar como:

% $$\mathbf{A} \mathbf{c} = \mathbf{y}$$

%donde $\mathbf{A}$ es una matriz de $(m+1) \times (n+1)$, $\mathbf{c}$ es un vector de coeficientes del polinomio de grado $n$ y $\mathbf{y}$ es un vector de valores $y_i$.

%Solucion analitica

%Para demostrar que el polinomio de ajuste de cuadrados minimos coincide con el polinomio de interpolacion del mismo conjunto de datos, podemos utilizar la teoria de la interpolacion polinomica.

%Sea $\mathbf{P}_n(x)$ el polinomio de interpolacion de grado $n$ que pasa por los $m+1$ puntos $(x_i, y_i)$. Entonces, se cumple que:

%$$\mathbf{P}_n(x_i) = y_i, \quad i=0,1,...,m$$

%Por otro lado, el polinomio de ajuste de cuadrados minimos se puede expresar como:

%$$\mathbf{p}_n(x) = \mathbf{c}^T \mathbf{x}^n$$

%donde $\mathbf{c}$ es el vector de coeficientes del polinomio de ajuste.

%Para demostrar que $\mathbf{p}_n(x) = \mathbf{P}_n(x)$, podemos utilizar el teorema de interpolacion polinomica, que establece que existe un único polinomio de grado $n$ que pasa por $m+1$ puntos dados.

%Por lo tanto, podemos concluir que el polinomio de ajuste de cuadrados minimos coincide con el polinomio de interpolacion del mismo conjunto de datos.
