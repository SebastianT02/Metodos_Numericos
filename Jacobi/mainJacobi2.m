% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 2021/11/05
% Descripcion: Este m�todo recorta sustancialmente el n�mero de iteraciones a realizar 
%para obtener una cierta precisi�n en la soluci�n. Evidentemente los criterios de 
%convergencia son similares a los de Jacobi.
%
% Problema 2:
%   
%Analizar el flujo de tr�fico en una red de calles que se cruzan unas con otras.  
%Se puede montar un sistema de ecuaciones lineales que, siendo resuelto mediante el m�todo de Gauss-Seidel, 
%permite hacer un c�lculo de la cantidad de tr�fico que va a soportar cada calle y tomar las medidas oportunas 
%(temporizaci�n de los sem�foros, colocaci�n de pasos de cebra y se�ales de stop). 
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