%METODO DE GAUSS   Solucion de ecuaciones lineales cuadradas
%   GaussMN(A) llenar
%Parametros
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 %A: Matriz de los coeficientes de nuestras ecuaciones
 %b: Vector columna de nuestros terminos independientes
 %Retorna
 %x: Que tendra los valores de nuestras incognitas
 function [ x ]= GaussMN (A , b )
 %Realizamos una sustitucion progresiva
 a = size ( A ) ;
 bs = size ( b ) ;
 if a (1)?= a (2) | bs (1) ?= a (1)

 error (" El t a m a o de los parametros es incorrecto ") ;
 end

 n = length ( b ) ;
 for j = 1: n -1;
     for k = j +1: n ;
        al = - A (k , j ) / A (j , j ) ;
          for m = j : n ;
              A (k , m ) = A (k , m ) + al * A (j , m ) ; %Intercambiamos una fila por una nueva con una incognita reducida
          endfor
     b ( k ) = b ( k ) + al * b ( j ) ; %Se cambian los valores del termino independiente .
     endfor
  endfor
  %Realizamos una sustitucion inversa
  x = zeros (n ,1) ;
  for k = n : -1:1
       x ( k ) = b ( k ) / A (k , k ) ;
            for i = 1: k -1;
                 b ( i ) = b ( i ) -x ( k ) * A (i , k ) ;
            endfor
  endfor
endfunction
