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

clc 
function [y_o, R2] = regrecuadratica(X, Y)
  
  %Errores de los vectores del mismo tamano 
  if size(X) != size(Y);
    L=NaN;
    U=NaN;
    msgID = 'renolineal : Datos incorrectos';
    msg = 'Mal ingreso de datos';
    error(msgID,msg)
  endif
  
  %Se realizan las sumatorias correspondientes para armar la matriz  
  n = length(X);%Numero total de elementos
  S1 = sum(X);
  S2 = sumsq(X);
  S3 = sum(X.^3);
  S4 = sum(X.^4);
  S5 = sum(Y);
  S6 = sum(X.*Y);
  S7 = sum(X.*Y.^2);
  
  %Se contruye la matriz A con los resulatdos obtenidos
  A = [n S1 S2; 
      S1 S2 S3; 
      S2 S3 S4]; %En este caso sera una matriz de 3*3
  
  %Se contruye la matriz aumentada con los resultados faltantes 3*1
  B = [S5;
       S6;
       S7];
  
  %Se encuentra los resultados para los coeficientes de la ecuacion 
  C = matinversa(A)*B;
  
  %Se vuelve a calcular los valores para la linea y_o
  y_o = C(1)+C(2)*X+C(3)*X.^2;
  
  %Coeficiente de determinacion
  MY = mean(Y);
  VY = sumsq(Y-MY)/n;
  VF = sumsq(y_o-MY)/n;
  R2 = VF/VY;
  
  endfunction