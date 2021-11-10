% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 2021/11/12
% Descripcion: Se trata de una serie de algoritmos del �lgebra lineal 
%para determinar los resultados de un sistema de ecuaciones lineales.
%
% Problema 2:
% El pent�xido de dinitr�geno gaseoso puro reacciona en un reactor intermitente
% seg�n la reacci�n estequiom�trica. Calcule el polinomio de interpolaci�n de
% Newton en diferencias divididas para los datos.

clc
%puntos
x=[1;-2;2];
y=[2;4;-2];


try
  fprintf('La funcion es:\n');
  p=inter_newton(x,y)
  ezplot(p);
  hold on;
  plot(x,y,'*r')
  scatter(x,y,100)
  legend('interpolacion newton','puntos')
  
catch err
  fprintf('Error: %s\n', err.message);
  %err.identifier
end