%% Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%% Main que comprueba la implementacion de la interpolacion de lagrange
%% Parametros>-------
%% Retorna>----------
syms x;
f=0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5;
a=0;
b=0.8;

f=0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5;
a=0;
b=0.8;

s13=[v,simpson13(a,i,f,0,4)];
s38=[v1,simpson38(a,i,f)];


h=linspace(0,0.8,100);
%simpson13(a,b,f,1,4)

%%Prueba 2
f1 = @(x) exp(x^2);
%a=0;
%b=1;

%simpson13(a,b,f1,1,10)

%Prueba3
v=[];
try 
    for i=h 

        v=[v,simpson13(a,i,f,0,4)];
    end
catch e
    fprintf('Error: %s\n', e.message)
end
v1=[];
try 
    i=0;
    for i=h 

        v1=[v1,simpson38(a,i,f)];
    end
catch e
    fprintf('Error: %s\n', e.message)
end


ir=[];
for c=h
    ir=[ir,int(f,a,c)];
end

plot(h,v1,'r','lineWidth',2)
hold on
plot(h,v,'g','lineWidth',2)
plot(h,ir,'b','lineWidth',2)
title('Aproximaciones analíticas vs resultados numéricos')
xlabel('Intervalo de Integracion')
ylabel('Aproximacion de integral')
legend('Simpson 3/8','Simpson1/3','Integral Real')