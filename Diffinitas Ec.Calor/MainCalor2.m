% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
% Descripcion: El método de diferencias finitas es una técnica numérica que permite
% la aplicación de geometrías y condiciones de frontera complejas en sistemas 
% bidimensionales, y es la mejor alternativa para resolver problemas de este tipo. 
%
% Problema 2: Determine las temperaturas en los puntos indicados en una barra 
% larga y solida de secciones transversales. Dado asi los siguientes datos:
% f=2*x-2*x.^2; suponiendo las condiciones iniciales c1=6, c2=4; a=1, b=1,
% c=0.25, n=6, m=11.

clear; clc;
%condiciones iniciales
c1=6;
c2=4;
f=@(x) 2*x-2*x.^2;

try
    U = diffinitaCalor(f,c1,c2,1,1,0.25,6,11)
    %graficamos
    surf(U)
    title('Diferencias Finitas para la Ecuación de Calor')
    xlabel('Δx')
    ylabel('Δt')
    zlabel('Puntos de la particion (nodos)')
    hold on
catch error
    fprintf('Error: %s\n', error.message);
end