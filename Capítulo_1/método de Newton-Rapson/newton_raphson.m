%Método de Newton Raphson   Solucion para encontrar la raiz de una función no lineal
%   newton_raphson(funcion,xi,tolerancia) llenar
%       [iteraciones,convergencia,punto_de_raiz] = newton_raphson(funcion,xi,tolerancia)

%        funcion    = La funcion a trabajar.
%        xi         = Punto inicial para encontrar la raiz
%        tolerancia = El error máximo permitido
%            
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/26 $
%   Built-in function.

function [iteraciones,convergencia,punto_de_raiz] = newton_raphson(funcion,xi,tolerancia)
  tic;                              % funcion para calcular el tiempo en seg
  funcion = inline(funcion);        
  contador = 1;
  err = 1;
  dx = 1e-5;                        % Delta x para el calculo de la derivada
  df = (funcion(xi+dx)-funcion(xi))/dx; % Calculo de la derivada inicial
  
  % Identificación del error
  if (df=0)
    convergencia = 'No converge';
    msgID = 'Newton Raphson Condicion:No es ejecutable';
    msg = 'Error pues no converge la función';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
  end
  
  % Comienzo de Iteraciones para encontrar la raiz
  while err > tolerancia
      df = (funcion(xi+dx)-funcion(xi))/dx;  % Calculo la derivada de la funcion
      xn = xi-funcion(xi)/df;                % Calcula un nuevo punto
      err = abs((xn-xi)/xn);                 % Actulaiza el error cada vez
      xi = xn;
      contador = contador + 1;               % Calcula la iteracion
  
  endwhile

  % Especifico los valores a mostrar en la función main.m
  iteraciones = contador;
  convergencia = 'si converge';
  punto_de_raiz = xn;
  toc;
end
