clear all
clc
x=input('x inicial =');
y=input('y inicial =');
h=input('h=');
f=@(x,y) x - y + 2; %Write your f(x,y) function, where dy/dx=f(x,y), x(x0)=y0.
%f=@(x,y) 3*x^2; %Write your f(x,y) function, where dy/dx=f(x,y), x(x0)=y0.

l=input('num. segmentos :');
i=0;c=zeros(1,1);z=0;
 disp('  i       x_i         z_i        y_i')
while(i < (l+1))
    fprintf('%3i %11.6f %11.6f %11.6f\n',i,x,z,y);
    a=f(x,y);
    z=y+h*a;
    x=h+x;
    yn=y+h*0.5*(f(x,z)+a);
    y=yn;
    z=z;
    i=i+1;

end