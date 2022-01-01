% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2022/01/03
% Descripción: El método de diferencias finitas por la ecuación de Poisson
% permite discretizar dicha ecuación diferencial y permite conocer las
% incognitas de una ecuacion que no se puede integrar

% Ejemplo 1:
% Estado estacional de equilibrio, por favor encontrar los valores del
% flujo de energía con condiones de Poisson estacional, en dos extremos de
% la barra, toda la energía Q que la fuente está generando, estás saliendo
% por los extremos de la barra.


% Datos del ejercicio
clc,clear
% Datos del problema
L =1;
K0 = 1;
a = 2;
b = -3;
Q = @(x)(100*exp(-20*(x-L/3).^2));
%Q = @(x)(100*(x>0.7) );
N = 30;

try
    fprintf('Método de diferencias finitas con la Ecuación de Poisson')
    [U,X] = D_F_poisson(L,K0,a,b,N,Q)
   
    % Plot de la variación de la matriz U
    figure(1); plot(X,U,'*-')
    hold on
    title('Método de Diferencias finitas por la Ecuacion de poisson')
    legend('Puntos de aproximación  de la Matriz U')

catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end