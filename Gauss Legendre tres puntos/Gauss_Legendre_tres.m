% Cuadratura de gauss, Gaus-Legendre de tres puntos
% Funcion que encuentra la integral de una funcion por medio de la cuadratura 
% de Gauss-Laguedre de tres puntos
% Parámetros> f:funcion a integrar ; a:Intervalo inferior ; b:Intervalo supeior
% Retorna> res:resultado
function [res]=Gauss_Legendre_tres(f,a,b)
    syms x;
    str2syms t;
    if (a~=-1)&&(b~=1) %Para cambio de variable
        x=((b-a)/2)*t+(b+a)/2;
        dx=(b-a)/2;
        inte=inline(f,x)*dx;
    else %Por si los limites coinciden
        inte=f;
    end
        c0=0.5555556; %Factores de Ponderacion
        c1=0.8888889;
        c2=0.5555556;
        x0=-0.774596669; %Argumentos de la funcion
        x1=0;
        x2=0.774596669;
        %Calculo de la aproximacion
        res=c0*subs(inte,x0)+c1*subs(inte,x1)+c2*subs(inte,x2);
        res=double(res);
end