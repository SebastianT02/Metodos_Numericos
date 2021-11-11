% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/10/29
% Descripcion:
%ejemplo: saber un modelo matemático de las notas de los estudiantes de ingeniería
% de la universidad de cueca, en donde hay notas con una diferencia grande
%el profesor encargado quiere ver una ecuación lineal creca a sus registros.

clc,clear
x = (1:25)';
y = rand(25,1)*10;

try 
  fprintf('Coeficientes de la ecuacion lineal = cl \n')
  fprintf('Sumatoria de las diferencias = Sl \n')
  [cl,sl] = minimocuadrado(x,y)
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end


