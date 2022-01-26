%Método de Punto Fijo   Solucion para encontrar la raiz de una función no lineal
%   puntofijo(funcion,g,x1,x2,tolerancia) llenar
%       [iteraciones,convergencia,tiempo]= puntofijo(funcion,g,x1,x2,tolerancia)

%        funcion    = La funcion a trabajar.
%        g          = La funcion despejada
%        x1         = Limite inferior del intervalo
%        x2         = Limite superior del intervalo
%        tolerancia = El error máximo permitido
%            
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/26 $
%   Built-in function.
function [iteraciones,convergencia,punto_raiz]=puntofijo(funcion,g,x1,x2,tolerancia)
  tic;
  syms x;
  itermax = 1000;
  punto=(x1+x2)/2; % Se encuentra un punto intermedio para evaluar en la funcion
  dg=diff (g);     % Derivada de la ecuacion inicial
  e=100;           % Variable inicial de error
  contador=0;
  
    %Error al ver % Se comprueba el teorema
  if abs(subs(dg,punto))>1
    convergencia = 'No converge';
    msgID = 'Punto Fijo Condicion:No es ejecutable';
    msg = 'Error pues no converge la función';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
  else 
    
    %Comienzo de Iteraciones para encontrar la raiz
    while (e>tolerancia&&contador<itermax) %Margen de error
      r = abs(subs(g,punto)); %Se evalua los puntos
      double(r);
      e = abs(((r-punto)/(r))*100); %Calculo del error del resultado
      punto = r;
      % Actualizamos las iteraciones dadas
      contador = contador+1;
      if contador==itermax
        warning (" Se han alcanzado las iteraciones maximas ");
        break;
      end
    end
  end
  
  % Especifico los valores a mostrar en la función main.m
  n = abs( double (r));
  iteraciones = contador;
  convergencia = 'si converge';
  punto_raiz = n;
  toc;
end
