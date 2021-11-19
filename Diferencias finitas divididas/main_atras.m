% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 2021/11/19
% Descripcion: Este método consiste en una aproximación de las derivadas parciales 
% por expresiones algebráicas con los valores de la variable dependiente en un 
% limitado número de puntos seleccionados.
%
% Problema 1:
% En una planta química se sintetiza un producto que es utilizado posteriormente
% como conservante de productos enlatados. El rendimiento del proceso depende de la
% funcion. Calcular la derivada de f(x) = ?0,1x4 ? 0,15x3 ? 0,5x2 ? 0,25x + 1,2 
% en x = 0,5 usando diferencias finitas y con un tamaño de paso de h = 0,25
% Diferencia finitas hacia atras.

clc
x0=linspace(0,0.5,100); %Genera varios valores a probar
f = @(x) -0.1*x^4-0.15*x^3-0.5*x^2-0.25*x+1.2; %funcion
h =0.25; %ancho
analitica=[]; %iniciador

try
    for x=x0
        analitica=[analitica,diferenciadefinida(x,f,h,1,2)];
    end
    disp("Resultados:");
    disp(analitica);
    plot(x0,analitica,'r'); %la grafica tiende a ser de color rojo
    hold on;
    legend('Análitica');
    ylabel("f'(x)");
    xlabel("x"); 
catch err
    fprintf('Error: %s\n', err.message);
end