clc
function [A, b] = gausspivote(A, b)
  n = length(b);
  
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