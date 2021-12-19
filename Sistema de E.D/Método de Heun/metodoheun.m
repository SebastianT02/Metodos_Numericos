%SISTEMA DE ECUACIONES METODO DE HEUN  Solucion de Ecuaciones Diferenciales 
%
%   (f,F_exacta,condicion,a,b,h) llenar
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
%   $Revision: 0.1 $  $Date: 2021/12/19 $
%   Built-in function.
function [tabla,valor] = metodoheun(funcion,condicion,a,b,ne,h)
  
  % Cambio de tipos de datos
  f = funcion;             % Designa una variable sencilla a la matriz funcion
  y0 = condicion;          % Matriz de los valores iniciales de la ecuacion
  ne = double(2);          % Numero de Ecuaciones diferenciales 
  a = double(a);           % Limite inferior del rango de E.D
  b = double(b);           % Limite superior del rango de E.D
 
  % Discretizamos
  h = double(h);           % Saltos de rango 
  N = round((b-a)/h);      % Valor de n iteraciones del metodo de heun
  t = linspace(a,b,N+1);   % Valores de nodos de T
  y = zeros(ne,N+1);       % Matriz de zeros para rellenar
  y(:,1) = y0;
  
  % Comprobacion del error
  if a == b
      fprintf('error')
      msgID = 'E.D por metodo de heun error';
      msg = 'Error: datos incorrectos';
      %baseException = MException(msgID,msg);
      %throw(baseException);
      error(msgID,msg);
  end 
  
  % Aplicación del método de Heun
  for i=1:N
    
    % Cálculo de valores de k1 y k2, de acuerdo a la formula de Heun
    k1 = f(t(i),y(:,i));
    k2 = f(t(i)+h,y(:,i)+k1*h);
    
    y(:,i+1) = y(:,i)+h/2*(k1+k2); % Ecuacion de recurrencia del metodo de heun
    
  end
   tabla = [t',y'];                % Tabla de referencia hecha por el metodo
   valor = [y(1,N+1),y(2,N+1)];        % Valor del dato
end