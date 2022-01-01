% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/12/23
% Descripcion: permite discretizar ecuaciones diferenciales y permitir un 
%              tratamiento más simple del problema diferencial parcial
%
% Ejemplo 1: 
% Una onda electromagnetica se encuentra oscilando dentro de una superficie,
% usando los valores inciales encuentre la suerficie y solucion de la onda 
% electromagentica.
%
clc;
clear;

% Datos del ejercicio
f = @(x) sin(pi*x)+sin(2*pi*x);
g = @(x) 0;
a = 1;
b = 0.5;
c = 2;
n = 11;
m = 11;

try
  u = diffOndas (f,g,a,b,c,n,m);
  u=u'  
  %u(2:n-1,19)
  surf(u)
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end_try_catch
