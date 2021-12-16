% Funcion que encuentra la solución de ecuaciones diferenciales ordinarias 
% (dy/dx)=f(x,y) por Euler
% Parámetros> dydx: EEDD; xi: Rango Inferior; xf: Rango Superior; 
% y0: Valor inicial de y con xi; h: Tamaño de paso
% Retorna> res: resultado final; X,array: Valores de x; Y,array: Resultados 

function [res,X,Y,E]=euler(dydx,xi,xf,y0,h)
    syms x;
    syms y;
    
    %Comprobacion del error
    if (h>2)
        warning("euler: el tamaño de paso no es estable"); %Estabilidad
    end
    if (h==0)
       error("euler: el tamaño de paso no puede ser cero"); 
    end
    
    X=xi:h:xf; %Crea un vector con los valores desde xi hasta xf con saltos de h
    m=length(X); %Cantidad total de valores x
    Y = y0; %El primer elemento de y sera el valor inicial yo 
    E = 0;
    for i=1:m-1
       res=y0+subs(dydx,{x,y},{X(i),y0})*h; %Formula de Euler
       Y(i+1)=res;
       d=dydx;
       d1=diff(dydx,x)+diff(dydx,y); %Derivada implicita
       e=(subs(d1,{x,y},{X(i),y0})*h^2)/2; %Aproximacion del error
       E(i+1)= e;
       y0=res;
    end
    res=double(res);
end