% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
% Descripcion: Se basa en un método numérico para resolver una ecuación diferancial 
% de forma dy/dx=f(x,y)mediante: Nuevo Valor=Valor anterior + pendiente * tamaño de paso
%
% Problema 2:
% El pentóxido de dinitrógeno gaseoso puro reacciona en un reactor intermitente
% según la reacción estequiométrica. Encontrar la solución de la EEDD:-2*exp(1.1*x)-0.9*y 
% desde x = 0 hasta x = 3 con un paso de 0.3, la condicion inicial en y es y(0) = 2.

clear;clc;
%datos iniciales 2
f1=@(x,y) -2*exp(1.1*x)-0.9*y;
xi=0;
xf=3;
y0=2;
h=0.3; %es menor a 2; entonces es estable

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
    legend('Analitica','Real');
    grid on
catch
    fprintf('Error: %s\n', e.message);
end
