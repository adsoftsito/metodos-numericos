clc

F= @(x) [ 
    x(1)^3 + x(2)^3 - x(3)^3 - 129;
    x(1)^2 + x(2)^2 - x(3)^2 - 9.75;
    x(1) + x(2) - x(3) - 9.49;
       ];

J= @(x) [ 
    3*x(1)^2, 3*x(2)^2, -3*x(3)^2;
      2*x(1),   2*x(2), -2*x(3);
            1,        1,     -1;
    ];

x = [4; 2; -3];

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
F([4.357338, 1.666565, -3.466097])

