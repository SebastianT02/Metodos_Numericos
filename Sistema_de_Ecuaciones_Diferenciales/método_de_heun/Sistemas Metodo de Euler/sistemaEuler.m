% Funcion que encuentra la solución de sistema de EEDD ordinarias 
% (dy/dx)=f(x,y) por Euler
% Parámetros-> f:EEDD1; g:EEDD2; xi:Rango Inferior; xf:Rango Superior;
% y01,yo2:Valor inicial; h:Tamaño de paso
% Retorna-> X,array:Valores de X; Y1,Y2,array:Respuestas; E,array:Error. 

function [Y1,Y2,X,E]=sistemaEuler(f,g,xi,xf,h,yo1,yo2)
    syms y1 y2 x;
    %Comprobacion del error
    if (h==0)
       error("sistemaEuler: el tamaño de paso no puede ser cero"); 
    end
    X=xi:h:xf; %Crea un vector con los valores desde xi hasta xf con saltos de h
    m=length(X); %Cantidad total de valores x
    Y1 = yo1; %Se agrega los valores iniciales a un array
    Y2 = yo2;
    E = 0;
    for i=1:m-1
       res1=yo1+subs(f,{y1,y2,x},{yo1,yo2,X(i)})*h; %Formula de Euler
       Y1(i+1)=double(res1);
       res2=yo2+subs(g,{y1,y2,x},{yo1,yo2,X(i)})*h;
       Y2(i+1)=double(res2);
       yo1=res1;
       yo2=res2;
       E=(Y2-Y1);
    end  
end