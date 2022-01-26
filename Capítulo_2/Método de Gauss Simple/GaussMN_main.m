% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/11/3
% Descripcion: Se trata de una serie de algoritmos del álgebra lineal
%para transformar una matriz A como el producto de una multiplicacion de
%G * GT transpuesta, donde encontramos A*x=B, G*y = b, Gt * x = y

% Problema 1:
 %Ejemplo 1
 A = [5 , -3 , -1;1 ,4 , -6;2 ,3 ,4];
 b =[1; -1;9];

try 
  GaussMN (A , b );
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
