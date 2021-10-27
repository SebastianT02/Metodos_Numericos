%Gauss-Jordan  Solucion de ecuaciones mediante matrices.
%   gauss_jordan(FUN,A,b)
%       [A,b] = gauss_jordan(fun, A, b)
%       n = # componentes de un vector
%       fun = la función a tratar
%       [A,b] intervalo (matriz)
%
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/29 $
%   Built-in function.
clc
function x=gauss_jordan(A,b)
    Ab=[A b];
    n=length(b);
%matriz triangular
  for k=1:n-1 
        [mayor,j]=max(abs(Ab(k:n,k)));
        fila=j+k-1;
        if fila~=k
            Ab([k,fila],:)=Ab([fila,k],:);%intercambio de filas
        end
        for i=k+1:n
            factor=Ab(i,k)/Ab(k,k);
            Ab(i,k:n+1)=Ab(i,k:n+1)-factor*Ab(k,k:n+1);          
        end
    end
%incógnitas
    x=zeros(n,1);
    x(n)=Ab(n,n+1)/Ab(n,n);
    for i=n-1:-1:1 
        x(i)=Ab(i,n+1)/Ab(i,i)-Ab(i,i+1:n)*x(i+1:n)/Ab(i,i); 
    end
end
%ezplot(Fx);%solucion de ecuaciones mediante una matriz
%grid on;