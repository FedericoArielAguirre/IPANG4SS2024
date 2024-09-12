%Parcialito n1 10-09-24

%Ejercicio1b

%Limpiamos las variables previas y la ventana de comandos
clc;
clear;
% Creamos una grilla de x con al menos 200 puntos en el intervalo [-5, 5]
x=linspace(-5,5,200);
% Definimos la funcion
g =@(x) exp(x+2).*(x<-2)+(cos(pi*x)).*((-2<=x)&(x<=1))+(log(x)-1).*(x>1);
g(x)
% Graficamos la función con una traza continua
plot(x,g(x),'.r');
% Agregamos títulos a los ejes
xlabel('x');
ylabel('g(x)');
% Agregamos un título al gráfico
title('Gráfico de la función a trozos');