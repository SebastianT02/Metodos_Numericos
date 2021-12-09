%METODO DE GAUSS LAGUERRE   Solución de Integrales por aproximación 
%   gauss_la(n) llenar
%       [ceros,pesos]=laguerre(n)
%       p = coeficiente de polinomio de laguerre
%       n =  numero de reparticion de abscisas
%       integral_Aproximada = resultado de la función ejecutada
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/05 $
%   Built-in function.
function [ceros,pesos] = laguerre(n)
  p(1,1)=1;
  p(2,1:2)=[-1 1]; 
  
  if n == 0;
    msgID = 'Cuadratura de Gauss Chebyshev error';
    msg = 'Error: número de punto (n) es incorrecto';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
  end
  
  % Cálculo de los coeficientes del polinomio 
  for k=2:n
     p(k+1,1:k+1)=((2*(k-2)*[0 p(k,1:k)]+3*[0 p(k,1:k)]-[p(k,1:k) 0]-(k-1).^2*[0 0 p(k-1,1:k-1)]));
  end
  % Cálculo de las raices o abscisas
  coeficientes_polinomio=p(n+1,:);
  pesos = roots(coeficientes_polinomio);
  
  % Determina los coeficientes de 1era derivada del polinomio
  for i=1:n
    derivada_polinomio(i)=coeficientes_polinomio(i)*(n+1-i);
  endfor
  % Evalua, Consigue los ceros de la integral
  for i=1:n
    x = pesos(i);
    suma = 0;
    for j=1:n
      suma = suma + derivada_polinomio(j)*(x.^(n-j));
    endfor
    ceros(i,1)=(factorial(n).^2)/(pesos(i)*(suma.^2));
  endfor
endfunction