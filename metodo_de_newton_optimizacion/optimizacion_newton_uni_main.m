% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2022/01/13
% Descripción: El método de Newton consiste en encontrar el valor optimo de
% las variables declaradas de una funcion unidimensional.

% Ejemplo 1:
% Se desea conocer el punto minimo en x y y de la siguiente funcion para 
% optmizar el uso de recursos de una planta de creación de placas de
% arduino, esta se rige por una funcion en concreto por lo cual de un
% tiempo a otro se desea conocer el mejor punto, este valor de x es 1
% con un margen de tolerancia de 0.0001.

% Datos del ejercicio
clc,clear
syms x
funcion = '(-x^2)+8*x-12';  % Declaro la funcion a mostrar
funcion = str2sym(funcion); % Convierto la funcion en symbolica para entrar a la funcion
valor_x = 1;                % Valor inicial de la variable declarada x
tolerancia = 0.0001;        % Tolerancia para saber la exactitud de convergencia

try
    fprintf('Método de Newton para Optimización sin restricciones unidimensional \n')
    [iteraciones,x_opt,y_opt] = optimizacion_newton_uni(funcion,valor_x,tolerancia)
    % Creación de la gráfica de la función y el punto optimo
    figure(1);
    x_1 = linspace(0,10,100);
    y = (-x_1.^2)+8.*x_1-12;
    plot(x_1,y,'b-')
    hold on;
    plot(x_opt,y_opt,'r*')
    title('Método de Newton Optimización sin restricciones')
    legend('Función (-x^2)+8*x-12)','Punto Optimo')
    
    % Ver el error de la funcion
    fprintf('\n')
    fprintf(' Función predetermianda de optimización \n')
    v = fminsearch(@(x) (+x^2)-8*x+12,1)
    fprintf('El error comparado con una funcion predeterminada \n')
    x_1 = v(1);
    y_1 = '(-x_1.^2)+8.*x_1-12';
    y = inline(y_1);
    grid on;
    error_x = abs(x_opt-v(1))
    error_y = abs(y_opt-y(x_1))
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end