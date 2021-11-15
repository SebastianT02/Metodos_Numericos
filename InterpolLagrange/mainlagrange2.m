% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 2021/11/12
% Descripcion: Se trata de una serie de algoritmos del álgebra lineal 
%para determinar los resultados de un sistema de ecuaciones lineales.
%
% Ejemplo tomado del libro: 
% Para cada uno de los valroes de voltaje corresponde el valor de potencia
% dentro de varias fuentes de voltaje, usando la interpolacion de lagrange, ajustar 
% una linea curva para que se ajuste a los cambios de potencia de las fuentes
% existentes: V1 = 0V, V2 = 2v, V3 = 3V, V4 = 4V, V5 = 5V. POTENCIAS: P1 = 0.2W
% P2 = 1.7W, P3 = 3.4W, P4 = 5.7W, P5 = 8.4W.
clc
X = [0 1 2 3 4 5]
Y = [2.1 7.7 13.6 27.2 40.9 61.1]

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