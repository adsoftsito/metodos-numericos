clc

F= @(x) [ ];

J= @(x) [];
x = [ ];



error = 1e3;
tol = 1e-5;
n = 0;

while error > tol
    dx = -J(x)\F(x);
    error = norm(dx)/norm(x);
    x = x + dx;
    n = n+1;
end
fprintf("Iteraciones : %d \n",n);

fprintf("Respuesta : %f \n", x.');

F([2.236068, 2.236068])
