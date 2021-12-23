% METODO DE Diferencias-Finitas: Solucion de Ecuaciones Diferenciales mediante 
%                                el metodo diferencias finitas.
%
%       diffinitas2 (n,h,x)
%       [x y] = diffinitas2 (n,h,x)
%       n = numero de puntos interiores
%       x = valores de x 
%       h = valor de saltos entre puntos interiores
%
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/23 $
%   Built-in function.
clc;
function [x y] = diffinitas2 (n,h,x)
  
  % Comprobacion del error
  if n == 0;
      fprintf('error')
      msgID = 'E.D mediante Runge-Kutta';
      msg = 'Error: Iteraciones minimas';
      %baseException = MException(msgID,msg);
      %throw(baseException);
      error(msgID,msg);
  end 
  
  #Calculamos el tamano del vector x
  p = length(x);
  
  #Iniciamos el bucle for y calculamos los valores de 
  for i=2:p
      #Valor de punto inicial
      y(1)=0;
      #Calculamos los valores de la curva mediante diferencias finitas.
      y(i)=h*sin(x(i-1))+y(i-1);
    
  end

end
