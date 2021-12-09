% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/11/3
% Descripcion: el método de cuadratura de gauss aproxima al valor más cercano de
% una integral, y exiten diferentes, como es el cso de Laguerre, Chebyshev o 
%Hermite.

% Problema 1: Para las funciones de chebyshev, su forma general es de integral 
% int = w(x)*f(x)*dx donde w son los pesos el siguiente ejemplo es la superfice
% de agua abajo de un barco con la forma de la funcion w(t)*f(x) con un ancho de 2
% calcular el area del agua abajo del barco.
clc,clear
syms x
% Datos y Función para ejecutar con la función chebyshev.m 
funcion = @(x) x^4;
n = 3;
extremo_inferior = -1;
extremo_superior = 1;

try
  %Cálculo de la aproximación de integral
   fprintf('La ')
   [integral_aproximada] = chebyshev(funcion,n)
   fprintf('Cálculo del error y el valor de la integral real \n')
   % cálculo del error
   funcion_1 = @(x) ((1-x^2)^(-1/2))*funcion;
   integral_real = int(funcion_1,x,-1,1)
   error = ((integral_real-integral_aproximada)/integral_real)*100
   
   % Plot de la función
   x_1 = extremo_inferior:0.01:extremo_superior;
   y_1 = ((1-x_1.^2).^(-1/2)).*x_1.^4;
   plot(x_1,y_1,'DisplayName','f(x)=((1-x_1.^2).^(-1/2)).*x_1.^4')
   hold on
   grid on
   legend
   title('Método de cuadratura de Gauss Chebyshev')
   
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
