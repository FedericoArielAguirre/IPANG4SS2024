%TP1ad-Ejercicio2

% Borramos la ventana de comandos y las variables previas
clc
clear

% Solicitar el ángulo en grados al usuario
grados = input('Ingrese el ángulo en grados: ');

% Convertir grados a radianes utilizando la función deg2rad()
radianes_con_funcion = deg2rad(grados);

% Convertir grados a radianes manualmente
radianes_manual = grados * pi / 180;

% Mostrar los resultados
fprintf('El ángulo en radianes (usando deg2rad()) es: %.4f\n', radianes_con_funcion);
fprintf('El ángulo en radianes (manualmente) es: %.4f\n', radianes_manual);