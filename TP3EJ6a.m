%TP3-Ejercicio6-a

% Borramos la ventana de comandos y las variables previas
clc
clear
% Defina los valores de x y y
x = [0, 0.25, 0.5, 0.75, 1];
y = [1, 3, 5, 4.5, 3];

% Cree la spline
pp = spline(x, y);

% Evalúe la spline en una rejilla más fina de valores de x
xx = 0:0.01:1;
yy = ppval(pp, xx);

% Grafique los puntos de datos originales y la spline
plot(x, y, 'o', xx, yy);
xlabel('x');
ylabel('f(x)');
title('Interpolación de Spline Cuadrática');

% Verifique las condiciones impuestas
% La spline debe interpolar los puntos dados
fprintf('Condiciones de interpolación:\n');
for i = 1:length(x)
    fprintf('Valor de la spline en x = %f: %f\n', x(i), ppval(pp, x(i)));
end

% La spline debe ser continua en los nudos
fprintf('\nCondiciones de continuidad:\n');
for i = 1:length(x)-1
    fprintf('Valor de la spline en x = %f (izquierda): %f\n', x(i), ppval(pp, x(i)));
    fprintf('Valor de la spline en x = %f (derecha): %f\n', x(i), ppval(pp, x(i)));
end

% La primera derivada de la spline debe ser continua en los nudos
fprintf('\nCondiciones de continuidad de la primera derivada:\n');
for i = 1:length(x)-1
    fprintf('Derivada de la spline en x = %f (izquierda): %f\n', x(i), ppmak(pp, x(i)));
    fprintf('Derivada de la spline en x = %f (derecha): %f\n', x(i), ppmak(pp, x(i)));
end