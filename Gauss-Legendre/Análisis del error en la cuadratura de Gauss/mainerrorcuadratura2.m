% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
% Descripcion: Funcion que aproxima el valor de la integral de una funcion 
%usando tres puntos,llamada Gauss-legendre de dos puntos.
%
% Problema 2:
% El pentóxido de dinitrógeno gaseoso puro reacciona en un reactor intermitente
% según la reacción estequiométrica. Calcule la integral aproximada de la
% funcion de Gauss Legendre de dos puntos con los datos.
clear;clc;
try
   syms x
   f= 0.1 + 10*x - 100*x.^2 + 127*x.^3 - 500*x.^4;
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