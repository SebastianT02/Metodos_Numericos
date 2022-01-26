%Parametros:
%             fun: funcion para aproximar la integral
%             a: limite inferior
%             b: limite superior
%             n: numero de datos que usaremos
%             I: valor aproximado de la integral
%             IR: valor exacto de la integral
clc;
function [I,IR]=impropiaMN(fun,a,b,n)
 
  if n>6
      disp (" Numero de puntos incorrecto , puntos maximos 6") ; disp (" n =6") ;
      n=6;
  elseif 2>n
      disp (" Numero de puntos incorrecto , puntos minimos 2") ; disp (" n =2") ;
      n=2;
  end
    
  if a == -inf
    %encuentra un limite intermedio para dividir en dos integrales
    c=-1;

    %calcula la integral finita por legendre con varios puntos
    ctr = (b+c)/2;
    mtd = (b -c)/2;
    dx = (b -c)/2;
    [cf,xx]=coeficientes(n);
    suma=0;
  
    for i=1:n
        xd1=ctr+mtd*xx(i);
        xd2= cf(i)* subs(fun,xd1);
        suma=suma+xd2;
    end
  
    I1=sym2poly(suma*dx);
  
    %encuentra la integral impropia pero a*c ya es positivo
    I2=impropiaMX(fun,a,c,n);
  
  elseif b == inf
    %encuentra un limite intermedio para dividir en dos integrales
    c=1;
    %calcula la integral finita por legendre con varios puntos
    ctr = (c+a)/2;
    mtd = (c -a)/2;
    dx = (c -a)/2;
    [cf , xx ]=coeficientes(n);
    suma=0;
    
    for i=1:n
        xd1=ctr+mtd*xx(i);
        xd2=cf(i)* subs(fun,xd1);
        suma=suma+xd2;
    end
    
    I1=sym2poly(suma*dx);
    %encuentra la integral impropia pero c*b ya es positivo
    I2=impropiaMX(fun,c,b,n);
  end
    
    %la integral es la suma de las dos integrales
    I=I1+I2;
    %encuentra la integral exacta
    syms x;
    IR=int(fun,x,a,b);
    IR=sym2poly(IR);
end