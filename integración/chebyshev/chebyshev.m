%METODO DE GAUSS CHEBYSHEV   Soluci�n de Integrales por aproximaci�n 
%   hebyshev(funcion,n) llenar
%       [integral_aproximada,integral_real,error] = chebyshev(funcion,n)
%       Ai = Valor constante de todos los pesos
%       suma = sumatoria de las diferentes abscisas y evaluadas
%       integral_Aproximada = resultado de la funci�n ejecutada
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/05 $
%   Built-in function.
function [integral_aproximada] = chebyshev(funcion,n)
    format long;
 %Comprobaci�n del error
    if n<0 || n>6
        msgID = 'Cuadratura de Gauss Chebyshev error';
        msg = 'Error: n�mero de punto (n) es incorrecto';
        #baseException = MException(msgID,msg);
        #throw(baseException);
        error(msgID,msg);
     end
     
     %Valor constante para todos los pesos 
     Ai = pi/(n+1);
     suma = 0;  % Sumatoria de los diferentes xi y evaluarlos en la funcion
     
     for i = 0:n
       % C�lculo de los ceros de la integral, es decir, las abscisas de los puntos
       xi = cos(((2*i+1)*pi)/(2*n+2));
       suma = suma + funcion(xi);
     endfor
     %c�lculo de la integral aproximada 
     integral_aproximada = Ai * suma;
   
     
endfunction