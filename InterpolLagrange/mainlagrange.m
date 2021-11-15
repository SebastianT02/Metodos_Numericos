% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 2021/11/12
% Descripcion: Se trata de una serie de algoritmos del álgebra lineal 
%para determinar los resultados de un sistema de ecuaciones lineales.
%
% Problema 1:
% Dentro de los calculos de un circuito electrico se encontro los resultados del
% voltaje para cada resistencia, asi como su valor resistivo en ohmios y se creo la
% funcion dada por los puntos a continuacion. Mediante la interpolacion de lagrange
% encuentre un polinomio que se ajuste a los datos ya dados, con los que se pueda  
% trabajar para futuras medidas del mismo circuito.
clc
%Datos del problema
X=[-4 -2 0 2 6]
Y=[-4.24 -0.15 3.33 2.92 3.86]

try
  [C, L] = lagrange(X,Y);
  poli = polyout(C,'x');
  plot(X,Y,'*r')
  hold on
  ezplot(poli)
  grid on
  legend('Puntos','Interpolacion Lagrange')
catch err
  fprintf('Error: %s\n', err.message);
  %err.identifier
end