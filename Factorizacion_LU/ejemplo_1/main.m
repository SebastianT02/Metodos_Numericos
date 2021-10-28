% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/10/29
% Descripcion: Se trata de una serie de algoritmos del álgebra lineal
%para transformar una matriz A como el producto de una multiplicación
%de dos matrices triangulares U = superior, L =  independiente ,inferior. 


% Problema 1:
%Para la vida cotidiana para encontrar un sistema de corrientes i1, i2, i3, 
%cuando se dan los siguientes valores para voltajes, y resistencias
%E1 = 14V, E2 = 12V, R1 = 6 OHMIOS, R2 = 5 OHMIOS, R3 = 4 OHMIOS 
%A = [6,0,4; 0,5,4; 1,1, -1];
%b = [14; 12; 0];
%
% 
clc,clear
A = [6,0,4; 0,5,4; 1,1, -1];
b = [14; 12; 0];


try 
  [L,U] = factorizacion(A);
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
[L,U] = factorizacion(A)
fprintf('Solución a la Matriz Ax=b')
x = sistemaLU(A,b)

