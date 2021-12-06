% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
% Descripcion: Funcion que aproxima el valor de la integral de una funcion 
%usando tres puntos,llamada Gauss-legendre de tres puntos.
%
% Problema 1:
% En una planta química se sintetiza un producto que es utilizado posteriormente
% como conservante de productos enlatados. El rendimiento del proceso depende de la
% temperatura. Es asi que se pretende encontar la funcion que permitira identificar
% como utilizar de una manera correcta,asi elevando las ganancias.Para lo cual se 
% dispone de los siguientes datos.

clear;clc;
syms x
%datos iniciales
f=@(x)0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4+ 400*x.^5;
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