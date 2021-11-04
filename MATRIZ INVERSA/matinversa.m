%Inversa de una matriz  Solucion de ecuaciones mediante matrices.
%   matinversa(FUN,A)
%       [A,I] = matinversa(fun, A)
%       f,c= #de filas y de columnas de la matriz original
%       fun = la función a tratar
%       [A] = matriz
%
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/28 $
%   Built-in function.
clc 
function [AI] = matinversa(A)
  
  [f,c] = size(A)
  
  I = eye(f)
  
  AI=[A I]; 
  
  %Comprobar si la matriz es cuadrada
  if f != c 
        msgID = 'Matriz:condicion';
        msg = 'Error: no es matriz cuadrada';
        #baseException = MException(msgID,msg);
        #throw(baseException);
        error(msgID,msg);
  endif
  
  determinante = det(A);
  
  %Comprobar si determinante de la matriz es cero
  if determinante == 0 
        msgID = 'Matriz:condicion';
        msg = 'Error: No tiene matriz inversa';
        #baseException = MException(msgID,msg);
        #throw(baseException);
        error(msgID,msg);
    
  endif
  
  %si el elemento i de la diagonal es diferente de 1 entonces se convierte a 1
  for i=1:length(AI(:,1))
  if AI(i,i)~=1 
      AI(i,:)= AI(i,:)./AI(i,i);
  end
%Además el resto de elementos de la columna deben convertirse a 0 :  
      for n=1:length(AI(:,1)) 
        if n~=i 
            AI(n,:)=-AI(n,i).*AI(i,:)+AI(n,:); 
        end
      end
   end
    x=zeros(n,1);
    x(n)=AI(n,n+1)/AI(n,n);
    for i=n-1:-1:1 
        x(i)=AI(i,n+1)/AI(i,i)-AI(i,i+1:n)*x(i+1:n)/AI(i,i); 
    end
  AI(:,1)=[];
  AI(:,1)=[];
  AI(:,1)=[];
end
clc
%Muestra los resultados de la matriz identidad
