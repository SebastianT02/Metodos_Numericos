%METODO DE BUSQUEDA DE LA SECCI�N DORADA Solucion de m�ximos y m�nimos de
% funciones
% El m�todo de la busqueda de la secci�n dorada es una t�cnica para hallar
% el extremo m�ximo o m�nimo de una funci�n unimodal, es decir solo tiene
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
  % Asignaci�n de variables
  xL = limite_inferior;  % Creaci�n de variable del li
  xU = limite_superior;  % Creaci�n de variable del ls
  Err = inf;             % Creaci�n de la variable de exactitud
  contador = 0;          % Contador de iteraciones
  
% Evaluamos la funci�n en los puntos para optimizar velocidad
fL = funcion(xL);   % Funci�n evaluada en el l�mite inferior
fU = funcion(xU);   % Funci�n evaluada en el l�mite superior

% Asiganaci�n del numero aureo y su distancia
R  = 0.5*(sqrt(5) - 1);
d  = R*(xU - xL);  % Proporci�n aurea mulriplicada por la distancia del intervalo
x1 = xU - d;
x2 = xL + d;
% evaluiamos la funcion en estos dos nuevos intervalos en x1 y x2
f1 = funcion(x1);  % Funci�n objetivos evaluados en x1
f2 = funcion(x2);  % Funci�n objetivos evaluados en x2

%Comprobaci�n del error
if xL == 0 & xU == 0;
    xe=NaN;
    msgID = 'No se puede optimizar esta funcion';
    msg = 'Error M_Dorada: L�mites a evaluar incorrectos';
    %baseException = MException(msgID,msg);
    %throw(baseException);
    error(msgID,msg);
end


while Err > tolerancia
    % Actualiza el intervalo e identifica la posici�n del punto a encontrar
    if f1 > f2 % Posici�n en la izquierda del m�ximo
        xU = x2;
        fU = f2;
        % Asigna un nuevo parametro de busqueda x2
        x2 = x1;
        f2 = f1;
        % Asigna un nuevo parametro de busqueda x1 
        d = R*(xU - xL);
        x1 = xU - d;
        % Evalua la funci�n en nuevo parametro x1
        f1 = funcion(x1);
    elseif f1 < f2
        % Mueve la posici�n del l�mite inferior
        xL = x1;
        fL = f1;
        % Asigna un nuevo parametro de busqueda x1
        x1 = x2;
        f1 = f2;
        % Asigna un nuevo parametro de busqueda x2
        d  = R * (xU - xL);
        x2 = xL + d;
        % Evalua la funci�n en nuevo parametro x2
        f2 = funcion(x2);
    else
        xL = (x1 + x2)/2;
        xU = xL;
    end
    % Determinamos si ya converge con la exactitud requerida
    Err = 2*abs(xU - xL)/(xU + xL); % Actualiza la variable de error 
    contador = contador + 1;
end

% Calculo el punto optimo de la funci�n
xe = (x1 + x2)/2;
y = funcion(xe);
iteraciones = contador;

end









