%TP3-Ejercicio7-a

% Borramos la ventana de comandos y las variables previas
clc
clear

% Definimos los data points
Vce = [1, 2, 3, 4, 5];
Ib = [1, 2, 3, 4, 5];
Ic = [
    0.5623, 0.6687, 0.7401, 0.7953, 0.8409;
    0.8435, 1.0031, 1.1101, 1.1929, 1.2613;
    1.1247, 1.3375, 1.4802, 1.5905, 1.6818;
    1.4059, 1.6719, 1.8502, 1.9882, 2.1022;
    1.6870, 2.0062, 2.2202, 2.3858, 2.5227
];

% Define el punto a interpolar
Vce_interp = 2.5;
Ib_interp = 5;

% Realiza la interpolacion bicubica
Ic_interp = interp2(Vce, Ib, Ic, Vce_interp, Ib_interp);

% Mostramos el resultado
fprintf('Valor aproximado Ic: %f\n', Ic_interp);


% Metodo de Interpolacion
% Basado en los datos proporcionados, recomendaria utilizar
% un metodo de interpolacion 2D, especificamente una 
% interpolacion bicubica. Esto se debe a que los datos
% son una cuadricula 2D de valores, con Vce e Ib como 
% las variables independientes, e Ic como la variable 
% dependiente.
% 
% La interpolacion bicubica es una opcion adecuada
% porque puede manejar datos espaciados de manera 
% irregular y proporciona una superficie suave y 
% continua que pasa por los puntos de datos. Ademas,
% se puede usar para interpolar valores en puntos
% arbitrarios dentro de la cuadricula.
% 
% ¿Por que Interpolacion Bicubica?
% 
% Elegi la interpolacion bicubica sobre otros metodos
% por varias razones:
% 
% Datos 2D: Los datos son una cuadricula 2D, lo que hace
% que la interpolacion bicubica sea una opcion natural.
% Espaciado irregular: Los puntos de datos no estan 
% espaciados uniformemente, lo que hace que la interpolacion
% bicubica sea mas adecuada que otros metodos que asumen un 
% espaciado uniforme.
% Suavidad: La interpolacion bicubica proporciona una superficie
% suave y continua que puede capturar la tendencia subyacente de
% los datos.
% Flexibilidad: La interpolacion bicubica se puede usar para
% interpolar valores en puntos arbitrarios dentro de la 
% cuadricula, lo que la convierte en una opcion versatil.