%TP4-Ejercicio1 

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definimos los puntos de datos
x = [-1, -0.5, 2, 2.25, 4, 5];
y = [9.1, 6, -3.5, -3.3, -0.9, 2.5];

% Calculamos los fits polinomicos usando minimos cuadrados
p1 = polyfit(x,y,1); %polinomio grado 1
p2 = polyfit(x,y,2); %polinomio grado 2
p3 = polyfit(x,y,3); %polinomio grado 3

% Graficamos los datos y los fits polinomicos
figure;
plot(x, y, 'o',x,polyval(p1,x),'-',x,polyval(p2,x),'--',x,polyval(p3,x),':');
legend('Datos','Grado 1','Grado 2','Grado 3');
xlabel('x');
ylabel('f(x)');
title('Fits Polinomicos');

% Indicador de la cantidad del fit
R2_1 = rsquare(y, polyval(p1, x));
R2_2 = rsquare(y, polyval(p2, x));
R2_3 = rsquare(y, polyval(p3, x));

for i = 1:3
    p = polyfit(x, y, i);  % calculamos fit polinomico de grado i
    y_fit = polyval(p, x);  % evaluamos los fit polinomicos en los valores de x
    R2 = rsquare(y, y_fit);  % calculamos el valor de R-squared 
    fprintf('Grado del fit polinomico: %d R2 = %.4f\n', i, R2);
end

function R2 = rsquare(y, y_fit)
    % Calculamos la media de los datos
    y_mean = mean(y);
    
    % Calculamos la suma de los cuadrados residuales
    SS_res = sum((y - y_fit).^2);
    
    % Calculamos la suma de la diferencia de cuadrados de la media
    SS_tot = sum((y - y_mean).^2);
    
    % Calculamos R-squared
    R2 = 1 - (SS_res / SS_tot);
end
