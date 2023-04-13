sigma = 10;
beta = 8/3;
rho = 28;

tRange = [0 30];
init1 = [0 1 1.05];

[T,Xs] = ode45(@(T,X) F(T, X, sigma, rho, beta), tRange, init1);
plot3(Xs(:,1),Xs(:,2),Xs(:,3))


function dx = F(T, X, sigma, rho, beta)
    % x' = sigma*(y-x)
    % y' = x*(rho - z) - y
    % z' = x*y - beta*z
    % typical values: rho = 28; sigma = 10; beta = 8/3;
    dx = zeros(3,1);
    dx(1) = sigma*(X(2) - X(1));
    dx(2) = X(1)*(rho - X(3)) - X(2);
    dx(3) = X(1)*X(2) - beta*X(3);
    return
end