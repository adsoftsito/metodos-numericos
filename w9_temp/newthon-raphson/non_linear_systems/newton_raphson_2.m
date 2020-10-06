clc
%% x(1) --> x
%% x(2) --> y
%% x(3) --> z
%% x(4) --> w

%%F= @(x) [
%%          x(1)   + 2 * x(2)   - 2;
%%          x(1)^2 + 4 * x(2)^2 - 4
%%        ];

%%J= @(x) [ 
%%               1,        2;
%%          2*x(1), 8 * x(2)
%%        ];
%%x = [1; 1];

F= @(x) [ x(1)^2   + x(2)^2 - 10;
          x(1)  -    x(2)];    
J= @(x) [ 2*x(1), 2*x(2);
             1,  -1 ];        
x = [1; 1];
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
