% Funcion que encuentra las diferencias finitas para la ecuación de calor.
% Parámetros-> f=funcion, c1,c2: condiciones en la frontera, a:Variacion en x,
% b:Variacion en t, c:coeficiente en la EEDD, n: cant. de particion en x, 
% m:cant. de particion en t.
% Retorna-> U:Respuestas de cada particion(nodo).

function U = diffinitaCalor(f,c1,c2,a,b,c,n,m)

%Comprobacion del error
if n==m
    error("Ec.Calor:La cant de particion debe tener la forma nxm");
end

%tamaño de la particionn en cada nodo
h = a/(n-1); %Desplazamiento en x
k = b/(m-1); %Desplazamiento en t
%Simplifica la ecuacion
r = c^2*(k/h^2);
s = 1-2*r; 
U = zeros(n,m); %Generamos una matriz de nxm
%Definimos las condiciones de frontera
U(1,1:m) = c1; 
U(n,1:m) = c2;
U(2:n-1,1) = f(h:h:(n-2)*h)'; %Evalua la funcion en cada particion

%Calculamos con la ecuacion actualmente deducida
for j = 2:m 
    for i = 2:n-1
      U(i,j) = s*U(i,j-1)+r*(U(i-1,j-1)+U(i+1,j-1));
    end
end
U=U'; %invierte la matriz