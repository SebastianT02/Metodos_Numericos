% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2022/01/13
% Descripción: El método de Newton consiste en encontrar el valor optimo de
% las variables declaradas de una funcion multidimensional.

% Ejemplo 1:
% Se desea conocer el punto minimo en x y y de la siguiente funcion para 
% optmizar el uso de recursos de una planta de creación de placas de
% arduino, esta se rige por una funcion en concreto por lo cual de un
% tiempo a otro se desea conocer el mejor punto, este rango va de [1;1]
% con un margen de tolerancia de 0.00001.

% Datos del ejercicio
clc,clear
syms f x y;
funcion = 'x-y+2*x^2+2*x*y+y^2'; %x1-x2+2*x1^2+2*x1*x2+x2^2
f = str2sym(funcion);
tolerancia = 0.00001;
valor_x = 1;
valor_y = 1;

try
    fprintf('Método de Newton para Optimización sin restricciones \n')
    [iteraciones,x_op,y_op,z_op] = optimizacion_newton_multi(funcion,valor_x,valor_y,tolerancia)
    % Creación de la gráfica de la función y el punto optimo
    figure(1);
    ezsurf(f,[x_op-0.5,x_op+0.5],[y_op-0.5,y_op+0.5]);
    hold on;
    plot(x_op,y_op,'r*')
    title('Método de Newton')
    legend('Función x-y+2*x^2+2*x*y+y^2','Punto Optimo')
    
    % Ver el error de la funcion
    fprintf('\n')
    fprintf(' Función predetermianda de optimización \n')
    v = fminsearch(@(x) x(1)-x(2)+2*x(1)^2+2*x(1)*x(2)+x(2)^2,[1,1]) 
    fprintf('El error comparado con una funcion predeterminada \n')
    error_x = abs(x_op-v(1))
    error_y = abs(y_op-v(2))
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end

