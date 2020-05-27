clear all
clc
f=@(x,y) x - y + 2; %Write your f(x,y) function, where dy/dx=f(x,y), x(x0)=y0.
x0=input('\n Enter initial value of x i.e. x0: '); %example x0=0
y0=input('\n Enter initial value of y i.e. y0: '); %example y0=0.5
xn=input('\n Enter the final value of x: ');% where we need to find the value of y 
                                            %example x=2
h=input('\n Enter the step length h: '); %example h=0.2
 %Formula: y1=y0+h*fun(x0,y0);
 fprintf('\n x        y ');
while x0<=xn
    fprintf('\n%4.3f  %4.3f ',x0,y0); %values of x and y
    y1=y0+h*f(x0,y0);
    x1=x0+h;
    x0=x1;
    y0=y1;  
end