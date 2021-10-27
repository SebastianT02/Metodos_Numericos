% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 2021/10/29
% Descripcion: Se trata de una serie de algoritmos del �lgebra lineal 
%para determinar los resultados de un sistema de ecuaciones lineales.
%
% Problema 1:
%   
%Para la creaci�n de un cubo de leds de 8x8x8 se adquiri� un total de 780 unidades entre diodos 
%leds, resistencias y cables de conexi�n, gastando un total de $249. El precio de un diodo les es 
%de es de 0.50 centavos, el de una resistencia es de 0,40 centavos y el de un cable de conexi�n 
%es de 0.80 centavos. Adem�s, el n�mero de diodos leds compradas es igual al n�mero de 
%resistencias m�s el n�mero de cables de conexi�n con un igual a 248. �Cu�ntos leds,
%resistencias y cables han comprado para realizar el proyecto?
%siendo estas las ecuaciones: x +y +z =780, 0.16x+0.50y+0.80z=249, x-y-z=248.

clc
A=[1,1,1; 0.16,0.50,0.80;1,-1,-1];
b=[780;249;248]; 
Ab=[A,b];

try
  gauss_jordan(A,b);
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
fprintf('Matriz:\n')
Ab %muestra la matriz principal
fprintf('Respuestas:\n')
gauss_jordan(A,b)

