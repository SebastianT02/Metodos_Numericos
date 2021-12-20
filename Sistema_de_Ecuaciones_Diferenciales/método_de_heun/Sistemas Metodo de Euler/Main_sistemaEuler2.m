% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
% Descripcion: Se basa en un método numérico para resolver una ecuación diferancial 
% de forma dy/dx=f(x,y)mediante: Nuevo Valor=Valor anterior + pendiente * tamaño de paso
%
% Problema 2: % El pentóxido de dinitrógeno gaseoso puro reacciona en un reactor 
% intermitente según la reacción estequiométrica. Encontrar la solución de las
% EEDD::f=(y1)+0.4*y1; g=(y1,y2)+0.1*y2+0.3*y1; suponiendo las condiciones iniciales 
% x = 0, y1 = 3 y y2 = 4. Integre hasta x = 1 con un tamaño de paso igual a 0.3.

clear;clc
f=@(y1)+0.4*y1; 
g=@(y1,y2)+0.1*y2+0.3*y1;
xi=0;
xf=1;
yo1=3;
yo2=4;
h=0.3;
try
    [Y1,Y2,X,E] = sistemaEuler(f,g,xi,xf,h,yo1,yo2); %valor de la integral y la sumatoria
    T=array2table([X' Y1' Y2' E'],'VariableNames',{'X','Y1','Y2','Error'});
    disp('Resultados:')
    disp(T);
    plot(X,Y1);
    hold on;
    plot(X,Y2);
    xlabel('x');
    ylabel('y');
    legend("f(x)","g(x)");
    grid on;
catch e
    fprintf('Error: %s\n', e.message);
end