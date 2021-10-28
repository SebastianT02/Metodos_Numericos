%Gauss-Jordan  Solucion de ecuaciones mediante matrices.
%   gauss_jordan(FUN,A,b)
%       [A,b] = gauss_jordan(fun, A, b)
%       n = # componentes de un vector
%       fun = la función a tratar
%       [A,b] intervalo (matriz)
%
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/28 $
%   Built-in function.
clc
function [A, b] = gausspivote(A, b)
  n = length(b);
  
  %Comprobar si la matriz es cuadrada
  [nf, nc] = size(A)
  if nf != nc 
        msgID = 'Matriz:condicion';
        msg = 'Error: no es matriz cuadrada';
        #baseException = MException(msgID,msg);
        #throw(baseException);
        error(msgID,msg);
  endif
  
  for j = 1: n-1,
    
    %Elejir fila con el pivote mas alto
    al = abs(A(j,j));
    m = j;
    for k=j+1: n;
      if abs(A(k,j)) > al
        al = abs(A(k,j));
        m = k;
      endif
    endfor
    
    %Intercarbiambio de filas "j" y "m"
    for l = j:n
      be = A(j,l);
      A(j,l) = A(m,l);
      A(m,l) = be;
    endfor
    
    be = b(j);
    b(j) = b(m);
    b(m) = be;
    
    %Continuar con el proceso de triangular inferior
    for k = j+1: n;
      al = -A(k,j)/A(j,j);
      for m = j: n;
        A(k,m) = A(k,m) + al*A(j,m);
      endfor
      b(k) = b(k)+ al*b(j);
    endfor
    
  endfor
endfunction
