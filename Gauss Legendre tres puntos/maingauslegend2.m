% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
% Descripcion: Funcion que aproxima el valor de la integral de una funcion 
%usando dos puntos,llamada Gauss-legendre de dos puntos.
%
% Problema 2:
% El pentóxido de dinitrógeno gaseoso puro reacciona en un reactor intermitente
% según la reacción estequiométrica. Calcule la integral aproximada de la
% funcion de Gauss Legendre de dos puntos con los datos.

clear;clc;
%datos iniciales 1------------------------------------------------------------------
f=@(x)0.1 + 10*x - 100*x.^2 + 127*x.^3 - 500*x.^4;
a=0;
b=0.8;
%datos iniciales 2-----------------------------------------------------------------
%f=@(x)x.*log(x)+exp(x.^(-2));                                                                  
%a=1;
%b=4;
try
  [integral,real,error] = gauslegendre3(f,a,b);
  fprintf('La integral aproximada de la funcion f(x) es:\n \t%d\n',integral);s="%";
  fprintf('El valor exacto de la integral es:\n \t%d\n',real);
  fprintf('Con un error relativo porcentual de:\n \t%d%s \n',error,s);
  %graficamos
  x=linspace(a,b,100);
  z=length(x);
  for j=1:z
      [integral,real,error] = gauslegendre3(f,a,x(j));
      aprox(j)=integral;
      realg4life(j)=real;
  end
  hold on;
  plot(x,aprox,'*r');plot(x,realg4life,'*b');hold off;
  xlabel("Limite b");ylabel("Integral f(x)")
  title("GaussLegendre 3 puntos");legend('Aproximada','exacta')
  
  
catch causeException
  baseException = addCause(baseException,causeException);
end