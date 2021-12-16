% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/12/12
% Descripcion: El metodo de Punto medio, sirve para obtener la solucion
% aproximada de las ecuaciones diferenciales de dos incognitas, por lo
% general son de los terminos t,y.

% Ejemplo 1: 
%Un circuito RL tiene una fem de 5 voltios, una resistencia de 50 ohmios,
%una inductancia de 1 henrio y no tiene corriente inicial, Halle la
%corriente en el circuito para un momento t


% Datos del ejercicio
clc,clear;
syms t y;
f = sym(4*(2*t -6*y));
F_exacta = sym(dsolve('Dy = 4*(2*t -6*y)','y(0)=10'));
condicion = double(10);
a = double(0);
b = double(10);
h = double(1/45);

try
[valor,valor_real,Error_de_punto_medio] = puntomedio(f,F_exacta,condicion,a,b,h)
% Plot gráfica 
 x_1 = a:h:b;
 y_1 = x_1 ./3 + (721*exp(-24.*x_1))./72 - 1./72;
 plot(x_1,y_1,'r')
 xlabel('t')
 ylabel('y')
 title('Ecuación Diferencial por el método del punto medio')
 hold on
 grid on
 
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end


