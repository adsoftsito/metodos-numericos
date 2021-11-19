%This is for inputs
%m=inputdlg('Enter the 1st order ODE or slope function:');
%s=m{:};
%d=str2func(['@(x,y)' s]);
%f=str2func(['@(x,y)' vectorize(s)]);
f=@(x) 3*x^2; %Write your f(x,y) function, where dy/dx=f(x,y), x(x0)=y0.

x=0;
y=0;
h=0.15;
order=0;
order2=0;
n=0;
term=0;

itr=20
fprintf('\n');
%This is for labels
q='itrn';
w='x value';
b='current y';
t='solved y';
o='slope value';
k='      ';
a=[q,k,w,k,b,k,t,k,o];
disp(a);

%This is the 2nd order Ralston's loop program
for i=1:itr+1
    l=x;
    p=y;
    x=x+(0.75*h);
    k1=f(l,p);
    y=y+(0.75*k1*h);
    k2=f(x,y);
    fr=(k1/3)+(2*k2/3);
    y=p+(h*fr);
    x=l+h;
    fprintf('%2.0f %13.4f %13.4f %13.4f %17.4f\n',n,l,p,y,fr);
    n=n+1;
end
