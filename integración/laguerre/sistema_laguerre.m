%METODO DE GAUSS LAGUERRE   Soluci�n de Integrales por aproximaci�n 
%   sistema_laguerre(funcion,n) llenar
%       [ceros,pesos]=laguerre(n)
%       p = coeficiente de polinomio de laguerre
%       n =  numero de reparticion de abscisas
%       integral_Aproximada = resultado de la funci�n ejecutada
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/05 $
%   Built-in function.
function [integral_aproximada] = sistema_laguerre(funcion,n)
[ceros,pesos]=laguerre(n) % Llamamos la funci�n Laguerre
tamano = size(ceros,1);    % Tama�o de la matriz de ceros y no obtener error
integral_aproximada = 0;   % Suma de integrales parciales
% Bucle para la sumatoria de integrales
for i=1:tamano,
  x = pesos(i);
  integral_aproximada = integral_aproximada + ceros(i)*funcion(pesos(i));
end;

