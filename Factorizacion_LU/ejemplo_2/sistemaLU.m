%solucion x Factorizacion LU Solucion de de una matriz A =LU =x
%   factorizacion(A)
%       [L, U] = factorizacion(A)
%       n= length(A);tamaño de la matriz A
%       x = zeros(1,n);vector fila trasnpuesta
%       y = zeros(1,n);vector fila transpuesta
%       y(1,1)=b(1,1);

%   Copyright 2013-2014 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/29 $
%   Built-in function.

function x = sistemaLU(A,b)
   [L,U] = factorizacion(A);
   n= length(A);
   x = zeros(1,n)';
   y = zeros(1,n)';
   y(1,1)=b(1,1);

   for i=2:n
     y(i,1)=b(i,1)-L(i,1:n)*y(1:n,1);
   endfor
   for i=n:-1:2
     x(i,1)=(y(i,1)-U(i,n:-1:1)*x(n:-1:1,1))/U(i,i);
   endfor
endfunction
%ezplot(Fx);%Imprimimos la solucion de la Matriz A
%grid on;