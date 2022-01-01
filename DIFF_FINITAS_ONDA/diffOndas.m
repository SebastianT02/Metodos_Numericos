% METODO DE Diferencias-Finitas: Solucion de Ecuaciones Diferenciales mediante 
%                                el metodo diferencias finitas.
%
%       diffOndas (f,g,a,b,c,n,m)
%       u = diffOndas (f,g,a,b,c,n,m)
%       f = funcion
%       g = segunda funcion (variacion de x)
%       a = limite inferior
%       b = paso de cada punto;
%       c = limite superior
%       m,n = particiones a realizar
%
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/23 $
%   Built-in function.
clear;
clc;

function u = diffOndas (f,g,a,b,c,n,m)
  
  %Se comprueba si no existe errores
  if n < 0;
      fprintf('error')
      msgID = 'E.D mediante Runge-Kutta';
      msg = 'Error: Iteraciones minimas';
      %baseException = MException(msgID,msg);
      %throw(baseException);
      error(msgID,msg);
  end 
  
  %Se comprueba si no existe errores
  if m < 0;
      fprintf('error')
      msgID = 'E.D mediante Runge-Kutta';
      msg = 'Error: Iteraciones minimas';
      %baseException = MException(msgID,msg);
      %throw(baseException);
      error(msgID,msg);
  end
  
  %valores utilizados en la formula
  h = a/(n-1);
  k = b/(m-1);
  r = c*k/h;
  r2 = r^2;
  r22 = r^2/2;
  s1 = 1 - r^2;
  s2 = 2 - 2*r^2;
  u = zeros(n,m);
  
  for i=2:n-1
    
    u(i,1)=f(h*(i-1));
    u(i,2)=s1*f(h*(i-1))+k*g(h*(i-1))+r22*(f(h*i)+f(h*(i-2)));
    
  endfor
  
  for j=3:m
    
    for i=2:(n-1)
      
      u(i,j) = s2*u(i,j-1)+r2*(u(i-1,j-1)+u(i+1,j-1))-u(i,j-2);
      
    endfor
    
  endfor
  
endfunction
