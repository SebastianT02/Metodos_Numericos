clc;

% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/10/7
% Descripcion: metodo de newton-rapshon que nos permite encontrar las
%              raices de una funcion con simples calculos de la misma.
%
% Ejemplo tomado del libro: 
% Mediante la funcion dada que describe a una onda entregada por la senal de radio
% encontrar la raiz de la funcion para ajustar la senal dada por la senal FM de la 
% misma.
% funcion : x^2 - (2*x)*e^(-x) + e^(-2*x) 
% derivada : 2*x -2*(e^(-x)- x*e^(-x)) - 2*e^(-2*x)


f = inline('x^2 - (2*x)*e^(-x) + e^(-2*x) ');

d = inline(' 2*x -2*(e^(-x)- x*e^(-x)) - 2*e^(-2*x)');

maximoIteracion = 8;
try
  [ea, raiz] = newton_rapshon(f,d, maximoIteracion)
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end