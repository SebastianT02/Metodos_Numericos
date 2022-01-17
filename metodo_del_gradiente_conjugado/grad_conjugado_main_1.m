% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2022/16/01
% Descripcion: El método del gradiente conjugado  es un algoritmo para 
% resolver numéricamente los sistemas de ecuaciones lineales cuyas matrices 
% son simétricas y definidas positivas,se puede utilizar también para 
% resolver los problemas de optimización sin restricciones como la 
% minimizacion de la energía.
%
%
% Ejemplo 1: 
% Dada la siguiente ecuacion de segundo grado, determine la solucion optima para
% dicha ecuacion, teniendo en cuenta los datos entregados a continuacion, y 
% encuentre el valor optimo para la misma.
clc,clear;
syms x1 x2;

% Funcion a trabajar
f1 = x1^2+x2^2-2*x1-4*x2;
f1_ = inline(f1);
% Datos iniciales
x0 = [1 1];
max_iter = 7;
tol = 1*10^-3;
iter = 0;
X = [];

try
  fprintf('Método del Gradiente Conjugado \n')
  [sol1, sol2, sol3] = grad_conjugado(f1, x0, max_iter, tol, iter);
  fprintf('La soluucion optima sera x = [%f, %f]\n', sol1, sol2);
  fprintf('El valor optimo para F(x) sera = %f \n', sol3);
  % Plot de la funcion y del punto optimo encontrado
  ezsurf(f1)
  hold on;
  x = [sol1];
  y = [sol2];
  z = [f1_(x,y)];
  scatter3(x,y,z,'r*')
  %plot(sol1,sol2,'ro')
  title('Metodo del Gradiente Conjugado')
  legend('Funcion: x1^2+x2^2-2*x1-4*x2','Punto Optimo')
catch
   fprintf('Error: %s\n',err.message);
end