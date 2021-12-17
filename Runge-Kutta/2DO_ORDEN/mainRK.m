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
% Un circuito RL tiene una fem de  voltios, una resistencia de ohmios,
% una inductancia de 1 henrio y no tiene corriente inicial, Halle la
% corriente en el circuito para un momento t

# Datos del Ejercicio
f=@(x,y) y*x^2-1.2*y
x0=0;
y0=1;
xf=2;
n=5;

try
  
  # Calculamos los valores mediante la funcion creada
  [xa ya x y] = rungekutta(f,x0,y0,xf,n);
  #Graficamos las funciones para comprobar su exactitud
  hold on
  grid on
  xlabel('x');ylabel('y');
  title('Soluciones de la ED usando Runge-Kutta de 2 Orden');
  plot(x,y,'--','LineWidth',2,'Color',[0 0 1]);
  plot(xa,ya,'--','LineWidth',2,'Color',[0 1 0]);
  legend('S.Exacta','S.Aproximada');
  
catch err
  
  fprintf('Error: %s\n',err.message);
  %err.identifier
  
end_try_catch