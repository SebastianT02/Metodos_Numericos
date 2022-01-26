%%Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%% La funcion tiene como parametros a,b que seran los intervalos de la integral y n en caso de que se trabaje con aplicacion
%%multiple y f que sera la funcion con la cual se trabajara
%% De la funcion retornara x que sera el resultado final de nuestra aproximacion.
function [x]=simpson13(a,b,f,ca,n)
  sum=0;
   c=0;
      if ca==0; %Primer caso de integracion 1/3
         v = linspace(a,b,3) ;%Devuelve un vetor con 3 puntos equidistantes
         x = ((b-a)*subs(f,v(1))+4*subs(f,v(2))+subs(f,v(3)))/(6);
      else%aplicacion multiple de regla de simpson 1/3
          auxn=(b-a)/n;%Ancho de los rectangulos
          sum=f(a);%Primer punto evaluado
          v = a:auxn:b;%Vector con puntos equidistantes
          t=length(v);%Controlador de iteraciones
          for i=2:(t-1)
            if c==0 && t>1
              sum = sum + 4 * subs(f,v(i));%Iteracion 
              t=t-1; 
              c=1;
            else c==1 && t>1
              sum = sum + 2 * susb(f,v(i));%Iteracion
              t=t-1; 
              c=0;
             endif
           end
          sum=sum+subs(f,b);%Ultima evalucion
          x= ((b-a)*sum)/(n*3);%aplicaicon de regla de simpson
          end
 end
