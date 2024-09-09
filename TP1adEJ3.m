%TP1ad-Ejercicio3

% Borramos la ventana de comandos y las variables previas
clc
clear

% Leer los números x e y desde el teclado
x = input('Ingrese el valor de x: ');
y = input('Ingrese el valor de y: ');

% Verificar si y es cero para evitar la división por cero
if y == 0
    fprintf('Error: no se puede dividir entre cero.\n');
else
    % Calcular el producto y el cociente
    producto = x * y;
    cociente = x / y;
    
    % Mostrar los resultados
    fprintf('El producto de x e y es: %.4f\n', producto);
    fprintf('El cociente de x entre y es: %.4f\n', cociente);
end