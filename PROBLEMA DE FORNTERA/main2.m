% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/12/23
% Descripcion: permite discretizar ecuaciones diferenciales y permitir un 
%              tratamiento más simple del problema diferencial parcial
%
% Ejemplo 2: la ecuacion senoidal que se describe a continuacion, representa el 
% voltaje dentro de un circuito de primer orden, mediante diferencias finitas 
% calcule el valor de dicha curva y grafiquela en el plano.
%                                 y'=sin(x)
%
%
clc;

clear;

% Datos del ejercicio
n = 10;
h = 1/n;
x = [0:0.1*pi():2*pi()];

try
  [x y] = diffinitas2 (n,h,x);
  [x' y']
  hold on
  grid on
  xlabel('x');ylabel('y');
  title('Soluciones de la ED usando Diferencias finitas');
  plot(x,y)
catch
  fprintf('Error: %s\n',err.message);
  %err.identifier
end