% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/11/3
% Descripcion: Se trata de una serie de algoritmos del álgebra lineal
%para transformar una matriz A como el producto de una multiplicacion de
%G * GT transpuesta, donde encontramos A*x=B, G*y = b, Gt * x = y


% Problema 2:
%Para resolver un sistema de ecuaciones dada en un operador grafico matlab, para
%solucionar el punto de intercepción de tres vectores, y encontrar si la matriz
%es simétrica. 

clc,clear
A = [1 -1 1;-1,5,-5; 1,-5,6];
b = [2; -6; 9];



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
