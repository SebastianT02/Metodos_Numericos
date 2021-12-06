%Cuadratura de gauss, Gaus-Legendre de dos puntos
%Parametros------------------------------------------------------------
%fun: funcion para aproximar la integral
%a: limite inferior
%b: limite superior
%Regresa--------------------------------------------------------------
%I: valor aproximado de la integral 
%IR: valor exacto de la integral
%E: error relativo porcentual al aproximar

function [I,IR,E] = gauslegendre2(fun,a,b)
%puntos iniciales ya determinados para aplicar la formula
xd1=-1/sqrt(3);
xd2=1/sqrt(3);
dx=1;
%Comprobación del error
if a~=-1 || b~=1
%aplicando cambio de variables encontramos nuevos valores de x cuando los
%limites de la integral son diferentes a -1 y 1
    x1 = (b+a)/2;
    x2 = (b-a)/2;
    dx = (b-a)/2;
    xd1=x1+x2*(-1/sqrt(3));
    xd2=x1+x2*(1/sqrt(3));
end
I=(fun(xd1)+fun(xd2))*dx; %encontramos la aproximacion
%usando calculo simbolico encontramos el valor exacto de la integral
syms x
fint = int(fun,x,a,b);
E = ((fint-I)/fint)*100;
IR=sym2poly(fint);
E=sym2poly(E);
end