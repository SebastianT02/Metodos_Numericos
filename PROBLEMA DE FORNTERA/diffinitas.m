% METODO DE Diferencias-Finitas: Solucion de Ecuaciones Diferenciales mediante 
%                                el metodo diferencias finitas.
%
%       diffinitas(x0,xf,y0,yf,n) llenar
%       [ x y ] = diffinitas(x0,xf,y0,yf,n)
%       n = numero de puntos interiores
%       x0 = valor de x incial
%       y0 = valor de y incial
%       yf = valor de y final
%       xf = valor de x final
%
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/23 $
%   Built-in function.

clc;
function [ x y ] = diffinitas(x0,xf,y0,yf,n)

  % Comprobacion del error
  if n == 0;
      fprintf('error')
      msgID = 'E.D mediante Runge-Kutta';
      msg = 'Error: Iteraciones minimas';
      %baseException = MException(msgID,msg);
      %throw(baseException);
      error(msgID,msg);
  end 
  
  # definimos el paso que se utilizara generalmente
  h = (xf-x0)/(n+1);
  # creamos un vector mediante linspace
  x = linspace(x0,xf,n+2);
  # Inicializamos el vector b
  b = zeros(n,1);
  # Inicializamos la matriz identidad y definimos la diagonal
  A = eye(n)*(h^2-8);

  # Definiremos finalmente la matriz a y calcularemos los valores de B
  for k=1:n-1
      # Realizamos las operaciones para la matriz A
      A(k,k+1)=-h+4;
      A(k+1,k)=h+4;
      # Formaremos el vector de soluciones para nuestra ecuacion.
      b(k)=-h^2*x(k+1);
  end
  
  # Definiremos la primera componente de B
  b(1)=-h^2*x(2)-9*y0;
  # Continuaremos con los valores de B
  b(n)=-h^2*x(n+1)+yf;
  # Resolvemos el sistema de ecuaciones mediante matrices
  y=inv(A)*b;
  # Construimos el vector incluyendo los valores de y0 y yf
  y=[y0;y;yf];  
end