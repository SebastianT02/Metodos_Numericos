% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/12/23
% Descripcion: permite discretizar ecuaciones diferenciales y permitir un 
%              tratamiento más simple del problema diferencial parcial
%
% Ejemplo 1: 
% La siguiente ecuacion describe el funcionamoento de un circuito de segundo 
% orden subamortiguado, mediante diferencias finitas calcule o grafique la forma
% de onda del voltaje dentro del circuito en funcionamiento
%                       4y''-2y'+i+x=0
%
clc;
clear;

% Datos del ejercicio
n = 50;
x0 = 0;
xf = 20;
y0 = 1;
yf = 10;

try
  [ejex ejey] = diffinitas(x0,xf,y0,yf,n);
  [ejex' ejey]
  hold on
  grid on
  xlabel('x');ylabel('y');
  title('Soluciones de la ED usando Diferencias finitas');
  plot(ejex,ejey)
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end_try_catch