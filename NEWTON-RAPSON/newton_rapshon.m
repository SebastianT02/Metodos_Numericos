clc;
%Regresion cuadratica Ajuste con ecuaciones cuadráticas
%       regrecuadratica(FUN,X,Y)
%       solucion = regrecuadratica(fun, X, Y)
%       S"n: = #sumatorias utilizadas para crear la matriz con la cual se trabajara
%       fun = la función a tratar
%       solucion = matriz de resultados
%
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/28 $
%   Built-in function.

function [ea, xn] = newton_rapshon(f,d,maximoIteracion)
  
  xi=0;
  vector = [];
  i=1;
  
    if d(xi) == 0;
     msgID = 'renolineal : Datos incorrectos';
     msg = 'No se puede encontrar la raiz';
     error(msgID,msg)
    endif    
    
          xn = xi - ( f(xi)/d(xi) );
          
          while i < maximoIteracion
               
                vector(i) = xn;
                ea = abs(((xn-xi)/xn)*100);
                xi = xn;
                xn = xi - ( f(xi)/d(xi) );
                i++;

          endwhile
                vector(i) = xn;
                ea = abs(((xn-xi)/xn)*100);
                RAIZ = xn;


  end