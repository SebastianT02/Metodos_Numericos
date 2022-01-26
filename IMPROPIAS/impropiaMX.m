%Parametros:
%             fun: funcion para aproximar la integral
%             a: limite inferior
%             b: limite superior
%             n: numero de datos que usaremos
%             I: valor aproximado de la integral
%             IR: valor exacto de la integral
clc;
function [I,IR]=impropiaMX(fun,a,b,n)
  
  if n>6
      disp (" Numero de puntos incorrecto , puntos maximos 6") ; disp (" n =6") ;
      n=6;
  elseif  2>n
      disp (" Numero de puntos incorrecto , puntos minimos 2") ; disp (" n =2") ;
      n=2;
  end
  
  %encuentra los nuevos limites
  aa = 1/b;  
  bb = 1/a;
  
  %encuentra la nueva funcion por cambio de variables
  syms t  
  ff = 1/t^2 * fun(1/t);
  
  %aplicalegendreyaquenosquedaunaintegralfinita
  ctr = (bb+aa)/2;
  mtd = (bb-aa)/2;
  dx = (bb-aa)/2;
  [cf,xx]=coeficientes(n);
  suma =0;
  
  for i=1:n
      xd1=ctr+mtd*xx(i);
      xd2=cf(i)* subs(ff,xd1);
      suma=suma+xd2;
  end

  I=suma*dx;
  I=sym2poly(I);
  
  %encuentra la integral exacta
  syms x;
  IR=int(fun,x,a,b);
  IR=sym2poly(IR);
end