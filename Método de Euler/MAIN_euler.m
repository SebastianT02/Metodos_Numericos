% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
% Descripcion: Se basa en un método numérico para resolver una ecuación diferancial 
% de forma dy/dx=f(x,y)mediante: Nuevo Valor=Valor anterior + pendiente * tamaño de paso
%
% Problema 1: La curva dada por la siguinete EEDD es:4*exp(0.8*x)-0.5*y, 
% corresponde al voltaje encontrado por un capacitor. Encuentre el voltaje
% dado: desde x = 0 hasta x = 4 con un paso de 0,5, la condicion inicial
% en y es y(0) = 1.

clear;clc;
%datos iniciales 1
f1=@(x,y) 4*exp(0.8*x)-0.5*y;
xi=0;
xf=4;
y0=1;
h=0.5; %es menor a 2; entonces es estable

try
    [res,X,Y,E]=euler(f1,xi,xf,y0,h);
    [xr,yr]=ode45(f1,[xi:h:xf],y0); %Obtiene los valores reales
    T=array2table([X' Y' E'],'VariableNames',{'X','Y','Error'});
    fprintf("Resultados: \n")
    disp(T);
    %GRAFICA LOS RESULTADOS
    plot(X,Y,'r-');
    xlabel('X');
    ylabel('Y');
    hold on;
    plot(xr,yr,'b-');
    title('Método de Euler');
    legend('Analitica','Real','Location','northwest');
    grid on
catch
    fprintf('Error: %s\n', e.message);
end
