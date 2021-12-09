%METODO DE GAUSS HERMITE   Solución de Integrales por aproximación 
%   hermite(funcion,limite_inferior,limite_superior,n) llenar
%       integral_aproximada = hermite(funcion,limite_inferior,limite_superior,n)
%       a =  pesos de la funcion segun n
%       x = puntos de la raiz de la funcion o abscisas
%       n = numero de iteraciones o cortes de abscisas
%       integral_aproximada = resultado de la función ejecutada
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/05 $
%   Built-in function.

function integral_aproximada = hermite(f,limite_inferior,limite_superior,n)
    integral_aproximada = I;
    I=0;
    
    %Comprobación del error
    if  limite_inferior>limite_superior;
      msgID = 'Cuadratura de Gauss hermite error';
      msg = 'Error: número de punto (n) es incorrecto';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msgID,msg);
    end
    
    % Empieza al escoger el caso para c/u, depende el valor del numero n
    switch n
        case 2
           x=[0.7071,-0.7071];   % puntos de las abscisas
           a=[0.8862,0.8862];    % pesos del caso n =2
            for i=0:n   
                I=I+(f(x(i))*a(i));  % Sumatoria de la integral_aproximada
            end
        case 3
           x=[0,1.224745,-1.224745];
           a=[1.181636,0.295409,0.295409];
            for i=1:n
                I=I+(f(x(i))*a(i));  % Sumatoria de la integral_aproximada
            end
        case 4   
            x=[0.52648,-1.650680,-0.52648,1.650680]
            a=[0.804914,0.813128,0.804914,0.813128]
            for i=1:n
                I=I+(f(x(i))*a(i))  % Sumatoria de la integral_aproximada
            end
        case 5
            x=[0,-0.958572,-2.020183,0.958572,2.020183];
            a=[0.945308,0.393619,0.199532,0.393619,0.199532];
            for i=1:n
                I=I+(f(x(i))*a(i)); % Sumatoria de la integral_aproximada
            end
        end 
        integral_aproximada = I;
    end