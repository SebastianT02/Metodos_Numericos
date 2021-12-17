% METODO DE RUNGE-KUTTA: Solucion de Ecuaciones Diferenciales metodo de orden 
%                        dos calcula los valores de k1 
%                        y k2 de acuerdo a la formula de Runge-Kutta usando Heun.
%
%       rungekutta(f,x0,y0,xf,a2,n) llenar
%       [xa; ya; x; y] = rungekutta(f,x0,y0,xf,a2,n)
%       n = Iteraciones de la funcion
%       x0 = valor de x incial
%       y0 = valor de y incial
%       f = ecuacion diferencial de ti Dy/Dt
%       xf = valor de x final
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/ $
%   Built-in function.
clc;
function [xa ya x y] = rungekutta(f,x0,y0,xf,n)
  
  % Comprobacion del error
  if n == 0;
      fprintf('error')
      msgID = 'E.D mediante Runge-Kutta';
      msg = 'Error: Iteraciones minimas';
      %baseException = MException(msgID,msg);
      %throw(baseException);
      error(msgID,msg);
  end 
  
  
  #Valores pricipales para la funcion de Rungge-Kutta
  a2=0.5;
  h=(xf-x0)/n;
  a1=1-a2;
  p1=1/2/a2;
  q11=p1;  
  xa(1)=x0;
  ya(1)=y0;
  
  for i=1:n
    #Encontramos los valores de xa, K1 y K2
    xa(i+1)=xa(i)+h;
    k1 = f(xa(i),ya(i));
    k2 = f(xa(i)+p1*h,ya(i)+q11*k1*h);
    #Mediante la ecuacion de Rugen-Kutta calculamos la solucion
    ya(i+1)=ya(i)+(a1*k1+a2*k2)*h;
    
  endfor
  
  #Calculamos el valor de la Ecuacion Diferencial
  Valor_Calculado=ya(n+1)
  
  #Calculamos el valor verdadero mediante la funcion ode45 de Octave
  solex=[x0 xf];
  [x,y] = ode45(f,solex,y0);
  [yfi dummy]=size(y);
  Valor_Real=y(yfi)
  
  #Calculo de error
  ERROR = Valor_Real-Valor_Calculado
  
end
