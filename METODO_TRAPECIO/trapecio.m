%Uso de áreas trapezoidales: Implementar la integración numérica 
%                            usando la regla del trapecio
%       trapecio(funcion,lim_superior,lim_inferior,trapecios)
%       
%       f = funcion a utilizar
%       b = limite superior de la integral
%       a = limite inferior de la integral
%       n = numero de trapecios
%       delta = multiplicador de reultados
%       s = resultado del area final
%
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/02$
%   Built-in function.
clc;
function [delta, s] =  trapecio(f,b,a,n)
  
  %Comprobación del error
    if b < a
    msgID='Trapecio_condicion: Datos incorrectos';
    msg='El limite superior es menor al limite inferior';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
    end
  
  % Definimos el delta de la formula
  delta_0=(b-a)/n;
  % Es la variable que va a ir sumando los calculos
  s=0; 
  for i=0:n
    % Definimos los x iniciales 'xi' para usar en la formula
    xi = a+i*delta_0; 
    % El delta final 'delta' que va a multiplicar cada expresion de la sumatoria
    delta = delta_0/2;
    % Segun la primera o segunda iteracion el coeficiente que multiplica a los 
    % terminos de la formula sera '1' 
    if (i==0 || i==n) 
      coef = 1;
      prod = coef*f(xi);
    % Para el resto de los terminos de la formula indicamos que el coeficiente 
    % que multiplica es 2  
    else 
      coef = 2;
      prod = coef*f(xi); %Efectuo dicha multiplicacion
    end
    % Multiplicamos el producto anterior por el delta final
    result=delta*prod;
    % Acumulamos los resultados en la sumatoria 
    s=s+result; 
  end
endfunction