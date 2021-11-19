% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 2021/11/19
% Descripcion: Este método consiste en una aproximación de las derivadas parciales 
% por expresiones algebráicas con los valores de la variable dependiente en un 
% limitado número de puntos seleccionados.
%
% Problema 2:
% En una fabrica de lacteos se sintetiza un producto que es utilizado posteriormente
% como conservante de productos enlatados. El rendimiento del proceso depende de la
% funcion. Calcular la derivada de f(x) = -0.3x^2-0.20x^1-0.7x^3-0.25x+1.9; 
% en x = 0,5 usando diferencias finitas y con un tamaño de paso de h = 0,10
% Diferencia finitas centrada.

clc
x0=linspace(0,0.5,100); %Genera varios valores a probar
f = @(x) -0.3*x^2-0.20*x^1-0.7*x^3-0.25*x+1.9; %funcion
h=0.10; %ancho
analitica=[]; %iniciador

try
    for x=x0
        analitica=[analitica,diferenciadefinida(x,f,h,1,3)];
    end
    disp("Resultados:");
    disp(analitica);
    plot(x0,analitica,'b'); %la grafica tiende a ser de color azul
    hold on;
    legend('Análitica');
    ylabel("f'(x)");
    xlabel("x");
catch err
    fprintf('Error: %s\n', err.message);
end