% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/10/29
% Descripcion: Se trata de una serie de algoritmos del álgebra lineal
%para transformar una matriz A como el producto de una multiplicación
#de dos matrices triangulares U = superior, L =  independiente ,inferior. 


% Problema 1:
%Para la creación de    
%
% 
clc,clear
A = [5 2 1 ;3 1 4 ;1 1 1 ];



try 
  [L,U] = factorizacion(A);
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
[L,U] = factorizacion(A)
