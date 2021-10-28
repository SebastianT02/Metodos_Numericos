% Autores: Alejandro Romero, Pablo Delgado, Sebastian Tacuri.
%
% Fecha: 2021/10/28
% Descripcion: método directo, que utiliza la eliminación gaussiana para encontrar el valor de  
%              sus incógnitas a través de la sustitución regresiva
% 
%Problema 1:
%Dentro de un circuito, necesitamos encontrar el valor correspndiente de intensidades
%de cada una de las mallas del mismo circuito (3 mallas). Dadas las ecuaciones de cada una de las mallas 
%reducir el sistema para facilitar el proceso de encontrar las intensidades correspndientes a cada malla. 
%Sitema de ecuaciones: 11i1-5i2-6i3=12, -5i1+19i2-2i3=0, -4i1-i2+2i3=0

clc
A=[-5,19,-2; 11,-5,-6; -1,-1,-2];
b=[12; 0; 0];

try
  [A1, b1] = gausspivote(A, b)
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
  