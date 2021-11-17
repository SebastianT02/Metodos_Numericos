% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 2021/11/12
% Descripcion: Se trata de una serie de algoritmos del álgebra lineal 
% para determinar los resultados de un sistema de ecuaciones lineales.
%
% Problema 1:
% En una planta química se sintetiza un producto que es utilizado posteriormente
% como conservante de productos enlatados. El rendimiento del proceso depende de la
% temperatura. Es asi que se pretende encontar el polinomio que permitira identificar
% como utilizar de una manera correcta,asi elevando las ganancias.Para lo cual se 
% dispone de los siguientes datos.

clc;
x0=linspace(0,0.5,100); %Genera varios valores a probar
f = @(x) -0.1*x^4-0.15*x^3-0.5*x^2-0.25*x+1.2; %funcion
h=0.25; %ancho
analitica=[]; %iniciadores
numerica=[];

try
    for x=x0
        analitica=[analitica,diferenciadefinida(x,f,h,1,1)];
    end
    syms t;
    %ft=log(t)*tan(t);
    %ft=t^2;
    ft =-0.1*t^4-0.15*t^3-0.5*t^2-0.25*t+1.2;
    for p=x0
        numerica=[numerica,subs(diff(ft,t),p)];
    end
    disp("Resultados:");
    disp(analitica);
    plot(x0,analitica,'*r');
    hold on;
    plot(x0,numerica,'*r');
    legend('Análitica','Numérica');
    ylabel("f'(x)");
    xlabel("x");  
catch err
    fprintf ('Error: %s\n', err.message);
end