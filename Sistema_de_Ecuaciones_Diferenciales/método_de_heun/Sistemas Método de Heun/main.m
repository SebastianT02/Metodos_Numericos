%Juan José Durán, Joel Suarez, Edwin Lima
%Funcion que estima el valor de la pendiente mediante el metodo de Euler
%mejorado o llamado metodo de Heun.
clear;clc;
%DATOS INICIALES 1------------------------------------------------------------------
%yprima=@(x,y)x-y+2;
%x0=0;
%y0=2;
%xn=1;
%h=0.1;
%DATOS INICIALES 2------------------------------------------------------------------
yprima=@(x,y)4*exp(0.8*x)-0.5*y;
x0=0;
y0=2;
xn=5;
h=1;
%DATOS INICIALES 3------------------------------------------------------------------
%yprima=@(x,y)8*cos(2*x)-4*exp(y);
%x0=1;
%y0=1;
%xn=2;
%h=0.1;

datos = heun(yprima,x0,y0,xn,h);
resultados=array2table(datos,'VariableNames',{'Iteracion','X','Y_real','Y_Heun','Error_t_porcentual'});
fprintf('En la siguiente tabla se observan los valores de y, tanto aproximados como los verdaderos:\n');
disp(resultados);
grid; hold on;
plot(datos(:,2),datos(:,3),'-r','LineWidth',2);
plot(datos(:,2),datos(:,4),'-b','LineWidth',2);
legend('Analitica','Aproximada(Heun)','Location','North');
title('Método de Heun');xlabel("valores x");ylabel("y(x)");