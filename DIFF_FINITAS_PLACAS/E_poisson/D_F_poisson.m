%METODO DE DIFERENCIAS FINITAS E.P con temperaturas preescriptas Solucion 
% de Ecuaciones Diferenciales 
% Método de diferencias finitas con la ecuación de Poisson, se calcula los 
% U de la ecuacion matricial A*u=b, encontrar las aproximaciones
%   D_F_poisson(L,K0,a,b,N,Q) llenar
%       [U] = D_F_poisson(L,K0,a,b,N,Q)
%       L = Longitud del dispositivo
%       a,b = valores preescriptos de la temperatura
%       m = puntos verticales de la figura
%       Q = fuente,función a estudiar, no se puede integrar
%
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2022/01/03 $
%   Built-in function.
function [U,X] = D_F_poisson(L,K0,a,b,N,Q)
  % Asignación de variables
  h = L/N; % tamaño de los puntos
  N = 30;  % subintervalos por defecto
  
  % Comprobacion del error
 if N == 0  % Analiza el número de subintervalos del dispositivo
     fprintf('error')
     msgID = 'E.D por diferencias finitas error';
     msg = 'Error: Puntos de los nodos incorrectos';
     %baseException = MException(msgID,msg);
     %throw(baseException);
     error(msgID,msg);
 else
  % Creación de la Matriz a resolver
  unos = ones(N+1,1);                           % vector de unos para las iteraciones
  diagonales = [-1*unos 2*unos -1*unos];        % matriz de tres columnas con fias N+1
  matriz = spdiags(diagonales,[-1 0 1],N+1,N+1);% matriz tridiagonal  
  matriz(1,[1:2])=[1 0 ];                       % Cambio algunos valores de la matriz
  matriz(N+1,[N:N+1])= [0 1];                   % cambio al final de la matriz 
  
  % Armado del lado derecho b = ?
  X = linspace(0,L,N+1)';  % Encuentro b de la matriz 
  F = [a ; h^2/K0*Q(X(2:N)) ; b] ; %  Matriz donde se encunetra cada b segun las filas dadas de a hacia b 
  % Resolucion
  U = matriz \ F;
  X = X;
  
 end
  
  
  end 