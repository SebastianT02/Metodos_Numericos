%Factorizacion LU Solucion de de una matriz A =LU
%   factorizacion(A)
%       [L, U] = factorizacion(A)
%       n = tamaño de la matriz A
%       L = Matriz Cuadrada Identidad (n x n)
%       U = Matriz cuadrada compuesta de zeros (n x n)
%       E = size(A) Tamaño de la matriz A

%   Copyright 2013-2014 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/29 $
%   Built-in function.

function [L,U] = factorizacion(A)
   n= length(A);
   L = eye(n,n);
   U = zeros(n,n);
   E = size(A);
    
    %Comprobación del error
    if E(1,1)~= E(1,2);
        L=NaN;
        U=NaN;
        msgID = 'Factorizacion LU: No es una Matriz cuadrada';
        msg = 'Error: No matriz Cuadrada (nxn)';
        #baseException = MException(msgID,msg);
        #throw(baseException);
        error(msgID,msg);
        
    %iteraciones con la Matriz A    
    else E(1,1)== E(1,2);
        for s = [1:n]'
          U(1,s)=A(1,s);
          L(s,1)=A(s,1)/U(1,1);
        endfor
        for i=2:n;
          U(i,i:n)=A(i,i:n)-L(i,1:i-1)*U(1:i-1,i:n);
          L(i-1:n,i)=(A(i-1:n,i)-L(i-1:n,1:i-1)*U(1:i-1,i))/U(i,i);
          endfor
    end

endfunction
%ezplot(Fx);%Imprimimos la Matriz LU
%grid on;