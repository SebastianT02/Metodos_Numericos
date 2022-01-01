%METODO DE DIFERENCIAS FINITAS E.L Solucion de Ecuaciones Diferenciales 
% Método de diferencias finitas con la ecuación de Laplace, se calcula los n
% nodos de una figura rectangular, esta tiene valores iniciales en cada uno
% de sus extremos.
%   D_F_laplace(ua,ub,uc,ud,n,m,maximo,error) llenar
%       [numero_de_iteraciones,u] = D_F_laplace
%       Condiciones iniciales = ua,ub,uc,ud, valores de extremo de la fig.
%       n = puntos horizontales de la figura
%       m = puntos verticales de la figura
%       u = matriz del valor de los nodos
%       numero de iteraciones = iteraciones hechas
%
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2022/01/03 $
%   Built-in function.
function [numero_de_iteraciones,u] = D_F_laplace(ua,ub,uc,ud,n,m,error)
 % Cambio y asignación de Variables
 k = 0;            % Variable k número de iteraciones
 convergencia = 0; % Solución con exactitud deseada.
 maximo = 1000;    % numero del maximo de while

 % Comprobacion del error
 if n <= 0 & m <= 0; % Analiza si los puntos en el rectangulo son válidos
     fprintf('error')
     msgID = 'E.D por diferencias finitas error';
     msg = 'Error: Puntos de los nodos incorrectos';
     %baseException = MException(msgID,msg);
     %throw(baseException);
     error(msgID,msg);
 end 
 % Inicio del programa, asignación de todos los valores al contorno de la
 % fig rectangular
 % Programación de los bloques horizontales
for i=1:n+2;
    u(i,1) = uc;   % Asignación de valores por iteración
    u(i,m+2) = ud; % Asignación de valores por iteración
end
 % Programación de los bloques verticales
for j = 1:m+2;
    u(1,j)= ua;    % Asignación de valores por iteración
    u(n+2,j) = ub; % Asignación de valores por iteración
end
% Promedio de todos los valores de ua,ub,uc,ud, para el cálculo de nodos
p = (ua+ub+uc+ud)/4;

% Los puntos interiores obtienen un valor promedio
for i = 2:n+1
    for j = 2:m+1;
        u(i,j)= p;
    end
end

% Cálculo de de los puntos interiores
while k < maximo & convergencia == 0;
    % Actualiza variables
    k = k+1;
    t = u;  % Almacena las iteciones con respecto a la variable u
    % Actualiza los nodos interiores horizontal y verticalmente
    for i = 2:n+1;
        for j = 2:m+1;
            % Ecuación discretizada de Laplace 
            u(i,j)=0.25*(u(i-1,j)+u(i+1,j)+u(i,j+1)+u(i,j-1));
        end
    end
    % Identifica si converge según nuestro error aceptable dado
    if norm((u-t),inf)/norm(u,inf) < error % error porcentual
        convergencia = 1;
    end
    % Comprobación de su convergencia, asigna valores de U y k 
    if convergencia == 1;
        u = u; % Matriz de la placa
        numero_de_iteraciones = k; % número de iteraciones
    end
end
end

