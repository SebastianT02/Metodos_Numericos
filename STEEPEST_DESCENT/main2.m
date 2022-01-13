%
% Fecha: 2022/13/01
% Descripcion: El m�todo del descenso del gradiente es un algoritmo de 
%              optimizaci�n que permite converger hacia el valor m�nimo de una 
%              funci�n mediante un proceso iterativo. En aprendizaje autom�tico 
%              b�sicamente se utiliza para minimizar una funci�n que mide el 
%              error de predicci�n del modelo en el conjunto de datos.
%
% Ejemplo 1: 
% Dada la siguiente ecuacion de segundo grado, determine la solucion optima para
% dicha ecuacion, teniendo en cuenta los datos entregados a continuacion, y 
% encuentre el valor optimo para la misma. 
%

clc;
clear;

syms x1 x2;

% Funcion a trabajar
f1 = x1^2+x2^2-2*x1-4*x2;

% Datos iniciales
x0 = [0 0];
max_iter = 7;
tol = 1*10^-3;
iter = 0;
X = [];

try
  [sol1, sol2, sol3] = descensograd(f1, x0, max_iter, tol, iter);
  fprintf('La soluucion optima sera x = [%f, %f]\n', sol1, sol2);
  fprintf('El valor optimo para F(x) sera = %f \n', sol3);
  ezsurf(f1)
  hold on;
  plot(sol1,sol2,'ro')
  title('Metodo del descenso del Gradiente')
  legend('Superficie de la funcion','Punto Optimo')
catch
   fprintf('Error: %s\n',err.message);
end