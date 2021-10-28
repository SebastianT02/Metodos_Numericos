% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 2021/10/28
% Descripcion: Se trata de una serie de algoritmos del álgebra lineal 
%para determinar los resultados de un sistema de ecuaciones lineales.
%
% Problema 2:
%   
%Dentro de un circuito, necesitamos encontrar el valor correspndiente de la 
%intensidad de corrientes i1, i2, i3, cuando se dan los siguientes valores 
%para voltajes, y resistencias.
%E1 = 14V, E2 = 12V, R1 = 6 OHMIOS, R2 = 5 OHMIOS, R3 = 4 OHMIOS 
%siendo estas las ecuaciones: 6x+4z=14, 5y+4z=12, x+y-z=0.

clc
A=[6,0,4;0,5,4;1,1,-1];
b=[14;12;0]; 
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
