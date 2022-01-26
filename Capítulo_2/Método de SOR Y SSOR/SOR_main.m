% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 2021/11/05
% Descripcion: Este método recorta sustancialmente el número de iteraciones a realizar 
%para obtener una cierta precisión en la solución. Evidentemente los criterios de
%convergencia son similares a los de Jacobi.
%
% Problema 1:

  A =[4 ,3 ,0;3 ,4 , -1;0 , -1 ,4];
  b =[0;30; -24];
  w =1.25;
  x0 =[1;1;1];
  tol =1. e -7;
  itmax =100;
 try
      P = SOR (A ,b ,w , x0 , tol , itmax )
 catch e
     fprintf ('Error : %s\n', e . message ) ;
 end
