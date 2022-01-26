%%Autores: Pablo Delgado, Alejandro Romero , Mateo Tacuri
%% La funcion tiene como parametros a,b que seran los intervalos de la integral y n en caso de que se trabaje con aplicacion
%%multiple y f que sera la funcion con la cual se trabajara
%% De la funcion retornara x que sera el resultado final de nuestra aproximacion.
function x=simpson38(a,b,f)
    v = linspace(a,b,4);
    x = ((b-a)*subs(f,v(1))+3*subs(f,v(2))+3*subs(f,v(3))+subs(f,v(4)))/(8);
end
