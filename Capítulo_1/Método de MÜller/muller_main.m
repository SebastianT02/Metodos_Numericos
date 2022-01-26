% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/11/26
% Descripcion: Se trata de un método que encuentra la raiz de una función
% por medio de comparaciones de su derivada y con iteraciones.

% Problema 1:
%Funcion que aproxima la raiz de una funcion por el metodo de Muller
 clc ; clear
  %funcion 1 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  f =@( x ) x ^3 -13* x -12;
  xl =3.5; xu =5.5; es =0.0005; im =10000;
  %funcion 2 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  %f=@(x)cos(x)^3 +9*x+4;
  %xl = -1; xu =0; es =0.0005; im =10000;
 
  %llamamos a la funcion
  try
       [ resultados , raiz ]= muller (f , xl , xu , es , im ) ;
       disp ( resultados ) ;
  %evaluamos la raiz aproximada
       prueba = f ( raiz ) ;
       fprintf (" La raiz aproximada x = %f evaluada es f(x)= %f\n" ,raiz , prueba );
  catch e
       fprintf ('Error : %s\n', e . message ) ;
  end
