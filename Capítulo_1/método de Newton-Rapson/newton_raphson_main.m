% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/11/26
% Descripcion: Se trata de un método que encuentra la raiz de una función
% por medio de comparaciones de su derivada y con iteraciones.

% Problema 1:
% Analizar el flujo de tráfico en una red de calles que se cruzan unas con otras.
% se puede montar un sistema de ecuaciones lineales que, siendo resuelto, mediante
% los métodos de soluciones de ecuaciones no lineales, permite hacer un cálculo
% de la cantidad de trafico que va a soportar cada calle y tomar las medidas oportunas
% (temporizacion) de los semáforos, colocación de pasos cebra y señales de stop
% para lo cual se da a conocer la función: cos(x)-x^3. Donde el punto inicial es
% x0 = 0 y el final x1 =1 con la tolerancia de 1e-5 para iniciar, permitiendo identificar
% máximo de iteraciones.
clc,clear

% Datos para la resolución de método Newton Raphson
funcion = '(cos(x)-x^3';
xi = 0;
tolerancia = 1e-3;

% Inicia el main.m
try
  fprintf('Solución método de Newton Raphson \n\n')
  [iteraciones,convergencia,punto_de_raiz] = newton_raphson(funcion,xi,tolerancia)
catch error
  fprintf('Error: %s\n',error.message);
  %error.identifier
end
