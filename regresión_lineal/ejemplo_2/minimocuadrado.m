%m�todos 
%   Minimocuadrado(A)
%       [cl,sl] = Minimocuadrado(x,y)
%       n = tama�o de los datos dados
%       A = Matriz del sistema lineal    
%       b = Vector adjunto 
%       sl = sumatoria de las diferencias al cuadrado
%       cl = coeficientes de la ecuaci�n lineal 
%

%   Copyright 2020-2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/11 $
%   Built-in function.

function [cl,sl] = minimocuadrado(x,y)
   n= length(y);

    %Comprobaci�n del error
    if size(y) != size(x);
        L=NaN;
        U=NaN;
        msgID = 'Datos de la ecuaci�n lineal inconcluso';
        msg = 'Error: No tienen el mismo n�mero de datos (nxn)';
        #baseException = MException(msgID,msg);
        #throw(baseException);
        error(msgID,msg);
        
    %C�lculo del ammatriz A y el vector B, calculo de coeficientes
    %sumatoria de las diferencias de los puntos.   
    else
        A = [n sum(x);
             sum(x) sum(x.^2)];
        b = [sum(y); sum(x.*y)];
        cl = A\b;
        % yl valor de y ajustado linealmente
        yl = cl(1)+cl(2)*x;
        sl = sum((y-yl).^2);
        
       figure
       hold all
       % muestro figura
       plot(x,y,'bo','linewidth',3)
       plot(x,yl,'r-','linewidth',3)
       set(gca,'Fontsize',18)    
    end

endfunction
%ezplot(Fx);%Imprimimos sl (sumatoria de diferencias) cl coeficientes
%de la ecuacion lineal
%grid on;