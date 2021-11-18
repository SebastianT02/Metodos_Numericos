%INTERPOLACIÓN SPLINE CÚBICA
%   funcionSplineCubica(X)
%       [a,b,c,d]=funcionSplineCubica(X)
%       n = número de datos dados
%       a = Vector de coeficiente
%       b = Vector de coeficiente
%       c = Vector de coeficiente
%       d = Vector de coeficiente que interpolan los datos

%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/18 $
%   Built-in function.
function [a,b,c,d,n,i]=SplineCubica(X)

  n=length(X(1,:));
  
  if size(n)== 0;
    L=NaN;
    U=NaN;
    msgID = 'Factorizacion LU: No es una Matriz cuadrada';
    msg = 'Error: No matriz Cuadrada (nxn)';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
    
  else size(n)~= 0;
    for i=1:n;
      a(i)=X(2,i);
    end
  %diferencia de absisa 
    for i=1:n-1;
      h(i)=X(1,i+1)-X(1,i);
    end

    for i=2:n-1;
      alfa(i)=3/h(i)*(a(i+1)-a(i))-3/h(i-1)*(a(i)-a(i-1));
    end
    l(1)=1;
    mu(1)=0;
    z(1)=0;
  
    for i=2:n-1;
      l(i)=2*(X(1,i+1)-X(1,i-1))-h(i-1)*mu(i-1);
      mu(i)=h(i)/l(i);
      z(i)=(alfa(i)-h(i-1)*z(i-1))/l(i);
    end
  
    l(n)=1;
    z(n)=0;
    c(n)=0;
  
    for i=n-1:-1:1;
      c(i)=z(i)-mu(i)*c(i+1);
      b(i)=(a(i+1)-a(i))/h(i)-h(i)*(c(i+1)+2*c(i))/3;
      d(i)=(c(i+1)-c(i))/(3*h(i));
    end
    
end
