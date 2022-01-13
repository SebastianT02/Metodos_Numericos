function [sol1, sol2, sol3] = descensograd(f1, x0, max_iter, tol, iter)

 % Comprobamos el Error
    if max_iter < iter
        error("Ec.Calor:La cant de particion debe tener la forma nxm");
    end
    
    fx = inline(f1);
    fobj = @(x) fx(x(:,1),x(:,2));

    %Encontramos el gradiente de f
    grad = gradient(f1);
    G = inline(grad);
    gradx = @(x) G(x(:,1),x(:,2));

    %Realizamos la matriz hessiana
    H1 = hessian(f1);
    Hx = inline(H1);
    
    X = [];
    
    %Vamos a comprobar el valor optimo de Xi+1
    while norm(gradx(x0))>tol && iter<max_iter
        X = [X;x0];
        S = -gradx(x0);
        H = Hx(x0);
        lam = S'*S./(S'*H*S);
        Xnew = x0+lam.*S';
        x0 = Xnew;
        iter = iter+1;
    end
    sol1 = x0(1);
    sol2 = x0(2);
    sol3 = fobj(x0);
end