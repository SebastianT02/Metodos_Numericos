%METODO DE NEWTON OPTIMIZACION Solucion de optmizacion maximos y minimos
%
% El metodo de Newton para optimizacion sin restricciones, es una tecnica
% para hallar el valor de puntos optimos de un maximo o minimo en una
% funcion con un error anticipado anterior
%   optimizacion_newton_uni(funcion,valor_x,tolerancia) llenar
%       [iteraciones,x_opt,y_op] = optimizacion_newton_uni
%       funcion = funcion a evaluar sus extremos
%       valor_inicial_x = valor inicial x
%       tolerancia = error permitido de los puntos optimos
%       iteraciones = iteraciones hechas
%       x_op = valor optimo de x
%       y_op = valor optimo de y
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2022/01/13 $
%   Built-in function.
function [iteraciones,x_opt,y_opt] = optimizacion_newton_uni(funcion,valor_x,tolerancia)
syms x;
% Asignacion de variables
f = funcion;        % Simplifica el nombre de la variable funcion
f_1 = inline(f);     % Crea otra funcion para calcular el y optimo 
X = valor_x;        % Simplifica el nombre de la variable inicia de x
a = diff(f);        % Calcula el primer diferencial de la funcion
b = diff(f,2);      % Calcula la segunda derivada de la funcion principal
c = a/b;            % Formula del método de newton previo
fa= inline(c);      % ttransformo en una funcion unline para modificarla
e = inf;            % Crea una variable infinita y actualizarla posteriormente
contador = 0;       % Variable de contador

%Comprobacion del error
if a == 0 & b == 0
    msgID = 'No se puede optimizar esta funcion';
    msg = 'Error M_Newton: deivadas de una constante no hay maximo o minimo';
    %baseException = MException(msgID,msg);
    %throw(baseException);
    error(msgID,msg);
end

% Inicio del bloque para el cálculo del punto optimo de x y y 
while e > tolerancia
    X1 = X-fa(X);           % Genera el nuevo valor de x1
    e = abs((X1-X)/X1)*100; % Actualiza la variable de error
    X = X1;                 % Actualiza la variable del valor inicial para nueva iteracion
    contador = contador +1; % Actualiza el contador
end
x_opt = X1;                 % Designa las variables a mostrar
y_opt = f_1(x_opt);         % Designa las variables a mostrar
iteraciones = contador;     % Contador con una nueva variable
end