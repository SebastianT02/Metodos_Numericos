% METODO DE MULLER Funcion que aproxima la raiz de una funcion por el metodo de Muller
  %Parametros

  %fun: funcion que depende de x, se debe ingresar como funcion anonima
  %x0: valor inferior del intervalo que contiene la raiz
  %x1: valor superior del intervalo que contiene la raiz
  %es: tolerancia de error
  %Regresa 
  %tabla : una tabla donde se especifican los resultados por cada
  %iteracion
  %raiz : ultimo valor aproximado de la raiz
%            
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/26 $
%   Built-in function.

function [ tabla , raiz ] = muller ( fun , x0 , x1 , es , imax )
  if fun ( x0 ) * fun ( x1 ) > 0
  error (" muller : La raiz no esta dentro del intervalo ") ;
  end
  iter =0; ea =100;
  x2 = ( x0 * fun ( x1 ) - x1 * fun ( x0 ) ) /( fun ( x1 ) - fun ( x0 ) ) ;
  while es < ea
    iter = iter +1;
    h0 = x1 - x0 ;
    h1 = x2 - x1 ;
    s0 = ( fun ( x1 ) - fun ( x0 ) ) /( x1 - x0 ) ;
    s1 = ( fun ( x2 ) - fun ( x1 ) ) /( x2 - x1 ) ;
    a =( s1 - s0 ) /( h1 + h0 ) ;
    b = a * h1 + s1 ;
    c = fun ( x2 ) ;
    x3 = x2 +(( -2* c ) /( b + sign ( b ) * sqrt ( b ^2 -4* a * c ) ) ) ;
  if x3 ?= 0 %encuentra el error
   ea = abs (( x3 - x2 ) / x3 ) *100;
  end
  X ( iter ) = x3 ;
  E ( iter ) = ea ;
  I ( iter ) = iter ;
  if imax <= iter
  error (" muller : la funci ó n alcanzo el m á ximo de iteraciones ")
  else
  x0 = x1 ;
  x1 = x2 ;
  x2 = x3 ;
  end
  end
  raiz = x3 ;
  resul =[ I' X' E '];
  tabla = array2table ( resul ,' VariableNames ' ,{'Iteracion ',' x_aproximada ','Ea '}) ;
  end
