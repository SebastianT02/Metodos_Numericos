% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
% Descripcion: Funcion que aproxima el valor de la integral de una funcion 
%usando dos puntos,llamada Gauss-legendre de dos puntos.
%
% Problema 1:
% En una planta química se sintetiza un producto que es utilizado posteriormente
% como conservante de productos enlatados. El rendimiento del proceso depende de la
% temperatura. Es asi que se pretende encontar la funcion que permitira identificar
% como utilizar de una manera correcta,asi elevando las ganancias.Para lo cual se 
% dispone de los siguientes datos.

clear;clc;
%datos iniciales 1
f=@(x)0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4+ 400*x.^5;
a=0;
b=0.8;

try
  [integral,real,error] = gauslegendre2(f,a,b);
  fprintf('La integral aproximada de la funcion f(x) es:\n \t%d\n',integral);s="%";
  fprintf('El valor exacto de la integral es:\n \t%d\n',real);
  fprintf('Con un error relativo porcentual de:\n \t%d%s \n',error,s);
  %graficamos
  x=linspace(a,b,100);
  z=length(x);
  for j=1:z
      [integral,real,error] = gauslegendre2(f,a,x(j));
      aprox(j)=integral;
      realg4life(j)=real;
  end
  subplot(1,2,1);
  hold on;grid;
  plot(x,aprox,'or');plot(x,realg4life,'db');hold off;
  xlabel("Limite b");ylabel("Integral f(x)")
  title("GaussLegendre 2 puntos");legend('Aproximada','exacta','location','Northwest');
  subplot(1,2,2);hold on;grid;
  area(x,f(x));
  xlabel("a<x<b");ylabel("f(x)")
  title("Area bajo la curva");legend('Area','location','Northwest');
catch causeException
  baseException = addCause(baseException,causeException);
end