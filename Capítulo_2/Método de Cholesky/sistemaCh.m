%solucion x,y  cholesky Solucion de de una matriz
%   cholesky(A)
%       [G, Gt] = (cholesky(A))
%       n= length(A);tamaño de la matriz A
%       x = zeros(1,n);vector fila trasnpuesta
%       y = zeros(1,n);vector fila transpuesta
%       y(1,1)=b(1,1)/G(1,1;Defino el primer elemento de Y

%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/3 $
%   Built-in function.

function [y,x] = sistemaCh(A,b)
   [G,Gt] = cholesky(A);
   n= length(A);
   x = zeros(1,n)';
   y = zeros(1,n)';
   y(1,1)=b(1,1)/G(1,1);

   for i=2:n
     y(i,1)=(b(i,1)-G(i,1:n-1)*y(1:n-1,1))/G(i,i);
   endfor
   for i=n:-1:1
     x(i,1)=(y(i,1)-Gt(i,n:-1:1)*x(n:-1:1,1))/Gt(i,i);
   endfor
endfunction
%ezplot(Fx);%Imprimimos la solucion de la Matriz A
%grid on;
