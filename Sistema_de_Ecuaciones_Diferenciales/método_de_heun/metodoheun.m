%SISTEMA DE ECUACIONES METODO DE HEUN  Solucion de Ecuaciones Diferenciales 
%
%   metodoheun(funcion,condicion,a,b,ne,h llenar
%       [tabla,valor] = metodoheun(funcion,condicion,a,b,ne,h)
%       f = funcion;             % Designa una variable sencilla a la matriz funcion
%       y0 = condicion;          % Matriz de los valores iniciales de la ecuacion
%       ne = double(2);          % Numero de Ecuaciones diferenciales 
%       a = double(a);           % Limite inferior del rango de E.D
%       b = double(b);           % Limite superior del rango de E.D
%       h = saltos del rango

%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/19 $
%   Built-in function.
function [valor,tabla] = metodoheun(funcion,condicion,a,b,ne,h)
  
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
   valor = [y(1,N+1),y(2,N+1)];        % Valor del dato
   tabla = [t',y'];                % Tabla de referencia hecha por el metodo
   
end