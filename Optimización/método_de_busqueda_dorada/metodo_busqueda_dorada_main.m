% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2022/01/07
% Descripción: El método de búsqueda de la sección dorada consiste en enco-
% trar el valor optimo de x de una funcion unimodal que tiene un solo extr-
% mo.

% Ejemplo 1:
% Se desea conocer el punto máximo en x de la siguiente funcion para 
% optmizar el uso de recursos de una planta de creación de placas de
% arduino, esta se rige por una funcion en concreto por lo cual de un
% tiempo a otro se desea conocer el mejor punto, este rango va de [0.1 pi]
% con un margen de tolerancia de 0.0001.

% Datos del ejercicio
clc,clear
funcion = @(x) sin(x);
li = 0.1;
ls = pi;
tolerancia = 1e-4;

try
    fprintf('Método de la Búsqueda de la sección Dorada \n')
    [xe,y,iteraciones] = metodo_busqueda_dorada(funcion,li,ls,tolerancia)
    
    % Creación de la gráfica de la función y el punto optimo
    xx = linspace(li,ls,100);
    yy = linspace(0,funcion(xe),1000);
    F = funcion(xx);
    plot(xx,F)
    xlim([li ls]);
    ylim([0 1.1]);
    hold on;
    title('Método de la Búsqueda Dorada')
    plot(xe,funcion(xe),'k*')
    plot(xx,1,'y_')
    plot(xe,yy,'y|')
    legend('Función sin(x)','Punto Optimo','Referencia lineal')
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end


