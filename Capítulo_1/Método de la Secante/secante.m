%Método de Secante  Solucion para encontrar la raiz de una función no lineal
%   secante(funcion,x1,x2,tolerancia) llenar
%       [iteraciones,convergencia,punto_de_raiz] = secante(funcion,x1,x2,tolerancia)

%        funcion    = La funcion a trabajar.
%        ls         = Limite inferior del intervalo
%        li         = Limite superior del intervalo
%        tolerancia = El error máximo permitido
%            
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/26 $
%   Built-in function.
function [iteraciones,convergencia,punto_de_raiz] = secante(funcion,x1,x2,tolerancia)
  tic;
  funcion = inline(funcion);
  err = 100;
  contador = 1;
  xi = x2-(funcion(x2)*(x1-x2))/(funcion(x1)-funcion(x2));
  
  %Error 
  if xi=0
    convergencia = 'No converge';
    msgID = 'Secante Condicion:No es ejecutable';
    msg = 'Error pues no converge la función';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
  end

  %Comienzo de Iteraciones para encontrar la raiz
  while err > tolerancia
    
    xi = x2-(funcion(x2)*(x1-x2))/(funcion(x1)-funcion(x2));
    err = abs(((xi-x2)/xi)*100);
    x1 = x2;
    x2 = xi;
    
    %Actualizamos las iteraciones dadas
    contador = contador + 1;
  endwhile
  
  % Especifico los valores a mostrar en la función main.m
  iteraciones = contador;
  convergencia = 'Si convergencia';
  punto_de_raiz = xi;
  toc;
end
