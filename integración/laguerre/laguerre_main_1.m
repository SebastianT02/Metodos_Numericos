% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/11/3
% Descripcion: el m�todo de cuadratura de gauss aproxima al valor m�s cercano de
% una integral, y exiten diferentes, como es el cso de Laguerre, Chebyshev o 
%Hermite.

% Problema 1:Para las funciones de laguerre, su forma general es de integral 
% int = e^-x*f(x)*dx donde los intervalos son de 0 a infinito, los cuales
% ayudan a funciones con un exponente de alguna manera.el siguinete ejemplo,
% es de una se�al de radio frecuencia de un buker detectado a distancia corta, 
% medir el area inferir de dicha funcion dada

% funcion = f(x) = (e^-x)*(cos(x))
clc,clear
syms x
% Datos y Funci�n para ejecutar con la funci�n laguerre.m 
funcion = @(x) cos(x);
n = 6;
extremo_inferior = 0;
extremo_superior = 6; %referencia a infinito

try
  %C�lculo de la aproximaci�n de integral
   fprintf('La ')
   [integral_aproximada] = sistema_laguerre(funcion,n)
   fprintf('C�lculo del error y el valor de la integral real \n')
   % c�lculo del error
   funcion_1 = exp(-x).*funcion;
   integral_real = int(funcion_1,x,extremo_inferior,extremo_superior)
   error = ((integral_real-integral_aproximada)/integral_real)*100
   
   % Plot de la funci�n
   x_1 = extremo_inferior:0.0010:extremo_superior;
   y_1 = exp(-x_1).*cos(x_1);
   plot(x_1,y_1,'DisplayName','f(x) = exp(-x).*sin(x)')
   hold on
   grid on
   legend
   title('M�todo de cuadratura de Gauss Laguerre')
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
