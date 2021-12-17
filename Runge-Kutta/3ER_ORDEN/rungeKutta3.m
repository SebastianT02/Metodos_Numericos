% METODO DE RUNGE-KUTTA: Solucion de Ecuaciones Diferenciales metodo de orden 
%                        dos calcula los valores de k1 
%                        y k2 de acuerdo a la formula de Runge-Kutta usando Heun.
%
%       rungekutta3(f,x,y,h) llenar.
%       [Aproxi] = rungekutta3(f,x,y,h)
%       h = paso que hay de un punto.
%       x = valor de x incial.
%       y = valor de y incial.
%       f = ecuacion diferencial de ti Dy/Dt.
%       
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/ $
%   Built-in function.
clc;
function [Aproxi] = rungekutta3(f,x,y,h)
  
  % Comprobacion del error
  if h == 0;
      fprintf('error')
      msgID = 'E.D mediante Runge-Kutta';
      msg = 'Error:Falta de datos';
      %baseException = MException(msgID,msg);
      %throw(baseException);
      error(msgID,msg);
  end 
  
  #Encontramos los valores de K1, K2, y K3
  k1 = f(x,y);
  k2 = f(x+(h/2), y+((k1*h)/2));
  k3 = f(x+(h), y-(k1*h)+(2*k2*h));
  #Mediante la formula encontramos la aproximacion.
  Aproxi= y+ (h/6)*(k1 + 4*k2 + k3);

end
