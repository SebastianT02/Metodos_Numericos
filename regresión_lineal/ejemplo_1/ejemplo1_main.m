% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/11/11
% Descripcion:
%ejemplo 
%datos de tasa de dolares de colombia de la fecha del 7 de octubre de 
%2021 hasta el 7 de noviembre de 2021  

clc,clear
x = (1:30)';
y = [3881.76
3881.76
3847.4
3837.84
3778.69
3784.44
3784.44
3784.44
3784.44
3766.1
3761.21
3774.46
3769.98
3780.38
3780.38
3780.38
3783.3
3770.58
3766.94
3772.49
3772.49
3772.49
3772.49
3755.29
3725.75
3738.48
3765.8
3765.8
3765.8
3765.8
];

try 
  fprintf('Coeficientes de la ecuacion lineal = cl \n')
  fprintf('Sumatoria de las diferencias = Sl \n')
  [cl,sl] = minimocuadrado(x,y)
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end








