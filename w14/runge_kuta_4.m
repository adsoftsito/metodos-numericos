clear all;
clc;
% dydt=@(t,y) y+cos(t); %introducir funcion
f=@(x) 3*x^2; %Write your f(x,y) function, where dy/dx=f(x,y), x(x0)=y0.

a=0; %inicio de simulacion
b=3; %fin de simulacion
yinit=0; %conducion inicial 
n=20; %pasos totales;
%elegir el metodo de Runge訪utta para resolver
    dt=((b-a)/n);
    dt
    x = 0:dt:3;   % Calculates upto y(3)
    x
    y = zeros(1,length(x)); 
    y(1) = yinit;                                          % initial condition
    for i=1:(length(x)-1)                              % calculation loop
        k_1 = f(x(i),y(i));
        k_2 = f(x(i)+0.5*dt,y(i)+0.5*dt*k_1);
        k_3 = f((x(i)+0.5*dt),(y(i)+0.5*dt*k_2));
        k_4 = f((x(i)+dt),(y(i)+k_3*dt));
        y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*dt;  % main equation
        y(i+1)       
    end
%    plot(x,y)
