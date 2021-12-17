% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%
% Fecha: 2021/12/12
% Descripcion: El metodo de Punto medio, sirve para obtener la solucion
% aproximada de las ecuaciones diferenciales de dos incognitas, por lo
% general son de los terminos t,y.

% Ejemplo 1: 
%Un circuito RL tiene una fem de 5 voltios, una resistencia de 50 ohmios,
%una inductancia de 1 henrio y no tiene corriente inicial, Halle la
%corriente en el circuito para un momento t


% Datos del ejercicio
f=@(x,y) 4*(2*x-6*y)
x0=0;
y0=10;
xf=2;
n=450;

try
  
  # Calculamos los valores mediante la funcion creada
  [xa ya x y] = rungekutta(f,x0,y0,xf,n);
  #Graficamos las funciones para comprobar su exactitud
  hold on
  grid on
  xlabel('x');ylabel('y');
  title('Soluciones de la ED usando Runge-Kutta de 2 Orden');
  plot(x,y,'--','LineWidth',2,'Color',[0 0 1]);
  plot(xa,ya,'--','LineWidth',2,'Color',[0 1 0]);
  legend('S.Exacta','S.Aproximada');
  
catch err
  
  fprintf('Error: %s\n',err.message);
  %err.identifier
  
end_try_catch