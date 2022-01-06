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
% tiempo a otro se desea conocer el mejor punto, este rango va de [0 5]
% con un margen de tolerancia de 0.0001.

% Datos del ejercicio
clc,clear
funcion = @(x) 2*sin(x) - 0.1*x^2;
li = 0;
ls = 5;
tolerancia = 1e-4;

try
    fprintf('Método de la Búsqueda de la sección Dorada \n')
    [xe,y,iteraciones] = metodo_busqueda_dorada(funcion,li,ls,tolerancia)
    
    % Creación de la gráfica de la función y el punto optimo
    xx = linspace(li,ls,100);
    yy = linspace(-5,funcion(xe),1000);
    funcion_1 = @(x) 2.*sin(x) - 0.1*x.^2;
    F = funcion_1(xx);
    plot(xx,F)
    %xlim([li ls]);
    %ylim([0 1.1]);
    hold on;
    title('Método de la Búsqueda Dorada')
    plot(xe,funcion_1(xe),'k*')
    plot(xx,funcion(xe),'y_')
    plot(xe,yy,'y|')
    legend('Función 2*sin(x) - 0.1*x^2','Punto Optimo','Referencia lineal')
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
