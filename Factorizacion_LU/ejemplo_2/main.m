% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/10/29
% Descripcion: Se trata de una serie de algoritmos del álgebra lineal
%para transformar una matriz A como el producto de una multiplicación
%de dos matrices triangulares U = superior, L =  independiente ,inferior. 


% Problema 2:
%Para la creación de una mini placa de arduino, se adquirió un total 850 unidades
%entre base_metalica, cables y resistencias gastando un total de $250. El precio
%de una base metalica es de $1.50, el de cables es de 0.50 centavos c/u, y de una resistencia
% es de 0.10 cenntavos c/u, además el #de bases mas el # de cables, mas el # de resistencias
%es igual a 320. ¿cuántas bases,resistencias y cables se han comprado?
% siendo ecuaciones; x + y + z = 850, 1.5x+0.5y+0.1z=250, x-y-z=320

clc,clear
A = [1 1 1;1.50,0.50,0.10; 1,-1,-1];
b = [850; 250; 320];


try 
  [L,U] = factorizacion(A);
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
[L,U] = factorizacion(A)
fprintf('Solución a la Matriz Ax=b')
x = sistemaLU(A,b)

%final del main%%

