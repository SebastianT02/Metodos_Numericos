% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 02/12/2021
% Descripcion: El Método de los Trapecios sustituye la curva 
%              mediante una poligonal inscripta, lo que nos 
%              lleva a aproximar el área bajo la curva mediante
%              un conjunto de trapecios
%
% Problema 1: la curva dada por la siguinete ecuacion:
%             e^(-x^2), corresponde a la intensidad encontrada
%             por un inductor, encuentre la intensidad entre los 
%             siguientes puntos de tiempo(0,1) segundos.
%   
% Funcion de la curva.
f=@(x) e^(-x^2);
% Valores de limites y trapecios.
b=1;
a=0;
n=4;

clc;
try
  %Definimos el multiplicador de la sumatoria
  %Mosreamos el area bajo la curva
  [delta, area] =  trapecio(f,b,a,n)
  %grafica
  x = a:0.1:b;
  y = e.^(-x.^2);
  plot (x,y,'r')
catch err
  fprintf ('Error: %s\n', err.message);
end