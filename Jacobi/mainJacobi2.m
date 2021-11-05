% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 2021/11/05
% Descripcion: Este método recorta sustancialmente el número de iteraciones a realizar 
%para obtener una cierta precisión en la solución. Evidentemente los criterios de 
%convergencia son similares a los de Jacobi.
%
% Problema 2:
%   
%Analizar el flujo de tráfico en una red de calles que se cruzan unas con otras.  
%Se puede montar un sistema de ecuaciones lineales que, siendo resuelto mediante el método de Gauss-Seidel, 
%permite hacer un cálculo de la cantidad de tráfico que va a soportar cada calle y tomar las medidas oportunas 
%(temporización de los semáforos, colocación de pasos de cebra y señales de stop). 
%siendo estas las ecuaciones: 5x-3y+1z=5, 2x+4y-1z=6, 2x-3y+8z=4.
%donde el vector inicial es X = [1,1,1] con tolerancia de 0.0001 para iniciar, permitiendo 
%identificar un maximo de iteraciones.

clc
A=[5,-3,1;2,4,-1;2,-3,8] %matriz A
b=[5;6;4] %vector b
x=[1;1;1]%vector x
tol=0.0001; %tolerancia
m=20; %numero maximo de iteraciones

try
  jacobi(A,b,x,tol,m)
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end