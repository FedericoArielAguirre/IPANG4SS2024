%TP4-Ejercicio4 

% Borramos la ventana de comandos y las variables previas
clc
clear

% Importamos los datos del archivo txt
datos = load('tp4ej4.txt');

% Extraemos los datos de la tabla:
y = datos(:, 2);
t = datos(:, 1);

% Definimos f0, A y phi
f0 = 500e3;
[A, phi] = aproximar_parametros(y, t, f0);

% Mostramos la amplitud y la fase
fprintf('Amplitud: %f\n', A);
fprintf('Fase: %f rad\n', phi);

% Funcion para aproximar parametros

function [A, phi] = aproximar_parametros(y, t, f0)
    %n = length(y);
    x1 = cos(2*pi*f0*t);
    x2 = sin(2*pi*f0*t);
    X = [x1, x2];
    beta = (X'*X)\(X'*y);
    beta1 = beta(1);
    beta2 = beta(2);
    A = sqrt(beta1^2 + beta2^2);
    phi = atan2(-beta2, beta1);
end


% 
% %a) Transformación a un problema lineal
% La función sinusoidal se puede escribir como:
% $$y(t) = A \cos(2\pi f_0 t + \phi)$$% 
% Usando la identidad trigonométrica 
% $\cos(a+b) = \cos(a)\cos(b) - \sin(a)\sin(b)$, 
% podemos reescribir la función como:
% $$y(t) = A \cos(2\pi f_0 t)\cos(\phi) - A \sin(2\pi f_0 t)\sin(\phi)$$
% % Definimos dos nuevas variables:
% % $$x_1(t) = \cos(2\pi f_0 t)$$ $$x_2(t) = \sin(2\pi f_0 t)$$
% % Entonces, la función se puede escribir como:
% % $$y(t) = A x_1(t) \cos(\phi) - A x_2(t) \sin(\phi)$$
% % Definimos dos nuevos parámetros:
% % $$\beta_1 = A \cos(\phi)$$ $$\beta_2 = -A \sin(\phi)$$
% % Entonces, la función se puede escribir como:
% % $$y(t) = \beta_1 x_1(t) + \beta_2 x_2(t)$$
% % Ahora tenemos un problema lineal en los parámetros $\beta_1$ y $\beta_2$.
% % b) Error cuadrático medio y ecuaciones normales
% % El error cuadrático medio se define como:
% % $$E = \sum_{i=0}^n (y_i - \beta_1 x_{1i} - \beta_2 x_{2i})^2$$
% % Para minimizar el error cuadrático medio, tomamos las derivadas 
%   parciales de $E$ con respecto a $\beta_1$ y $\beta_2$ y las
%   igualamos a cero:
% % $$\frac{\partial E}{\partial \beta_1} = -2 \sum_{i=0}^n...
% (y_i - \beta_1 x_{1i} - \beta_2 x_{2i}) x_{1i} = 0$$
% ...$$\frac{\partial E}{\partial \beta_2} = -2 \sum_{i=0}^n ...
% (y_i - \beta_1 x_{1i} - \beta_2 x_{2i}) x_{2i} = 0$$
% % Estas ecuaciones se conocen como ecuaciones normales.
