%TP1ad-Ejercicio4

% Borramos la ventana de comandos y las variables previas
clc
clear

x=Inf;
coef1 = 3+log(1+x^2);
coef2 = 25*sqrt(x)*(1 + 4*x)/(3+x*(x-1)); 
if (x < coef1)
  y = 2*x-3;
elseif(x < coef2)
  y = 1/(1+x);
else
  y = exp(-x/3);
end

%Si x=0
% coef1=3+log(1+0^2)=3
% coef2=25*sqrt(0)*(1 + 4*0)/(3+0*(0-1))=0
% Se va a ejecutar la primera rama del if 
% 0<3=true

%Si x=20
% coef1=3+log(1+20^2)=8.9940
% coef2=25*sqrt(20)*(1 + 4*20)/(3+20*(20-1))=23.6451
% Se va a ejecutar la segunda rama del if 
% 20<23.6451=true

%Si x=Inf
% 'y' toma el valor de cero. 


