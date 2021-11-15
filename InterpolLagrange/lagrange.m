%   Interpolación polinomial de Lagrange 
%   Función que calcula el polinomio obtenido por interpolacion 
%   de Lagrange dado unos puntos.
%   
%   X es un vector que contiene la lista de abscisas
%   Y es un vector que contiene la lista de ordenadas
%       
%   C es la matriz que contiene los coeficientes del polinomio
%     interpolador de Lagrange
%   L es la matriz que contiene los coeficientes de los polinomios 
%     Li de Lagrange
%
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/12 $
%   Built-in function.

clc;
function [C, L] = lagrange(X,Y)

% Valores a ser utilizados dentro del metodo.
w= length(X);
n=w-1;
L=zeros(w,w);

if size(X)&size(Y)<=1
   msgID='inter_newton condicion: Faltan datos';
   msg='Error: Los puntos ingresados son incorrectos';
   #baseException = MException(msgID,msg);
   #throw(baseException);
   error(msgID,msg);
end

% FORMACION DE LOS POLINOMIOS Li DE LAGRANGE
for k=1: n+ 1
    V=1;
    for r=1:n+1
        if k~=r
            V = conv(V, poly(X(r)))/(X(k)-X(r));
        end
    end
    L(k,:) = V;
    
    % CALCULO DE LOS COEFICIENTES DEL POLINOMIO INTERPOLADOR
    C=Y*L;
end
