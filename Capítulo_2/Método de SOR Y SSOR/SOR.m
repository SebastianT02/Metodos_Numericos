%SOR  Método iterativo para resolver sistemas de ecuaciones lineales.
 % % Funcion que encuentra solucion arpoximada de una serie de
 %ecuaciones el Mé todo SOR por sobrerrelajacion
     % % Parámetros > A, matriz cuadrada : Contiene los coeficientes y variables
     %en orden ; b, matriz : Parte num é rica de la Ec. ; tol , float :
     %Tolerancia
 % % Parámetros > w: vector iniciador , itmax : numero de iteraciones maximas
 % % Retorna > xn , float : Valor de Aproximacion 
%
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/05 $
%   Built-in function. 
  function [ x ]= SOR (A ,b ,w , x0 , tol , itmax )
  %Programa
  [n , m ]= size ( A ) ; %Se guarda el t a m a o de la matriz A

 if (( n?= m ) || ( n?= length ( b ) ) || ?isequal (A ,A ') )
        error ('MetSOR : La matriz A no es cuadrada o faltan valores en b') ;
 end
 it =0; %se inicializa la varable de iteraciones
 e =1000.0; %Se inicializa el error con un error demasiado grande

 D = diag ( diag ( A ) ) ; %Obtengo la matriz digonal de A
 E = - tril (A , -1) ; %Obtengo la matriz triangular inferior de A multiplicado por ( -1)
 F = - triu (A ,+1) ; %Obtengo la matriz triangular superior de A multiplicado por ( -1)
     %res= norm (A*x0 -b);
     %e=res/ norm (b);
   while (e > tol )
       it = it +1;
       x =( D - w * E ) \( w * F * x0 +(1 - w ) * D * x0 + w * b ) ;
       e = norm (x - x0 ) ;
       x0 = x ;
       if ( it == itmax )
           error ('MetSOR : Se alcanzo el numero max de iteraciones ') ;
      end

   end


   end
