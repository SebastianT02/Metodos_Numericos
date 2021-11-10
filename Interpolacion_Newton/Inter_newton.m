%   Interpolación polinomial de newton en diferencias divididas
%   Función que calcula el polinomio obtenido por interpolacion 
%   de Newton dado unos puntos.
%   
%   Parametros-> x,vector: Contiene los puntos en x ; y, vector : 
%   contiene los puntos en y.
%   Retorna-> p: Polinomio obtenido por interpolacion de Newton.
%       
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/12 $
%   Built-in function.
clc
function [p]=inter_newton(x,y)
n=length(x);
b=zeros(n); %se crea una matriz
b(:,1)=y(:); %en la 1era columna ingresa los valores de y
%Comprobación del error
if x&y<=3
   msgID='inter_newton condicion: Faltan datos';
   msg='Error: Los puntos ingresados son incorrectos';
   #baseException = MException(msgID,msg);
   #throw(baseException);
   error(msgID,msg);
end
for j=2:n %llena la tabla de diferencias
    for i=1:n-j+1 %calcula el ultimo punto
        b(i,j)=(b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
    end
end
%construccion del polinomio
p=num2str(b(1,1));
xx=x*-1;
for j=2:n
    signo='';
    if b(1,j)>=0
        Signo='+';
    end
    xt='';
    for i=1:j-1
        signo2='';
        if xx(i)>=0
            signo2='+';
        end
        xt=strcat(xt,'*(x',signo2,num2str(xx(i)),')');
    end
    p=strcat(p,signo,num2str(b(1,j)),xt);
end