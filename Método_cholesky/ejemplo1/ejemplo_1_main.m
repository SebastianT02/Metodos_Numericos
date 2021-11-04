% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/11/3
% Descripcion: Se trata de una serie de algoritmos del álgebra lineal
%para transformar una matriz A como el producto de una multiplicacion de
%G * GT transpuesta, donde encontramos A*x=B, G*y = b, Gt * x = y


% Problema 1:
%Para la vida cotidiana para encontrar un sistema de corrientes i1, i2, i3, 
%cuando se dan los siguientes valores para voltajes, y resistencias
%E1 = 0V, E2 = 6V, R1 = 2 OHMIOS, R2 = 10 OHMIOS, R3 = 4 OHMIOS,las matrices
%das es de un sistema de ecuaciones dada.
%A = [4,2,-4; 2,10,4; -4,4, 9];
%b = [0; 6; 5];
%
% 
clc,clear
A = [4,2,-4; 2,10,4; -4,4, 9];
b = [0; 6; 5];


try 
  [G,Gt] = cholesky(A);
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
fprintf('Matriz G y Gt transpuesta \n')
[G,Gt] = cholesky(A)
fprintf('Solución a la Matriz [y,x] donde A*x=b G*y=b Gt*x=y \n')
[y,x]=sistemaCh(A,b)
