%TP4-Ejercicio3 

% Borramos la ventana de comandos y las variables previas
clc
clear

% Importamos los datos del archivo txt
data = load('tp4ej3.txt');

% Extraemos los datos de la tabla:
x = data(:, 1);  % variable independiente
y = data(:, 2);  % variable dependiente

% Propuestas de ajuste

% Ajuste Polinomial (grados: 1,2,3)
p1 = polyfit(x, y, 1);  % ajuste polinomial de grado 1
p2 = polyfit(x, y, 2);  % ajuste polinomial de grado 2
p3 = polyfit(x, y, 3);  % ajuste polinomial de grado 3

% Ajuste potencial o exponencial
logx = log(x);
logy = log(y);
p_pot = polyfit(logx, logy, 1);  % ajuste potencial
p_exp = polyfit(x, logy, 1);  % ajuste exponencial

% Comparacion grafica
figure;
plot(x, y, 'o', x, polyval(p1, x), '-', x, polyval(p2, x), '--', x, polyval(p3, x), ':', ...
     x, exp(polyval(p_pot, logx)), '-.', x, exp(polyval(p_exp, x)), '--.');
legend('Datos', 'Polinomial 1', 'Polinomial 2', 'Polinomial 3', 'Potencial', 'Exponencial');
xlabel('x');
ylabel('y');
title('Funciones de ajuste');

% Error cuadratico medio
n_datos = 10:10:2000;
ECM = zeros(size(n_datos));
for i = 1:length(n_datos)
    idx = randperm(size(x, 1), n_datos(i));
    x_sub = x(idx);
    y_sub = y(idx);
    
    % Ajustes polinomiales
    p1_sub = polyfit(x_sub, y_sub, 1);
    p2_sub = polyfit(x_sub, y_sub, 2);
    p3_sub = polyfit(x_sub, y_sub, 3);
    
    % Ajustes potencial y exponencial
    logx_sub = log(x_sub);
    logy_sub = log(y_sub);
    p_pot_sub = polyfit(logx_sub, logy_sub, 1);
    p_exp_sub = polyfit(x_sub, logy_sub, 1);
    %p_exp2_sub = polyfit([logx_sub, logx_sub.^2], logy_sub, 1);
    
    % ECM para cada ajuste
    ECM(i, 1) = mean((y_sub - polyval(p1_sub, x_sub)).^2);
    ECM(i, 2) = mean((y_sub - polyval(p2_sub, x_sub)).^2);
    ECM(i, 3) = mean((y_sub - polyval(p3_sub, x_sub)).^2);
    ECM(i, 4) = mean((y_sub - exp(polyval(p_pot_sub, logx_sub))).^2);
    ECM(i, 5) = mean((y_sub - exp(polyval(p_exp_sub, x_sub))).^2);
    %ECM(i, 6) = mean((y_sub - exp(polyval(p_exp2_sub, [logx_sub, logx_sub.^2]))).^2);
end

% Grafico del error cuadratico medio
figure;
plot(n_datos, ECM(:, 1), '-', n_datos, ECM(:, 2), '--', n_datos, ECM(:, 3), ':', ...
     n_datos, ECM(:, 4), '-.', n_datos, ECM(:, 5), '--.', n_datos , ECM(:, 6), ':.');
legend('Polinomial 1', 'Polinomial 2', 'Polinomial 3', 'Potencial', 'Exponencial', 'Exponencial 2');
xlabel('Número de datos');
ylabel('Error cuadrático medio');
title('Error cuadrático medio en función del número de datos');