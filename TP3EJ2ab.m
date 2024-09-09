% TP3-Ejercicio2-ab
% 
% a) Análisis de las afirmaciones:
% 
% "Los tres métodos conducen al mismo polinomio interpolante."
% Verdadera
% 
% Los tres métodos de interpolación (Vandermonde, Lagrange y Newton) 
% son equivalentes y producen el mismo polinomio interpolante. 
% Esto se debe a que todos los métodos se basan en la misma idea de 
% encontrar un polinomio que pase por los puntos dados, y la forma en
% que se calcula el polinomio es diferente, pero el resultado final
% es el mismo.
% 
% "Por los distintos métodos de interpolación debemos llegar
% a los mismos resultados numéricos."
% Verdadera
% 
% Como se mencionó anteriormente, los tres métodos producen 
% el mismo polinomio interpolante, por lo que los resultados
% numéricos obtenidos mediante cada método deben ser iguales. 
% Sin embargo, es importante destacar que los métodos pueden 
% tener diferentes precisiones y estabilidad numérica, lo que 
% puede afectar los resultados en ciertos casos.
% 
% "Desde un punto de vista operacional algunos algoritmos
% resultan menos ventajosos que otros."
% Verdadera
% 
% Aunque los tres métodos producen el mismo polinomio
% interpolante, algunos algoritmos pueden ser más eficientes
% o fáciles de implementar que otros. Por ejemplo:
% 
% El método de Vandermonde requiere la inversión de una matriz, 
% lo que puede ser costoso en términos de tiempo y memoria para grandes 
% conjuntos de datos.
% El método de Lagrange requiere la evaluación de polinomios en 
% cada punto, lo que puede ser lento para grandes conjuntos de datos.
% El método de Newton es más eficiente en términos de tiempo 
% y memoria, ya que solo requiere la evaluación de diferencias divididas.
% En resumen, aunque los tres métodos producen el mismo 
% polinomio interpolante, algunos algoritmos pueden ser más 
% ventajosos que otros en términos de eficiencia y facilidad
% de implementación.