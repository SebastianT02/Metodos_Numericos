%METODO DE NEWTON OPTIMIZACION Solucion de optmizacion maximos y minimos
%
% El metodo de Newton para optimizacion sin restricciones, es una tecnica
% para hallar el valor de puntos optimos de un maximo o minimo en una
% funcion con un error anticipado anterior
%   optimizacion_newton_multi(funcion,valor_inicial_x,valor_inicial_y,tolerancia) llenar
%       [iteraciones,x_op,y_op] = optimizacion_newton_multi
%       funcion = funcion a evaluar sus extremos
%       valor_inicial_x = valor inicial en el eje x
%       valor_inicial_y = valor inicial en el eje y
%       tolerancia = error permitido de los puntos optimos
%       iteraciones = iteraciones hechas
%       x_op = valor optimo de x
%       y_op = valor optimo de y
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2022/01/13 $
%   Built-in function.
function [iteraciones,x_op,y_op,z_op] = optimizacion_newton_multi(funcion,valor_inicial_x,valor_inicial_y,tolerancia)
% Asigna y declara variables
format long;          % Formato largo a los datos numericos
syms f x y;           % Con el paquete symbolic declara variables a usar
f = str2sym(funcion); % Asigno formato del paquete symbolic a la funcion
f_1 = inline(funcion);% Creo una funcion inline para obtener evaluada la funcion
x0 = valor_inicial_x; % Asigna variable nueva para x
y0 = valor_inicial_y; % Asigna variable nueva para y
Error = tolerancia;   % Error permitido en los puntos optimos
k = 0;                % Variable contador
e = inf;              % Declaracion de la variable error para actualizar

%Comprobacion del error
if tolerancia > 1;
    msgID = 'No se puede optimizar esta funcion';
    msg = 'Error M_Newton: Exactitud de Convergencia erroneo';
    %baseException = MException(msgID,msg);
    %throw(baseException);
    error(msgID,msg);
end
% Obtiene la derivada parcial primer paso
dfdx = diff(f,x);     % Diferencial de df/dx
dfdy = diff(f,y);     % Diferencial de df/dy

% Obtiene la segunda derivada de la funcion
d2fdx2 = diff(dfdx,x);% Segundo Diferencial de dfdx/dx
d2fdy2 = diff(dfdy,y);% Segundo Diferencial de dfdy/dy
d2fdxdy = diff(dfdx,y);
d2fdydx = diff(dfdy,x);

% Obtencion de la gradiente de la funcion
gradf = [dfdx;dfdy];                  % Gradiente de la funcion
H = [d2fdx2 d2fdxdy; d2fdydx d2fdy2]; % Hessiano de la funcion
H1 = inv(H);                          % Inversa de la matriz Hessiana

% Inicio del ciclo while de iteraciones hasta obtener iteraciones
xi = x0; % Asigna nueva variable
yi = y0; % Asigna nueva variable

% Compara mientras el error no tenga el nivel de exactitud que deseamos no
% termina el ciclo while
while e >= Error
    x = xi; % Asigna valor a evaluar en x
    y = yi; % Asigna valor a evaluar en y
    gradf_ = eval(gradf); % Evalua el gradiente de la funcion y crea nueva
    H1_ = eval(H1);       % Evalua la matriz hessiana y crea una nueva v..
    M = [xi;yi]-H1_*gradf_; % Mediante la fomula del metodo de newton obtiene valores para la matriz M
    xi1 = M(1); yi1 = M(2); % Obtenemos nuevos valores de x y y segun las iteraciones dadas
    % Actualiza la exactitud de convergencia segun el error
    e = abs(sqrt((xi1-xi)^2+(yi1-yi)^2));
    xi = xi1; % Actualiza el valor de x
    yi = yi1; % Actualiza el valor de y
    k = k+1;  % Actualiza el contador de iteraciones
end

% Determina el valor final de x y y optimo
x = xi;
y = yi;
detH = eval(det(H));
d2f = eval(d2fdx2);
% Seccion que identifica que valor obtuvo, punto silla, minimo o maximo
if detH < 0
  c = 'Punto Silla';
else
  if d2f > 0
    c = 'Minimo';
  else
    c = 'Maximo';
  end 
end
% Asigna el valor de las variables de salida de la funcion
iteraciones = k;
x_op = xi;
y_op = yi;
z_op = f_1(x_op,y_op);
tipo_de_valores = c;
end