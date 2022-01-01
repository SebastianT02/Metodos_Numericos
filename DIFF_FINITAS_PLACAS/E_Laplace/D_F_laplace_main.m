% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2022/01/03
% Descripción: El método de diferencias finitas por la ecuación de Laplace
% permite discretizar dicha ecuación diferencial y permite conocer el valor
% de nodos internos dentro de una figura rectangular.

% Ejemplo 1:
% Dentro de una placa delgada aislada térmicamente es expuesta a diferentes
% temperaturas en sus extremos, los cuales están separadas por nodos
% internos y se desea conocer como varía sus temperaturas en cada uno de
% sus nodos, encuentre su variación de temperatura con un error de
% truncamiento de 0.001


% Datos del ejercicio
% Temperaturas de los extremos
clc,clear
ua = 60;
ub = 60;
uc = 50;
ud = 70;
% Puntos
n = 10; m = 10;
% Error aceptado
error = 0.001;
try
    fprintf('Método de diferencias finitas con la Ecuación de Laplace')
    [numero_de_iteraciones,u] = D_F_laplace(ua,ub,uc,ud,n,m,error)
    [x,y] = meshgrid(1:m+2,1:n+2); % Crea la superficie de la placa térmica
    % Plot de la variación de temperatura de la placa térmica
    surf(x,y,u)
    shading flat % Suaviza la gráfica hecha
    hold on
    title('Método de Diferencias finitas por la Ecuacion de Laplace')

catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
