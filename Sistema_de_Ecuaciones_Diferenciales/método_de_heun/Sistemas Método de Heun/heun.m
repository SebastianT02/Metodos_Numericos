%Juan José Durán, Joel Suarez, Edwin Lima
%algoritmo de Euler mejorado o metodo de Heun.
%Parametros------------------------------------------------------------
%ypri: funcion de primer orden para estimar los valores de la derivada
%x0: valor inicial de x
%y0: valor inicial de y
%xn: valor final para x
%h: ancho de paso 
%Regresa--------------------------------------------------------------
%tab: tabla con los resultados del metodo
function tab=heun(ypri,x0,y0,xn,h)
[xr,yr]=ode45(ypri,[x0:h:xn],y0);
it=1;
Y(it)=y0;I(it)=(it-1);
for i=x0:h:(xn-h)
    it = it+1;
    xx = x0+h;
    yy = y0+((ypri(x0,y0))*h);
    dycorr = ((ypri(x0,y0)+(ypri(xx,yy)))/2)*h;
    x0=x0+h;
    y0=y0+dycorr;
    E(it)=abs((yr(it)-y0)/yr(it))*100;
    Y(it)=y0;
    I(it)=(it-1);
end
tab=[I' xr yr Y' E'];
end