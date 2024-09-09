clc;
clear;
function resultado = factorial(n)
    if n == 0
        resultado = 1;
    else
        resultado = n * factorial(n-1);
    end
end