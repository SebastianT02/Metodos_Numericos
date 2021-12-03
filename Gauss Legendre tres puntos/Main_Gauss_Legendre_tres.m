% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
% Descripcion: Funcion que aproxima el valor de la integral de una funcion 
%usando tres puntos,llamada Gauss-legendre de dos puntos.
%
% Problema 1:
% En una planta química se sintetiza un producto que es utilizado posteriormente
% como conservante de productos enlatados. El rendimiento del proceso depende de la
% temperatura. Es asi que se pretende encontar la funcion que permitira identificar
% como utilizar de una manera correcta,asi elevando las ganancias.Para lo cual se 
% dispone de los siguientes datos.

f='exp(x)*sin(x)/(x^2 + 1)';
a=0;
b=50;
try 
    analitica=[];
    numerica=[];
    for j=b
       res=Gauss_Legendre_tres(f,a,b);
       analitica=[analitica,res]; 
       numerica=[numerica,inte(f,a,b)];
    end
    fprintf("El resultado de la integral es: \n")
    disp(analitica);
    plot(b,analitica);
    hold on;
    plot(b,numerica,'*r');
    legend('Análitica','Numérica');
catch e
    fprintf('Error: %s\n', e.message);
end