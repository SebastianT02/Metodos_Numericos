% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 2021/11/12
% Descripcion: Se trata de una serie de algoritmos del álgebra lineal 
%para determinar los resultados de un sistema de ecuaciones lineales.
%
% Problema 1:
% En una planta química se sintetiza un producto que es utilizado posteriormente
% como conservante de productos enlatados. El rendimiento del proceso depende de la
% temperatura. Es asi que se pretende encontar el polinomio que permitira identificar
% como utilizar de una manera correcta,asi elevando las ganancias.Para lo cual se 
% dispone de los siguientes datos.

clc
%puntos
x=[1;-2;4];
y=[3;8;-4];

try
  fprintf('El polinomio es:\n');
  p=inter_newton(x,y)
  ezplot(p);
  hold on;
  plot(x,y,'*r')
  scatter(x,y,100)
  legend('interpolacion newton','puntos') 
catch err
  fprintf('Error: %s\n', err.message);
  %err.identifier
end