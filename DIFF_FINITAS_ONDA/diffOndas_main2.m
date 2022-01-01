% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/12/23
% Descripcion: permite discretizar ecuaciones diferenciales y permitir un 
%              tratamiento más simple del problema diferencial parcial
%
% Ejemplo 1: 
% Una onda emitida por un radio, recorre cierta distancia desde la estacion 
% hasta nuestros hogares, teneindo en cuenta la variacion de onda en el camino,
% encuentre la superficie de la onda que esta descrita mediante la siguiente
% ecuacion. 
%
clc;
clear;

% Datos del ejercicio
f = @(x) sin(x)+sin(2*pi*x);
g = @(x) 3;
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
