% Problema1_datosiniciales
%------------------------------------------------------------------
% f=@(x)exp(-x^2);
% a=1;
% b=Inf;
% n=3;

% Problema2_datosiniciales
%------------------------------------------------------------------
f =@(x) 1/((x^4)+1);
a =-inf;
b =4;
n =6;

% Problema3_datosiniciales
% ------------------------------------------------------------------
% f=@(x)1/(sqrt(2*pi))*exp(( -x^2)/2);
% a=-Inf;
% b=1;
% n=4;

% existen dos formas de resolver,cuando a*b es mayor a cero, o cuando es
% menoreigualacero

if a*b > 0
    [integral,real]=impropiaMX(f,a,b,n);
else
    [integral,real]=impropiaMN(f,a,b,n);
end

fprintf ( 'Laintegralaproximadadelafuncionf(x)es:\n\t%d\n ',integral );
fprintf ( 'Laintegralexactadelafuncionf(x)es:\n\t%d\n ', real );