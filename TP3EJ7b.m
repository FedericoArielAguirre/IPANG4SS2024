%TP3-Ejercicio7-b 

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definir los puntos de datos
x = [0.9, 1.3, 1.9, 2.1, 2.6, 3.0, 3.9, 4.4, 4.7, 5.0, 6.0, 7.0, 8.0, 9.2, 10.5, 11.3, 11.6, 12.0, 12.6, 13.0, 13.3];
y = [1.3, 1.5, 1.85, 2.1, 2.6, 2.7, 2.4, 2.15, 2.05, 2.1, 2.25, 2.3, 2.25, 1.95, 1.4, 0.9, 0.7, 0.6, 0.5, 0.4, 0.25];

% Definir los grados del polinomio
grados = [2, 3, 5, 7, 9];

% Bucle para cada grado y realizar interpolación polinómica
for deg = grados
    % Ajustar el polinomio
    coeffs = polyfit(x, y, deg);
    
    % Evaluar el polinomio en un rango de puntos
    x_eval = linspace(min(x), max(x), 100);
    y_eval = polyval(coeffs, x_eval);
    
    % Graficar el polinomio y los puntos de datos
    plot(x, y, 'o', x_eval, y_eval);
    xlabel('x');
    ylabel('f(x)');
    title(['Interpolación Polinómica (Grado ', num2str(deg), ')']);
    
    % pause(1/10) ;
end

% Metodo de Interpolacion Polinomial
% Basado en los datos proporcionados, es recomendable 
% utilizar un metodo de interpolacion polinomial para obtener
% un polinomio que interpole los puntos y represente el contorno
% superior de la figura. 
% En particular, propondria utilizar un polinomio
% de grados variables para interpolar los datos 
% y analizar los resultados.
% 
% Justificacion
% 
% La interpolacion polinomial es una opcion
% adecuada para este problema porque:
% 
% Curva suave: Los puntos de datos parecen formar
% una curva suave, que puede ser bien representada
% por un polinomio.
% Flexibilidad: La interpolacion polinomial se puede
% utilizar para ajustar polinomios de diferentes grados,
% lo que nos permite analizar el efecto de diferentes 
% grados en el resultado de la interpolacion.
% Fácil implementacion: La interpolacion polinomial 
% es un metodo sencillo de implementar en MATLAB 
% utilizando las funciones equivalentes
% a polyfit y polyval



% Resultados y Análisis
% 
% Al ejecutar el código, obtenemos las siguientes gráficas 
% para cada grado: 
% Grado 2 
% El polinomio cuadrático proporciona un ajuste razonable
% a los datos, pero es claro que no está capturando las
% sutilezas de la curva. 
% Grado 3 
% El polinomio cúbico proporciona un ajuste mejor a
% los datos, pero todavía no está capturando completamente
% las oscilaciones en la curva.
% Grado 5 
% El polinomio quíntico proporciona un ajuste bueno a
% los datos, capturando las oscilaciones en la curva.
% Sin embargo, está empezando a mostrar signos de sobreajuste.
% Grado 7 
% El polinomio séptico proporciona un ajuste excelente
% a los datos, capturando las oscilaciones y sutilezas
% de la curva. Sin embargo, está claramente sobreajustando
% los datos, lo que puede no ser deseable. 
% Grado 9 
% El polinomio nonico proporciona un ajuste excelente
% a los datos, pero está sobreajustando fuertemente
% los datos, lo que puede no ser deseable.
