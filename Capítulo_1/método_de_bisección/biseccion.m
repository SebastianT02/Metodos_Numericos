%Método de Bisección   Solucion para encontrar la raiz de una función no lineal
%   biseccion(funcion,li,ls,tolerancia) llenar
%       [iteraciones,convergencia,tiempo]= biseccion(funcion,li,ls,tolerancia)

%        funcion    = La funcion a trabajar.
%        ls         = Limite inferior del intervalo
%        li         = Limite superior del intervalo
%        tolerancia = El error máximo permitido
%            
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/26 $
%   Built-in function.
function [iteraciones,convergencia,punto_de_raiz]=biseccion(funcion,li,ls,tolerancia)
  tic;
  funcion = inline(funcion);
  convergencia = '';
  contador = 0;
  
  %Error al ver
  if(funcion(li)*funcion(ls)>0)
    convergencia = 'No converge';
    msgID = 'Biseccion Condicion:No es ejecutable';
    msg = 'Error pues no converge la función';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
  end

  %Comienzo de Iteraciones para encontrar la raiz
  while (abs(ls-li)>tolerancia)
    medio = (li+ls)/2;
    
    if (funcion(li)*funcion(medio)<0) %La funcion cambia de signo en [li,medio]
      ls = medio; 
    endif
    if (funcion(medio)*funcion(ls)<0) %La funcion cambia de signo en [medio,ls]
      li = medio;      
    endif
    if (abs(funcion(medio))<eps) %Finaliza al hallar la raiz
      ls = medio;
      fprintf('\n La raiz es %f\n\n',medio)
    endif
    
    %Actualizamos las iteraciones dadas
    contador = contador+1;
  endwhile
  
  % Especifico los valores a mostrar en la función main.m 
  convergencia = 'Si Converge';
  iteraciones = contador;
  format long
  punto_de_raiz = (li+ls)/2;
  toc;
end
