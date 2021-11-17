% Diferencias finitas
% Función que encuentar la segunda difrencia progresiva, regresiva 
% y centrada.
%
% Parametros-> x0: punto a obtener la derivacion, f: funcion, h: ancho,
% opcion: elegir entre 1-4, opcion2: elegir entre 1-3
% opcion = ('1 Diferencia -1 Derivada ','1 Diferencia -2 Derivada ','2
% Diferencia -1 Derivada ','2 Diferencia -2 Derivada ');
% opcion2 =(' Hacia adelante ',' Hacia Atras ',' Centrada ');
%
% Retorna-> res
%       
% Copyright 2021-2022 Universidad de Cuenca.
% $Revision: 0.1 $  $Date: 2021/11/12 $
% Built-in function.
clc
function [res]=diferenciadefinida(x0,f,h,opcion,opcion2)
    if h==0
        error('Diferenciafinita: h no puede tener un valor nulo');
    end
    switch opcion
        case 1
           switch opcion2
                case 1
                    %Primera Diferencia primera derivada
                    res=(f(x0+h)-f(x0))/(h); %hacia adelante
                case 2
                    %Primera Diferencia primera derivada
                    res=(f(x0)-f(x0-h))/(h); %hacia atras
                case 3
                    %Primera Diferencia primera derivada
                    res=(f(x0+h)-f(x0-h))/(2*h); %centrada
           end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        case 2
           switch opcion2
                case 1
                     %Primera Diferencia segunda derivada
                    res=(f(x0)-2*f(x0+h)+f(x0+2*h))/(h^2); %hacia adelante
                case 2
                     %Primera Diferencia segunda derivada
                    res=f(x0 -2*h) -2*f(x0 -h)+f(x0)/(h^2); %hacia atras
                case 3
                     %Primera Diferencia segunda derivada
                    res=f(x0-2*h)-2*f(x0)+f(x0+h)/(h^2); %centrada
           end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        case 3
           switch opcion2
                case 1
                     %Segunda Diferencia primera derivada
                    res=(-3*f(x0)+4*f(x0+h)-f(x0+2*h))/(2*h); %hacia adelante
                    
                case 2
                     %Segunda Diferencia primera derivada
                    res=(f(x0-2*h)+3*f(x0)-4*f(x0-h))/(2*h); %hacia atras
                case 3
                     %Segunda Diferencia primera derivada
                    res=(f(x0-2*h)-8*f(x0-h)+8*f(x0+h)-f(x0+2*h))/(12*h); %centrada
           end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        case 4
           switch opcion2
                case 1
                     %Segunda Diferencia segunda derivada
                    res=(2*f(x0)-5*f(x0+h)+4*f(x0+2*h)-f(x0+3*h))/(h^2); %hacia adelante
                case 2
                     %Segunda Diferencia segunda derivada
                    res=(-f(x0-3*h)+4*f(x0-2*h)-5*f(x0-h)+2*f(x0))/(h^2); %hacia atras
                case 3
                     %Segunda Diferencia segunda derivada
                    res=(-f(x0-2*h)+16*f(x0-h)-30*f(x0)+16*f(x0+h)-f(x0+2*h))/(12*h^2); %centrada
           end
    end
end 
          
          
          
          
          