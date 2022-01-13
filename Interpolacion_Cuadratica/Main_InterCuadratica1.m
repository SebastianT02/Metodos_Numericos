% Fecha: 2022/01/13
% Descripcion: El método de la busqueda de interpolacion cuadratica conssiste que 
% cuando el polinomio que conviene es de 2doº grado la interpolación recibe el 
% nombre de cuadrática. El polinomio interpolador es ánico, luego como se encuentre
% da igual., sin embargo, a veces los cálculos son muy laboriosos y es preferible 
% utilizar un método que otro. A la vista de los datos se decide.
%
% Problema 2:
% Se desea conocer el punto máximo en x de la siguiente funcion sin(x)para 
% optmizar las temperatura de una barra larga y solida de secciones transversales,
% por lo que a continuacion se da a conocer las siguientes condiciones: 
% puntos iniciales=[0,1.3862,1.7917],con un margen de tolerancia de 0.0001 para 
% lo cual se desea conocer el mejor punto. 
%
clear,clc
% Datos del ejercicio
fun = @(x) sin(x);
x0 = -5;
x1 = 3.7121;
x2 = 4.6;
tol=0.00001;

try
    %llamamos a la funcion
    [x3,p_funcion,error,iteraciones]= M_InterCuadratica(fun,x0,x1,x2,tol);
    disp('Punto optimo:')
    x3
    disp('Punto funcion:')
    p_funcion
    disp('Error:') 
    error
    disp('Numero de iteraciones:')
    iteraciones
    %grafico
    figure(1)
    gf = x0:0.1:x2; 
    plot(gf,fun(gf),2);
    xlim([-4 1])
    ylim([-1.05 1])
    xlabel('x'); ylabel('f(x)');
    title('M-B Interpolación Cuadrática')
    punto=num2str('X');
    text(x3,p_funcion,punto,'Color','r')
    grid on
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end