clc;
clear;
% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/13/12
% Descripcion: Los métodos de Runge-Kutta (RK) son un conjunto de métodos 
%              iterativos (implícitos y explícitos) para la aproximación de 
%              soluciones de ecuaciones diferenciales ordinarias, concretamente,
%              del problema de valor inicial. , los esquemas son explícitos.

% Ejemplo 1:
% Obtener una aproximación de la siguiente funcion, con los datos de h = 0,5 con 
% la condición inicial en 0 de y = 2, desde x = 0 hasta 0,5.

# Datos del Ejercicio
f = @(x,y) -2*x^3+12*x^2-20*x+8.5;
x = 0;
y = 1;
h = 0.5;

try
  
 [Aproxi] = rungekutta3(f,x,y,h)
 x1=x:h:1;
 y1=-2.*(x1.^3)+12.*(x1.^2)-20.*(x1)+8.5
 plot(x1,y1,'r')
 xlabel('T')
 ylabel('y')
 title('Metodo Rugen-Kutta de tercer orden')
 hold on
 grid on
  
catch err
  
  fprintf('Error: %s\n',err.message);
  %err.identifier
  
end_try_catch