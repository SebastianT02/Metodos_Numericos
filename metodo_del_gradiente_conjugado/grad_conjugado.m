% METODO DE GRADIENTE CONJUGADO: Solucion de ecuaciones con punto optimo
%
%       grad_conjugado(f1, x0, max_iter, tol, iter) llenar
%       [sol1, sol2, sol3] = grad_conjugado
%       f1 = funcion con la que se va a trabajar
%       x0 = vector que contiene a los valores iniciales de las variables
%       iter = inicio de las iteraciones
%       max_iter = numero maximo de iteraciones
%       tol = toleracia maxima que soporta la respuesta
%
%   Copyright 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2022/01/16 $
%   Built-in function.
function [sol1, sol2, sol3] = grad_conjugado(f1, x0, max_iter, tol, iter)
    % Asigna y Declara variables
    format short;
    fx = inline(f1);                  % Transforma en inline para fluidez y manipulacion de la funcion
    fobj = @(x) fx(x(:,1),x(:,2));    % Obtiene funcion objetivo para el metodo de gradiente conjugado

    % Obtencion del gradiente de la funcion a resolver
    grad = gradient(f1);              % Utiliza la funcion gradiente a calcular             
    G = inline(grad);                 % Transforma a funcion inline
    gradx = @(x) G(x(:,1),x(:,2));    % Funcion objetivo del gradiente de funcion principal

    % Calcula la matriz hessiana de la funcion principal
    H1 = hessian(f1);                 % Utliza funcion hessian
    Hx = inline(H1);                  % Transforma a funcion inline
    
    X = [];                           % Creacion de matriz para guardar datos
    S = 0;                            % Direccion de busqueda inicial
    Gpr = -gradx(x0);                 % Calculo inicial vector gradiente f(i-1)
    
    % Comprobacion del error
    if norm(Gpr)==0    % Error del vector inicial
        msgID = 'No puede encontrar el Beta (i)';
        msg = 'Error: Vector inicial, imposible de encontrar Bi';
        %baseException = MException(msgID,msg);
        %throw(baseException);
        error(msgID,msg);
    end
    
    
    % Comprueba el valor optimo de Xi+1
    while norm(gradx(x0))>tol && iter<max_iter
        X = [X;x0];                  % Salva todos los vectores
        Gi = gradx(x0);              % Calculo del gradiente de X
        H = Hx(x0);                  % Calculo del la matriz hessiana en X
        bet = norm(Gi).^2./norm(Gpr).^2; % Calculo de beta
        S = Gi + bet.^S;             % Calculo de la direccion 'S'
        lam = Gi'*Gi./(S'*H*S);      % Calculo de lambda
        Xnew = x0+lam.*S';           % Actualiza X
        x0 = Xnew;                   % Salva el nuevo X
        Gpr = Gi;                    % Actualiza el gradiente F(i-1)
        iter = iter+1;
    end
    % Actualiza las variables a salir de la funcion del gradiente conjugado
    sol1 = x0(1);
    sol2 = x0(2);
    sol3 = fobj(x0);
end