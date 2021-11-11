% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/11/11
% Descripcion: regresion lineal de ecuaciones no lineales, transformando
%              los resultados no lineales en lineales usando logaritmos.
%
% Ejemplo tomado del libro: 
% Para cada uno de los valroes de voltaje corresponde el valor de potencia
% dentro de varias fuentes de voltaje, usando la regresion no lineal, ajustar 
% una linea curva para que se ajuste a los cambios de potencia de las fuentes
% existentes: V1 = 0V, V2 = 2v, V3 = 3V, V4 = 4V, V5 = 5V. POTENCIAS: P1 = 0.2W
% P2 = 1.7W, P3 = 3.4W, P4 = 5.7W, P5 = 8.4W.
%  
X = [0 1 2 3 4 5];
Y = [2.1 7.7 13.6 27.2 40.9 61.1];

try
  
  [y_o,R2] = regrecuadratica(X,Y)
  %Grafica
  figure
       % muestro figura
       plot(X,Y,'bo','linewidth',3)
       plot(X,y_o,'r-','linewidth',3)
       set(gca,'Fontsize',18) 
catch
  fprintf('Error: %s\n',err.message);
  %err.identifier
  end