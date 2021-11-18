%INTERPOLACIÓN SPLINE CUADRÁTICA
%   funcionSplineCuadratica(X)
%       [a,b,c,d]=funcionSplineCuadratica(X,Y)
%       n = número de datos dados menos uno
%       N = Tamaño del vector dado

%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/18 $
%   Built-in function.

function [A,B,C,n,idx]=SplineCuadratico(X,Y)
N = length(X);
n = N-1;

   %Comprobación del error
  if size(n)== 0;
    L=NaN;
    U=NaN;
    msgID = 'No se puede interpolar esta tabla de valores';
    msg = 'Error: No se puede Interpolar por datos menores a cero';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
    
  else size(n)~= 0;
    %%%Creamos la matriz de ceros H0 = [2*(n-1)  x 3*n]
    H0 = zeros(2*n-2,3*n);
    K0 = zeros(2*n-2,1);
    
  for idx = 1:(n-1)
    col = idx;
    fila = 2*(idx-1)+1;
    H0(fila,col) = X(idx+1)^2;
    H0(fila+1,col+1) = X(idx+1)^2;
    H0(fila,n+col) = X(idx+1);
    H0(fila+1,n+col+1) = X(idx+1);
    H0(fila,2*n+col) = 1;
    H0(fila+1,2*n+col+1) = 1;
    K0(fila) = Y(idx+1);
    K0(fila+1) = Y(idx+1);
  end

  %%%Creamos H1 = [n-1 x 3*n];
  H1 = zeros(n-1,3*n);
  for idx = 1:n-1
    H1(idx,idx) = 2*X(idx+1);
    H1(idx,idx+1) = -2*X(idx+1);
    H1(idx,n+idx) = 1;
    H1(idx,n+idx+1) = -1;
  end
  %%%Creamos otra matriz de ceros HE
  HE = zeros(2,3*n);
  HE(1,1) = X(1)^2;
  HE(1,n+1) = X(1);
  HE(1,2*n+1) = 1;
  HE(2,n) = X(end)^2;
  HE(2,2*n) = X(end);
  HE(2,end) = 1;

%%%damos valor a H
  H = [H0;H1;HE];
  [r,c] = size(H);

%%%Damos Valor a H
  K = zeros(r,1);
  K(1:(2*(n-1))) = K0;
  K(end-1) = Y(1);
  K(end) = Y(end);

%%%Asumimos ahora que H
  H = H(:,2:end);

  coeffs = inv(H)*K

%%%Obtenemos los coeficientes de interpolación
  A = [0;coeffs(1:n-1)]
  B = coeffs(n:2*n-1)
  C = coeffs(2*n:end)

end
