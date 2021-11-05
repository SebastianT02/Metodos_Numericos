%Jacobi  Método iterativo para resolver sistemas de ecuaciones lineales.
%   gauss_seidel(FUN,A,b,x,tol,m)
%       [A,b] = gauss_seidel(fun,A,b,x,tol,m)
%       n = # componentes de un vector
%       fun = la función a tratar
%       [A,b] intervalo (matriz)
%
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/05 $
%   Built-in function.

function jacobi(A,b,x,tol,m)
n=length(x);
%Comprobar si la matriz es cuadrada
[nf, nc] = size(A)
if nf != nc 
    msgID = 'Matriz:condicion';
    msg = 'Error: La matriz A no es cuadrada';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
endif    
for k=1:m
  w=x;
  for i=1:n
    s=A(i,1:i-1)*w(1:i-1)+A(i,i+1:n)*w(i+1:n);
    x(i)=(b(i)-s)/A(i,i);
  end
  if norm(w-x,inf)<tol
    return
  end
  fprintf('\n solucion en la iteracion %4.0f\n',k)
  for i=1:n
    fprintf('                x(%1.0f)=%6.8f\n',i,x(i))
  end
end
%(Fx);%solucion iterativa de ecuaciones lineales
%grid on;