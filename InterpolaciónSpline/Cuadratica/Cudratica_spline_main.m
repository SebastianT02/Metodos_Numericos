% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/11/18
% Descripcion: 
% Problema 1: Ejercicio con funciones trigonometrica seno para predecir
%el movimiento de una grua automatizada por la funcion seno incrementando
%en diez cada resultado, y se necesita la oscilación más suave y sin cortes fuertes
clc,clear
X = (-10:10)';
Y = sin(5*X);% + rand(length(X),1);

try 
  [A,B,C,n,idx]=SplineCuadratico(X,Y)
  
  fig = figure();
  set(fig,'color','white')
  set(gca,'FontSize',18)
  p0 = plot(X,Y,'o','MarkerSize',5);
  xlabel('X')
  ylabel('Y')
  grid on
  hold on
  title('INTERPOLACIÓN SPLINE CUADRÁTICA.');
  xlabel("EJE X");
  ylabel("EJE Y");
  
  for idx = 1:n
    xspline = linspace(X(idx),X(idx+1),10);
    yspline = A(idx)*xspline.^2 + B(idx)*xspline + C(idx);
    p2 = plot(xspline,yspline,'-.m','LineWidth',1);
  end
legend([p0 p2],'Puntos de choque','Spline Cuadrático,')


  
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end

