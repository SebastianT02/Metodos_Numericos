% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
% Descripcion: Funcion que aproxima el valor de la integral de una funcion 
% usando dos puntos,llamada Gauss-legendre de dos puntos.
%
% Problema 2:
% El pentóxido de dinitrógeno gaseoso puro reacciona en un reactor intermitente
% según la reacción estequiométrica. Calcule la integral aproximada de la
% funcion de Gauss Legendre de dos puntos con los datos.

clear;clc;
syms x
%datos inicilaes
f=@(x)0.1 + 10*x - 100*x.^2 + 127*x.^3 - 500*x.^4;
a=0;
b=linspace(1,3,50);
try 
    analitica=[];
    numerica=[];
    for j=b
       resultado=Gauss_Legendre_tres(f,a,j);
       analitica=[analitica,resultado]; 
       numerica=[numerica,int(f,x,a,j)];
    end
    fprintf("El resultado de la integral es: \n")
    disp(resultado);
    error=(resultado/2)*100
    plot(b,analitica);
    hold on;
    plot(b,numerica,'*r');
    legend('Análitica','Numérica');
catch e
    fprintf('Error: %s\n', e.message);
end