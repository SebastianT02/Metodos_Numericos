% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/11/18
% Descripcion: Un brazo robótico necesita pasar por los puntos
% los sieguinetes punto, y la aseguradora del robot quiere comparar
%cuanto uso de energía hace el robot para llegar a cada punto, el spline cúbico
%ayuda para optimizar el movimiento del robot y optimizar su movimiento
%monitoreado. 
% Problema 1: Puntos por donde pasa la pata robórica automatizada y su uso
%de energía. 
clc,clear
 X = [2,6,7,12,15;4,4,6,7,8]

try 
  [a,b,c,d,n,i]=SplineCubica(X)
  
  for i=1:n-1;
    x = X(1,i):0.1:X(1,i+1);
    y = a(i)+b(i)*(x-X(1,i))+c(i)*(x-X(1,i)).^2+d(i)*(x-X(1,i)).^3; 
    hold on;
    plot(x,y,'-.m');
  end
  
  for i=1:n;
    hold on;
    plot(X(1,i),X(2,i),'o','MarkerEdgeColor','k','LineWidth',1);
    title('INTERPOLACIÓN SPLINE CÚBICA.');
    xlabel("EJE X");
    ylabel("EJE Y");
  end
  
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
