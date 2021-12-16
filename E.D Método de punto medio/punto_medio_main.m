% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/12/12
% Descripcion: El metodo de Punto medio, sirve para obtener la solucion
% aproximada de las ecuaciones diferenciales de dos incognitas, por lo
% general son de los terminos t,y.

% Ejemplo 1:
%Un circuito RL tiene una fem de  voltios, una resistencia de ohmios,
%una inductancia de 1 henrio y no tiene corriente inicial, Halle la
%corriente en el circuito para un momento t


% Datos del ejercicio
clc,clear;
syms t y;
f = sym(2*exp(t)+y*tan(t));
F_exacta = sym(dsolve('Dy = 2*exp(t)+y*tan(t)','y(0)=2'));
condicion = double(2);
a = double(0);
b = double(4/25);
h = double(1/50);

try
[valor,valor_real,Error_de_punto_medio] = puntomedio(f,F_exacta,condicion,a,b,h)
% Plot gráfica 
x_1 = a:h:b;
 y_1 = (exp(x_1).*cos(x_1) + exp(x_1).*sin(x_1) + 1)./cos(x_1);
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


