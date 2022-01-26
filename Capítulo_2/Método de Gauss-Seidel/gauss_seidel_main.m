% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 2021/11/05
% Descripcion: Este método recorta sustancialmente el número de iteraciones a realizar 
%para obtener una cierta precisión en la solución. Evidentemente los criterios de
%convergencia son similares a los de Jacobi.
%
% Problema 1:
%   
%Calcular el presupuesto de un proyecto, en el ámbito de docencia, puede utilizar el método de 
%Gauss-Seidel. Hay muchos factores interrelacionados: el tamaño del proyecto, 
%los materiales a utilizar, las horas de trabajo que se necesitan y el número de personas 
%que lo van a realizar entre otras cosas. Con todos estos factores, se forma matemáticamente 
%un sistema de ecuaciones lineales.
%siendo estas las ecuaciones: 3x-0.1y-0.2z =7.85, 0.1x+7y-0.3z=-19.3, 0.3x-0.2y+10z=71.4.
%como el vector inicial no se indica en el enunciado, se considera usar 
%el vector de ceros X = [0,0,0] con tolerancia de 0.001 para iniciar, permitiendo 
%identificar un maximo de iteraciones.

clc
A=[3,-0.1,-0.2;0.1,7,-0.3;0.3,-0.2,10] %matriz A
b=[7.85;-19.3;71.4] %vector b
x=[0;0;0]%vector x
tol=0.001; %tolerancia
m=20; %numero maximo de iteraciones

try
  gauss_seidel(A,b,x,tol,m)
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
