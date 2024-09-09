% TP1-Ejercicio3c

% Limpiamos la ventana de comandos y las variables previas
clc
clear

% Genere un vector con todos los numeros a e Z^+ de modo que
% a<2000 y que a sea multiplo de 2, 7 y 13

% Calcular el menor común múltiplo (LCM) de 2, 7 y 13
lcm = lcm(2, lcm(7, 13));

% Generar el vector de números que son múltiplos del LCM y menores que 2000
a = lcm:lcm:1999;

% Mostrar el vector

disp('Resultado con lcm: ');
disp(a);

%Otra opción sin usar el lcm

%menor comun multiplo de 2, 7 y 13 es: 182

%Utilizamos un bucle for

b = [];
for i = 182:182:2000
    b = [b, i];
end
disp('Resultado con bucle for: ');
disp(b);

