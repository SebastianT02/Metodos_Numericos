%METODO DE BUSQUEDA DE LA SECCIÓN DORADA Solucion de máximos y mínimos de
% funciones
% El método de la busqueda de la sección dorada es una técnica para hallar
% el extremo máximo o mínimo de una función unimodal, es decir solo tiene
% un extremo, todo mediante reducciomes sucesivas del rango de valores
%   metodo_busqueda_dorada(funcion,limite_inferior,limite_superior,tolerancia) llenar
%       [xe,iteraciones] = metodo_busqueda_dorada
%       funcion = funcion a evaluar sus extremos
%       limite inferior = valor inferior del rango
%       limite superior = valor superior del rango
%       tolerancia = error permitido del valor final
%       numero de iteraciones = iteraciones hechas
%       xe = punto optimo
%
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2022/01/07 $
%   Built-in function.
% funcion, limite inferior , limite superior, proporcion dorada, resultado de exactitud
function [xe,y,iteraciones] = metodo_busqueda_dorada(funcion,limite_inferior,limite_superior,tolerancia)
  % Asignación de variables
  xL = limite_inferior;  % Creación de variable del li
  xU = limite_superior;  % Creación de variable del ls
  Err = inf;             % Creación de la variable de exactitud
  contador = 0;          % Contador de iteraciones
  
% Evaluamos la función en los puntos para optimizar velocidad
fL = funcion(xL);   % Función evaluada en el límite inferior
fU = funcion(xU);   % Función evaluada en el límite superior

% Asiganación del numero aureo y su distancia
R  = 0.5*(sqrt(5) - 1);
d  = R*(xU - xL);  % Proporción aurea mulriplicada por la distancia del intervalo
x1 = xU - d;
x2 = xL + d;
% evaluiamos la funcion en estos dos nuevos intervalos en x1 y x2
f1 = funcion(x1);  % Función objetivos evaluados en x1
f2 = funcion(x2);  % Función objetivos evaluados en x2

%Comprobación del error
if xL == 0 & xU == 0;
    xe=NaN;
    msgID = 'No se puede optimizar esta funcion';
    msg = 'Error M_Dorada: Límites a evaluar incorrectos';
    %baseException = MException(msgID,msg);
    %throw(baseException);
    error(msgID,msg);
end


while Err > tolerancia
    % Actualiza el intervalo e identifica la posición del punto a encontrar
    if f1 > f2 % Posición en la izquierda del máximo
        xU = x2;
        fU = f2;
        % Asigna un nuevo parametro de busqueda x2
        x2 = x1;
        f2 = f1;
        % Asigna un nuevo parametro de busqueda x1 
        d = R*(xU - xL);
        x1 = xU - d;
        % Evalua la función en nuevo parametro x1
        f1 = funcion(x1);
    elseif f1 < f2
        % Mueve la posición del límite inferior
        xL = x1;
        fL = f1;
        % Asigna un nuevo parametro de busqueda x1
        x1 = x2;
        f1 = f2;
        % Asigna un nuevo parametro de busqueda x2
        d  = R * (xU - xL);
        x2 = xL + d;
        % Evalua la función en nuevo parametro x2
        f2 = funcion(x2);
    else
        xL = (x1 + x2)/2;
        xU = xL;
    end
    % Determinamos si ya converge con la exactitud requerida
    Err = 2*abs(xU - xL)/(xU + xL); % Actualiza la variable de error 
    contador = contador + 1;
end

% Calculo el punto optimo de la función
xe = (x1 + x2)/2;
y = funcion(xe);
iteraciones = contador;

end









