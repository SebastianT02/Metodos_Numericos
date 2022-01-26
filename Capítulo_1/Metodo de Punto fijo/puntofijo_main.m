% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/11/26
% Descripcion: Se trata de un método que encuentra la raiz de una función
% por medio de comparaciones y estimaciones, al igual no es exacto el método,
%puesto tiene una tolerancia admitida.

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
syms x;
% Datos del ejercicio
funcion = cos(x)-x^3;
g = cos(x)^(1/3);
tolerancia =1;
x1 =0;
x2 =1;


try
  fprintf('Solución método de Punto Fijo \n\n')
  [iteraciones,convergencia,punto_raiz]= puntofijo(funcion,g,x1,x2,tolerancia)
 
catch e
    fprintf ('Error: %s\n', e.message);
    %err.identifier
end
