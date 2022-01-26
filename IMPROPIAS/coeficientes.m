% Factores de ponderacion y argumentos de la funcion para evaluar 
% integrales con Gauss-Legendre dependiendo del numero de puntos.
clc;
function [coe,xi]=coeficientes(n)
switch n
  case 2
      coe=[1 1];
      xi=[ -0.577350269 ,0.577350269];
  case 3
      coe=[0.5555556 0.8888889 0.5555556];
      xi=[-0.774596669 0 0.774596669];
  case 4
      coe=[0.3478548 0.6521452 0.6521452 0.3478548];
      xi=[ -0.861136312 -0.339981044 0.339981044 0.861136312];
  case 5
      coe=[0.2369269 0.4786287 0.5688889 0.4786287 0.2369269];
      xi=[ -0.906179846 -0.538469310 0 0.538469310 0.906179846];
  case 6
      coe =[0.1713245 0.3607616 0.4679139 0.4679139 0.3607616 0.1713245];
      xi =[ -0.932469514 -0.661209386 -0.238619186 0.238619186 0.661209386 0.932469514];
end