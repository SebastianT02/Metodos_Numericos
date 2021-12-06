% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
% Descripcion: Funcion que aproxima el valor de la integral de una funcion 
%usando tres puntos,llamada Gauss-legendre de dos puntos.
%
% Problema 1:
% En una planta química se sintetiza un producto que es utilizado posteriormente
% como conservante de productos enlatados. El rendimiento del proceso depende de la
% temperatura. Es asi que se pretende encontar la funcion que permitira identificar
% como utilizar de una manera correcta,asi elevando las ganancias.Para lo cual se 
% dispone de los siguientes datos
clear;clc;
try
   syms x
   f = 0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5;
   pretty(f)

   f1= 1-exp((-12.5/68.1)*x);
   pretty(f1)
   n=10;
   x0=1/sqrt(3);
   e=errorcuadratura(f1,n,x0);
   double(e)
catch e
    fprintf('Error: %s\n', e.message);
end
