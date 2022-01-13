% METODO DE BUSQUEDA DE INTERPOLACIÓN CUADRÁTICA
% Encuentra la interpolacion cuadratica donde este método
% inicia con tres puntos x1, x2 y x3 en orden creciente y ubicados a 
% una igual distancia.
%
% Parámetros --> fun:funcion; x0,x1,x2:puntos iniciales; tol:tolerancia.
%
% Retorna --> x3: punto; min:punto minimo de la funcion, error y la tolerancia
% Copyright 2021-2022 Universidad de Cuenca.
% $Revision: 0.1 $  $Date: 2022/01/13 $
% Built-in function.

function [x3,min,error,iteraciones]=M_InterCuadratica(fun,x0,x1,x2,tol)
%Comprobacion del error
if isnumeric(tol) ~= 1 
    msgID = 'InterCuadratic; Error en las condiciones';
    msg = 'Error: El dato ingresado es incorrecto';
    error(msgID,msg)
    %baseException = MException(msgID,msg);
    %throw(baseException);
    error(msgID,msg);
end
      
N=100; %error aproximado
for i = 1:N
    %valor a encontrar(formula del metodo)
    x3=(fun(x0)*((x1^2)-(x2^2))+fun(x1)*((x2^2)-(x0^2))+fun(x2)*((x0^2)-(x1^2)))/(2*fun(x0)*(x1-x2)+2*fun(x1)*(x2-x0)+2*fun(x2)*(x0-x1));
    %valores
    x0=x1;
    x1=x2;
    x2=x3;
    %contador de las iteraciones
    contador=i+1;
    
    %error
    currentv(contador)=x3;
    iteraciones=contador-1;
    error=abs(currentv(contador)-currentv(contador-1));
    
    if error < tol
        break;
    end
%punto minimo 
min=fun(x3);
end
    
    
    