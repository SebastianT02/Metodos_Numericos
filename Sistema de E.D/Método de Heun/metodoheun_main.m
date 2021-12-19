% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/12/19
% Descripcion: El metodo de Heun, sirve para obtener la solucion
% aproximada de un sistema de ecuaciones diferenciales, en este
% de dos eccuaciones diferenciales.

% Ejemplo 1:
%Un circuito RL tiene una fem de  voltios, una resistencia de ohmios,
%una inductancia de 1 henrio y no tiene corriente inicial, Halle la
%corriente en el circuito para un momento t


% Datos del ejercicio
clc,clear;
a = 0;
b = 3;
condicion = [1;2];
ne = 2;
funcion = @(t,y)[1/y(2);y(1)^2];
h = 1/5;

try
[tabla,valor] = metodoheun(funcion,condicion,a,b,ne,h)
% Plot gráfica 
[t,y] = ode45(@(t,y)[1/y(2);y(1)^2],[a:h:b],condicion);
plot(t,y(:,1),'r');
hold on;
plot(t,y(:,2),'b');
legend('y1','y2');
xlabel('tiempo');
ylabel('y');hold on;
title('E.D por el Método de Heun');
grid on;
 
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end