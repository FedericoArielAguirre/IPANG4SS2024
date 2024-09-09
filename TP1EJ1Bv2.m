clc;
clear;
A = [42, 66, 68, 66; 92, 4, 76, 17; 79, 85, 74, 71; 96, 93, 39,3];
b = [7; 3; 10; 0];
x = A \ b;
disp('Los valores de x, y, z, y w son:');
disp(x);

% Resultados con calculadora
% x=0.099929 
% y=-0.05558
% z=-0.12971
% w=0.232110
