% Cuadratura de gauss, Gaus-Legendre de dos puntos
% La funcion de error de cuadratura nos devolvera el valor porcentual que 
% se tiene al integrar una función, por lo tanto
% los parametros son f,n,x0 donde f es la funcion a evaluar, n es el numero de 
% puntos utilizados y x0 es el punto evaluado.
% De la funcion retornara e, el cual tendra el valor del error de la aproximación.
function [e]=errorcuadratura(f,n,x0)
  n=n-1;
  o=(2*n)+2;
  f=diff(f,o);
  d=subs(f,x0);
  e=(2^(2*n+3)*(prod(1:n+1))^4)/((2*n+3)*(prod(1:2*n+2))^3);
  e=e*d;
end
