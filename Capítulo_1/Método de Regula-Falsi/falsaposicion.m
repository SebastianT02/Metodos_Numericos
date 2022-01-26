function [iteraciones,convergencia,punto_raiz]=falsaposicion(funcion,x1,x2,tolerancia)
  imax = 1000;
  tic;
  funcion = inline(funcion);
  contador=0; % Inicia contador
  xi=0;
  % Prueba que el intervalo contenga a la raiz caso contrario termina
  % comprobación del error del teorema de Bolzano
  if funcion(x1)*funcion(x2)>0
    convergencia = 'No converge';
    msgID = 'Regula Falsi Condicion:No es ejecutable';
    msg = 'La raiz no esta dentro del intervalo';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
  end
  %Comienzo de Iteraciones para encontrar la raiz
  while true
    contador=contador+1;
    x0=xi;
    
    % Estima la raiz por iteraciones
    xi=((x1*funcion(x2))-(x2*funcion(x1)))/(funcion(x2)-funcion(x1));
    
    if xi~=0 % Encuentra el error
        ea=abs((xi-x0)/xi)*100;
    end
    % Evalua para encontrar el siguiente intervalo
    if funcion(x1)*funcion(xi)<0
        x2=xi;
    elseif funcion(x1)*funcion(xi)>0
        x1=xi;
    else
        ea =0;
    end
    %si cumple la cota definida o no converge sale del bucle
    if ea < tolerancia
        break
    end
    if imax <= contador
        warning (" falsaposicion: la funcion ha llegado al máximo de iteraciones ");
        break ;
    end
  endwhile
  % Especifico los valores a mostrar en la función main.m
  iteraciones = contador;
  convergencia = 'si converge';
  punto_raiz = xi;
  toc;
end
