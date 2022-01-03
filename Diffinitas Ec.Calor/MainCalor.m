% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
% Descripcion: El método de diferencias finitas es una técnica numérica que permite
% la aplicación de geometrías y condiciones de frontera complejas en sistemas 
% bidimensionales, y es la mejor alternativa para resolver problemas de este tipo. 
%
% Problema 1: La curva dada por las siguiete EEDD es:f=4*x-4*x.^2;
% corresponde al voltaje encontrado por el capacitor. Encuentre las corriente?,    
% suponiendo las condiciones iniciales c1,c2=0; a=1, b=0.20, c=1, n=6, m=11.

clear; clc;
%condiciones iniciales
c1=0;
c2=0;
f=@(x) 4*x-4*x.^2;

try
    U = diffinitaCalor(f,c1,c2,1,0.20,1,6,11)
    %graficamos
    surf(U)
    title('Diferencias finitas para la ecuación de calor')
    xlabel('Δx')
    ylabel('Δt')
    zlabel('Puntos de la particion (nodos)')
    hold on
catch error
    fprintf('Error: %s\n', error.message);
end