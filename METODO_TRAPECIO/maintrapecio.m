% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 02/12/2021
% Descripcion: El Método de los Trapecios sustituye la curva 
%              mediante una poligonal inscripta, lo que nos 
%              lleva a aproximar el área bajo la curva mediante
%              un conjunto de trapecios
%
% Problema 1: la curva dada por la siguinete ecuacion:
%             1/(1+x^2)^(1/2), corresponde al voltaje encontrado
%             por un capacitor, encuentre el voltaje entre los 
%             siguientes puntos de tiempo(0,1) segundos.
%   
% Funcion de la curva.
f=@(x) 1/(1+x^2)^(1/2);
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
  y = 1./((1+y.^2).^(0.5));
  plot (x,y,'r')
catch err
  fprintf ('Error: %s\n', err.message);
end