%METODO DE CHOLESKY   Solucion de ecuaciones lineales cuadradas
%   cholesky(A) llenar
%       [G,Gt] = cholesky(A)
%       A = Matriz de coeficientes
%       G=zeros(n,n) = Crea una matriz cuadrada G compuesta solamente de zeros
%       Gt=zeros(n,n) = Crea una matriz cuadrada Gt compuesta solamente de zeros
%       G(1,1)=sqrt(A(1,1)) = Determinamos el pirmer elemento de la matriz G
%       Gt(1,1)=sqrt(A(1,1)) = Determinamos el pirmer elemento de la matriz Gt
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/3 $
%   Built-in function.

function [G,Gt] = cholesky(A)
   n= length(A);
   G=zeros(n,n); 
   Gt=zeros(n,n);
   G(1,1)=sqrt(A(1,1));
   Gt(1,1)=sqrt(A(1,1));
   %Comprobación del error
    if A != A' & det(A) > 0;
        L=NaN;
        U=NaN;
        msgID = 'Cholesky condicion: No es una Matriz simétrica';
        msg = 'Error: No matriz Cuadrada (nxn)';
        #baseException = MException(msgID,msg);
        #throw(baseException);
        error(msgID,msg);
    else A = A';
        for s = [2:n]'
          G(s,1)=A(s,1)/G(1,1);
          Gt(1,s)=A(1,s)/Gt(1,1);
        endfor
        for i = 2:n; %inicio de iteraciones
          G(i,i)= sqrt(A(i,i)-G(i,1:i-1)*Gt(1:i-1,i));
          Gt(i,i)=G(i,i);
          G(i+1:n,i)=(A(i+1:n,i)-G(i+1:n,1:i-1)*Gt(1:i-1,i))/G(i,i);
          Gt(i,i+1:n)=G(i+1:n,i);
        endfor
   endif 
    
endfunction
