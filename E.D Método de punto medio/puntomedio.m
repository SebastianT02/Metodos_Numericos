%METODO DE PUNTO MEDIO   Solucion de Ecuaciones Diferenciales 
% metodo de orden dos, solo se ejecuta, solo calcula los valores de k1 y k2
% de acuerdo a la formula de punto medio.
%   puntomedio(f,F_exacta,condicion,a,b,h) llenar
%       [valor,valor_exacto,Error] = puntomedio(f,F_exacta,condicion,a,b,h)
%       n = valor de la division de limite_superior-limite_inferior/valor_h
%       T = nodos de las aproximaciones
%       Y(1) =  condicion inicial de la ecuacion diferencial
%       f = ecuacion diferencial de ti Dy/Dt
%       F_exacta = valor real de la ecuación diferencial
%       a = limite inferior del rango
%       b = limite superior del rando de valores
%       h = saltos del rango

%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/ $
%   Built-in function.
function [valor,valor_exacto,Error] = puntomedio(f,F_exacta,condicion,a,b,h)
  format long;
  syms t y;                      % Declaración de terminos con symbolic
  % Cambio de tipos de datos
  f = sym(f);
  Y(1) = condicion;
  n = round((b-a)/h);            % Valor de n para las iteraciones
  T = [a:h:b];                   % Valores de nodos de T
  F = double(subs(F_exacta,T));  % Cálculo de ecuacion diferencial con syms

  % Comprobacion del error
  if a == b
      fprintf('error')
      msgID = 'E.D por punto medio error';
      msg = 'Error: datos incorrectos';
      %baseException = MException(msgID,msg);
      %throw(baseException);
      error(msgID,msg);
  end 
  
  % Aplicación del método del punto medio
  for i=1:n
    % Cálculo de valores de k1 y k2, de acuerdo a la formula del punto med.
    k1 = subs(f,[t y],[T(i) Y(i)]);
    k2 = subs(f,[t y],[T(i)+(h/2),Y(i)+(h*k1/2)]);
    Y(i+1) = Y(i)+h*k2;         % Ecuacion de recurrencia del punto medio
    Error = abs(F(i+1)-Y(i+1)); % Cálculo del error de cada iteración hecha
    
  end
  valor = double(Y(n+1));
  valor_exacto = double(F(n+1));
  Error_de_punto_medio = double(Error);
end
