% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/12/6
% Descripcion: % La funcion de regresion se encarga de encontrar una linea que aproxime
% a una interpolacion de datos.
% Los parametros de la funcion  son f que viene siendo la funcion que sera 
% evaluada la integral, el intervalo a y b en el cual se evaluara la integral 
% finalmente n que sera el numero de nodos a tomar en cuenta para calcular 
% el polinomio de hermite de la funcion retornara I que guardara el valor de 
% la aproximacion de la integral

% Problema 1: Para las funciones de chebyshev, su forma general es de integral 
% int = w(x)*f(x)*dx donde w son los pesos el siguiente ejemplo es la superfice
% de agua abajo de un barco con la forma de la funcion w(t)*f(x) con un ancho de 2
% calcular el area del agua abajo del barco. w(x) = e^-x^2
clear;clc;
a=-1;
b=1;
n=3;
f_1=@(x) x^2;
hermite(f_1,1,1,n)


% cálculo del error
funcion_1 = @(x) e.^((-x).^2).*f_1;
syms x;
integral_real = int(funcion_1,x,-1,1)
error = ((integral_real-ans)/integral_real)*100

%Plot de la función
x_1 = -3:0.0001:3;
y_1 = (e.^(-x_1.^2)) .*(x_1.^2);
plot(x_1,y_1,'DisplayName','f(x)=e.^((-x).^2).*(x.^2)')
hold on
grid on
legend
title('Método de cuadratura de Gauss Hermite')
